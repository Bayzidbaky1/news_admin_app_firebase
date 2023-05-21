import 'dart:io';

import 'package:amin_app/Widget/custom_button.dart';
import 'package:amin_app/pages/route/route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../app_style/app_style.dart';

class SliderImage extends StatefulWidget {
  const SliderImage({super.key});

  @override
  State<SliderImage> createState() => _SliderImageState();
}

class _SliderImageState extends State<SliderImage> {
  XFile? image;
  final ImagePicker _picker = ImagePicker();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;
 

  uploadData() async {
    try {
      // show the loading indicator
      // progressDialog();
      File imgFile = File(image!.path);
      // upload to stroage
      UploadTask _uploadTask =
          storage.ref('Slider_image').child(image!.name).putFile(imgFile);

      TaskSnapshot snapshot = await _uploadTask;
      // get the image download link
      var imageUrl = await snapshot.ref.getDownloadURL();
      // store the image & name to our database
      firestore.collection('Slider_image').add(
        {
          'image': imageUrl,
        },
      ).whenComplete(
        () {
          // after adding data to the database
          AppStyle().successSnackBar("data Added Sucessfully");

          image = null;
        },
      );
    } catch (e) {
      // if try block doesn't work
      print(e);
      AppStyle().faildSnackBar('something is wrong');
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Add News Slider Image",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25,right: 25,top: 30),
        child: Column(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: image == null
                  ? Center(
                      child: Stack(children: [
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: IconButton(
                              onPressed: () async {
                                image = await _picker.pickImage(
                                    source: ImageSource.gallery);
                                setState(() {});
                              },
                              icon: Icon(
                                Icons.camera_alt_rounded,
                                size: 30,
                              ),
                            )),
                      ]),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.file(
                        File(image!.path),
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton("Submit", () {
              uploadData();
              Get.toNamed(sliderDetails);
            })
          ],
        ),
      ),
    );
  }
}

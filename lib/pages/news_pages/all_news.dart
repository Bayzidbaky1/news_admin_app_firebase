import 'dart:io';
import 'package:amin_app/app_style/app_style.dart';
import 'package:amin_app/pages/route/route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../Widget/custom_button.dart';
import '../../Widget/custom_textFIeld.dart';

class AllNews extends StatefulWidget {
  const AllNews({super.key});

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  XFile? image;
  final ImagePicker _picker = ImagePicker();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;

  progressDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  uploadData() async {
    try {
      // show the loading indicator
      // progressDialog();
      File imgFile = File(image!.path);
      // upload to stroage
      UploadTask _uploadTask =
          storage.ref('images').child(image!.name).putFile(imgFile);

      TaskSnapshot snapshot = await _uploadTask;
      // get the image download link
      var imageUrl = await snapshot.ref.getDownloadURL();
      // store the image & name to our database
      firestore.collection('All_news').add(
        {
          'title': _titleController.text,
          'description': _descriptionController.text,
          'Date_time': _timeController.text,
          'location': _locationController.text,
          'image': imageUrl,
        },
      ).whenComplete(
        () {
          // after adding data to the database
          AppStyle().successSnackBar("data Added Sucessfully");

          _titleController.clear();
          _descriptionController.clear();
          _timeController.clear();
          _locationController.clear();
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
          "All news",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
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
                customTextFIeld(
                  _titleController,
                  "title",
                  "title",
                  Icons.title,
                  TextInputType.emailAddress,
                  (val) {
                    if (val!.isEmpty) {
                      return "field can't be empty";
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                customTextFIeld(
                  _descriptionController,
                  "description",
                  "description",
                  Icons.title,
                  TextInputType.text,
                  
                  (val) {
                    if (val!.isEmpty) {
                      return "field can't be empty";
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                customTextFIeld(
                  _timeController,
                  "date & time",
                  "date & time",
                  Icons.punch_clock,
                  TextInputType.text,
                  (val) {
                    if (val!.isEmpty) {
                      return "field can't be empty";
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                customTextFIeld(
                  _locationController,
                  "city",
                  "city",
                  Icons.location_on,
                  TextInputType.text,
                  
                  (val) {
                    if (val!.isEmpty) {
                      return "field can't be empty";
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButton("Add All News", () {
                  uploadData();
                  Get.toNamed(allNewsDetails);
                }),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:amin_app/app_style/app_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SliderDetails extends StatelessWidget {
  SliderDetails({super.key});

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final Stream<QuerySnapshot> _sliderStream =
      FirebaseFirestore.instance.collection('Slider_image').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Image Details",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: _sliderStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Something went wrong'));
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: Text("Loading"));
              }

              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, top: 12),
                    child: Card(
                      color: Colors.grey.shade200,
                      elevation: 3,
                      child: Container(
                          height: 120,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.network(
                                data['image'],width: 140,height: 120,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 40),
                                child: Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.edit,
                                          color: Colors.green,
                                          size: 32,
                                        )),
                                    IconButton(
                                        onPressed: () {
                                          firestore
                                              .collection('Slider_image')
                                              .doc(document.id)
                                              .delete()
                                              .then((value) => AppStyle()
                                                  .successSnackBar(
                                                      'deleted Successfully'))
                                              .catchError((error) => AppStyle()
                                                  .faildSnackBar(error));
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.redAccent,
                                          size: 32,
                                        )),
                                  ],
                                ),
                              )
                            ],
                          )),
                    ),
                  );
                }).toList(),
              );
            }));
 
 
  }
}

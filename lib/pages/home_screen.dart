import 'package:amin_app/app_style/app_color.dart';
import 'package:amin_app/pages/route/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Add News Property",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.toNamed(recentNews);
                },
                child: Text(
                  "Add recent news",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                )),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed(allNews);
                },
                child: Text(
                  "All News",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                )),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed(slider);
                },
                child: Text(
                  "slider Image",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                )),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: (){
                    Get.toNamed(sliderDetails);
                  },
                  child: Container(
                    height: 40,
                    color: AppColor.button_color,
                    child: Center(
                        child: Text(
                      'Slider Page',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    )),
                  ),
                ),

                 InkWell(
                  onTap: (){
                    Get.toNamed(recentDetails);
                    
                  },
                  child: Container(
                    height: 40,
                    color: AppColor.button_color,
                    child: Center(
                        child: Text(
                      'recent Page',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    )),
                  ),
                ),
                 InkWell(
                  onTap: (){
                    Get.toNamed(allNewsDetails);
                  },
                  child: Container(
                    height: 40,
                    color: AppColor.button_color,
                    child: Center(
                        child: Text(
                      'All Page',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    )),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

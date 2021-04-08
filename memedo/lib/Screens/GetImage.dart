import 'dart:io';

import 'package:flutter/material.dart';
import 'package:memedo/SetAndVar/routes.dart';
import 'package:memedo/SetAndVar/util.dart';
import 'package:memedo/SetAndVar/variables.dart';
import 'package:image_picker/image_picker.dart';

class GetImage extends StatefulWidget {
  @override
  _GetImageState createState() => _GetImageState();
}

class _GetImageState extends State<GetImage> {

  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text('MeMeDo',
          style: TextStyle(
            fontFamily: 'Marker',
            fontSize: 30,
            fontWeight: FontWeight.w100,
          ),
        ),),
      ),
      body: Container(
        width: screenWidth,
        height: screenHeight,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Wrap(
            children: [
              GestureDetector(
                onTap: () async {
                  final pickedFile = await picker.getImage(source: ImageSource.camera);
                  setState(() {
                    if (pickedFile != null) {
                      image = File(pickedFile.path);
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                      Navigator.pushNamed(context, homePageRouteCode);
                    } else {
                      print('No image selected.');
                    }
                  });
                },
                child: Container(
                  width: screenWidth/2,
                  height: 200,
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(2, 2), // changes position of shadow
                          ),
                        ],
                        color: Colors.grey[300],
                      ),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.camera_alt,size: 40,),
                            SizedBox(height: 5,),
                            Text("Camera",style: TextStyle(fontSize: 18),)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: ()async {
                  final pickedFile = await picker.getImage(source: ImageSource.gallery);
                  setState(() {
                    if (pickedFile != null) {
                      image = File(pickedFile.path);
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                      Navigator.pushNamed(context, homePageRouteCode);
                    } else {
                      print('No image selected.');
                    }
                  });
                },
                child: Container(
                  width: screenWidth/2,
                  height: 200,
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(2, 2), // changes position of shadow
                          ),
                        ],
                        color: Colors.grey[300],
                      ),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.add_photo_alternate_outlined,size: 40,),
                            SizedBox(height: 5,),
                            Text("Gallery",style: TextStyle(fontSize: 18),)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              for(int i=1;i<=10;i++) GestureDetector(
                onTap: (){
                  setState(() {
                    index = i;
                    clearAll();
                  });
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, homePageRouteCode);
                },
                child: Container(
                  width: screenWidth/2,
                  height: 200,
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  child: Center(
                    child: Container(
                      child: Center(
                        child: Image.asset('Assets/Images/meme'+ i.toString() + '.jpg',)
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

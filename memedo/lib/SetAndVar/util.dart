import 'dart:typed_data';
import 'dart:io' as Io;
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gallery_saver_safety/gallery_saver_safety.dart';
import 'package:memedo/SetAndVar/routes.dart';
import 'package:memedo/SetAndVar/variables.dart';
import 'package:path_provider/path_provider.dart';

Color choosecolor(String _selectedColors){
  if(_selectedColors == "Black"){
    return Colors.black;
  }else if(_selectedColors == "Red"){
    return Colors.red;
  }else if(_selectedColors == "Green"){
    return Colors.green;
  }else if(_selectedColors == "White"){
    return Colors.white;
  }else if(_selectedColors == "Yellow"){
    return Colors.yellow;
  }else if(_selectedColors == "Blue"){
    return Colors.blue;
  }else if(_selectedColors == "Orange"){
    return Colors.orange;
  }else if(_selectedColors == "Brown"){
    return Colors.brown;
  }else if(_selectedColors == "Purple"){
    return Colors.purple;
  }else if(_selectedColors == "Pink"){
    return Colors.pink;
  }else{
    return Colors.indigo;
  }
}

void BackToSquareOne(String _selectedText, String _selectedColors){
  list.add(headtext);
  left.add(lefti);
  top.add(topi);
  size.add(sizei);
  angle.add(angi);
  textStyle.add(_selectedText);
  color.add(choosecolor(_selectedColors));
  headtext = "";
  total+=1;
  lefti = 50.0;
  topi = 50.0;
  sizei = 40.0;
  angi = 0.0;
}

List<DropdownMenuItem<String>> buildAndGetDropDownMenuItems(List colors) {
  List<DropdownMenuItem<String>> items = [];
  for (String color in Colorsi) {
    items.add(DropdownMenuItem(value: color, child: Text(color)));
  }
  return items;
}

List<DropdownMenuItem<String>> buildAndGetDropDownMenuItemstext(List text) {
  List<DropdownMenuItem<String>> items = [];
  for (String text in textstyle) {
    items.add(DropdownMenuItem(value: text, child: Text(text,
      style: TextStyle(
        fontFamily: text,
      ),
    )));
  }
  return items;
}

Widget getthebutton(BuildContext context){
  if(visible){
    return Container(
      padding: EdgeInsets.fromLTRB(0.0, 0.0, (MediaQuery.of(context).size.width)/2 - 45, 0.0),
      child: Container(
        height: 60,
        width: 60,
        child: FloatingActionButton(
          backgroundColor: Colors.red[900],
          onPressed: (){Navigator.pushNamed(context, getImageRouteCode);},
          child: Icon(Icons.add_circle_outline,
            size: 50,),
        ),
      ),
    );
  }
}

Future<bool> takeScreenShot(GlobalKey globalKey) async{
  int randomNumber = random.nextInt(1000);
  RenderRepaintBoundary boundary = globalKey.currentContext.findRenderObject();
  ui.Image image = await boundary.toImage(pixelRatio: 5.0);
  final directory = (await getApplicationDocumentsDirectory()).path;
  ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  Uint8List pngBytes = byteData.buffer.asUint8List();
  Io.File imgFile = new Io.File('$directory/memedo$randomNumber.jpg');
  imgFile.writeAsBytes(pngBytes);
  imgFile.writeAsBytesSync(pngBytes);
  GallerySaver.saveImage(imgFile.path, albumName: "memedo").then((value){
    return value;
  });
  return true;
}

void clearAll(){
  list.clear();
  left.clear();
  top.clear();
  size.clear();
  angle.clear();
  textStyle.clear();
  color.clear();
  headtext = "";
  total = 0;
  lefti = 50.0;
  topi = 50.0;
  sizei = 40.0;
  angi = 0.0;
}
import 'package:flutter/material.dart';
import 'package:memedo/SetAndVar/variables.dart';

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
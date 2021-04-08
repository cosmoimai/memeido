import 'package:flutter/material.dart';
import 'package:memedo/Screens/GetImage.dart';
import 'package:memedo/Screens/Homepage.dart';

String homePageRouteCode = "/homepage";
String getImageRouteCode = "/homepage/getImage";

var routes = {
  homePageRouteCode : (BuildContext context) => HomePage(),
  getImageRouteCode : (BuildContext context) => GetImage()
};
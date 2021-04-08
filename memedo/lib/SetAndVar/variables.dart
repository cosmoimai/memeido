import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:io' as Io;

double screenHeight;
double screenWidth;
bool visible = true;
Io.File image;
List<String> list = [];
List<double> top = [];
List<double> left = [];
List<double> angle = [];
List<double> size = [];
List<Color> color = [];
List<String> textStyle = [];
List<Widget> textCell = [];
double topi = 50.0;
double lefti = 50.0;
double sizei = 40.0;
double angi = 0.0;
int total = 0;
String headtext = "";
List Colorsi = ["Black", "Red", "Green", "White", "Yellow", "Blue", "Orange", "Brown", "Purple", "Pink", "Indigo"];
List textstyle = ["Lobster", "Dark", "Marker", "Roboto", "Yellowtail", "Pangolin", "Piedra", "Indie", "Into_light", "Caveat"];
List<DropdownMenuItem<String>> dropDownMenuItemsTextstyle;
List<DropdownMenuItem<String>> dropDownMenuItems;
Random random = new Random();
int index = 10;
import 'dart:math';
import 'package:memedo/SetAndVar/util.dart';
import 'package:memedo/SetAndVar/variables.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  final GlobalKey globalKey = new GlobalKey();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String _selectedText;
  String _selectedColors;

  @override
  void initState() {
    dropDownMenuItems = buildAndGetDropDownMenuItems(Colorsi);
    _selectedColors = dropDownMenuItems[0].value;
    dropDownMenuItemsTextstyle = buildAndGetDropDownMenuItemstext(textstyle);
    _selectedText = dropDownMenuItemsTextstyle[0].value;
    super.initState();
  }

  void changedDropDownItem(String acolor) {
    setState(() {
      _selectedColors = acolor;
    });
  }

  void changedDropDownItemText(String atext) {
    setState(() {
      _selectedText = atext;
    });
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height-81;
    return Scaffold(
      key: _scaffoldKey,
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
          child: Column(
            children: [
              RepaintBoundary(
                key: globalKey,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black)
                  ),
                  height: screenHeight/2,
                  child: Center(
                    child: Stack(
                      children: [
                        image == null ? Container(
                            width: screenWidth,
                            child: Image.asset('Assets/Images/meme'+ index.toString() + '.jpg',)):
                        Center(child: Image.file(image, height: 300, width: MediaQuery.of(context).size.width,)),
                        for (int i=0;i<total;i++)Row(
                          children: <Widget>[
                            Container(
                              width: left[i],
                            ),
                            Column(
                              children: <Widget>[
                                Container(
                                  height: top[i],
                                ),
                                Container(
                                  child: Transform.rotate(
                                    angle: angle[i]*pi/180,
                                    child: Text(
                                      list[i],
                                      style: TextStyle(
                                        fontFamily: textStyle[i],
                                        fontSize: size[i],
                                        color: color[i],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              width: lefti,
                            ),
                            Column(
                              children: <Widget>[
                                Container(
                                  height: topi,
                                ),
                                Container(
                                  child: Transform.rotate(
                                    angle: angi*pi/180,
                                    child: Text(headtext,
                                      style: TextStyle(
                                        fontFamily: _selectedText,
                                        fontSize: sizei,
                                        color: choosecolor(_selectedColors),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: new TextField(
                  onTap: () {visible = false;},
                  onEditingComplete: () {visible = true;},
                  onChanged: (val){
                    setState(() {
                      headtext = val;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Add Text",
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 0.0),
                    child: Column(
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                          setState(() {
                            visible = true;
                            topi -= 10;
                            if(topi <= 0){
                              topi = 0;
                            }
                          });
                        },
                          child: Icon(Icons.arrow_upward),
                        ),
                        ElevatedButton(
                          onPressed: () {
                          setState(() {
                            visible = true;
                            topi += 10;
                            if(topi >= 340){
                              topi = 340;
                            }
                          });
                        },
                          child: Icon(Icons.arrow_downward),
                        ),
                        ElevatedButton(
                          onPressed: () {
                          setState(() {
                            visible = true;
                            sizei += 5;
                            if(sizei >= 150){
                              sizei = 150;
                            }
                          });
                        },
                          child: Icon(Icons.add),
                        ),
                        ElevatedButton(
                          onPressed: () {
                          setState(() {
                            visible = true;
                            angi -= 10;
                            angi %= 360;
                          });
                        },
                          child: Icon(Icons.rotate_left),
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              DropdownButton(
                                value: _selectedColors,
                                items: dropDownMenuItems,
                                onChanged: changedDropDownItem,
                              ),
                              Icon(Icons.color_lens),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0.0),
                    child: Column(
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                          final snackbar = SnackBar(
                            content: Text("Meme Updated"),
                            duration: Duration(seconds: 2),
                            action: SnackBarAction(
                                label: "Ok",
                                onPressed: () {
                                  SnackBar(content: Text(""),
                                    duration: Duration(microseconds: 1),);
                                }
                            ),
                          );
                          _scaffoldKey.currentState.showSnackBar(snackbar);
                          setState(() {
                            BackToSquareOne(_selectedText,_selectedColors);
                            _selectedText = dropDownMenuItemsTextstyle[0].value;
                            _selectedColors = dropDownMenuItems[0].value;
                          });
                        },
                          child: Icon(Icons.done),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                          final snackbar = SnackBar(
                            content: Text("Saving . . ."),
                            duration: Duration(seconds: 3),
                          );
                          _scaffoldKey.currentState.showSnackBar(snackbar);
                          await takeScreenShot(globalKey).then((value){
                            if(value){
                              final snackBar = SnackBar(
                                content: Text("Saved."),
                                duration: Duration(seconds: 1),
                              );
                              _scaffoldKey.currentState.showSnackBar(snackBar);
                            }
                            else{
                              final snackBar = SnackBar(
                                content: Text("Error! Try Again."),
                                duration: Duration(seconds: 1),
                              );
                              _scaffoldKey.currentState.showSnackBar(snackBar);
                            }
                          });
                        },
                          child: Icon(Icons.save),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                          final snackbar = SnackBar(
                            content: Text("Saving . . ."),
                            duration: Duration(seconds: 3),
                          );
                          _scaffoldKey.currentState.showSnackBar(snackbar);
                          await takeScreenShot(globalKey).then((value){
                            if(value){
                              final snackBar = SnackBar(
                                content: Text("Saved."),
                                duration: Duration(seconds: 1),
                              );
                              _scaffoldKey.currentState.showSnackBar(snackBar);
                            }
                            else{
                              final snackBar = SnackBar(
                                content: Text("Error! Try Again."),
                                duration: Duration(seconds: 1),
                              );
                              _scaffoldKey.currentState.showSnackBar(snackBar);
                            }
                          });
                          final snackBar = SnackBar(
                            content: Text("Saved."),
                            duration: Duration(seconds: 1),
                          );
                          _scaffoldKey.currentState.showSnackBar(snackBar);
                          // await Share.file('mememaker$randomNumber.png', 'mememaker$randomNumber.jpg', byteData.buffer.asUint8List(), 'image/png', text: 'Wants to make meme like this? download the app from https://github.com/Tushargupta9800');
                        },
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.save),
                              Text('&',
                                style: TextStyle(
                                  fontSize: 15,
                                ),),
                              Icon(Icons.share),
                            ],
                          ),
                        ),
                        Container(
                          height: 95.0,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0.0,),
                    child: Column(
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                          setState(() {
                            visible = true;
                            lefti -= 10;
                            if(lefti <= 0){
                              lefti = 0;
                            }
                          });
                        },
                          child: Icon(Icons.arrow_back),
                        ),
                        ElevatedButton(
                          onPressed: () {
                          setState(() {
                            visible = true;
                            lefti += 10;
                            if(lefti >= screenWidth){
                              lefti = screenWidth;
                            }
                          });
                        },
                          child: Icon(Icons.arrow_forward),
                        ),
                        ElevatedButton(
                          onPressed: () {
                          setState(() {
                            visible = true;
                            sizei -= 5;
                            if(sizei <= 5){
                              sizei = 5;
                            }
                          });
                        },
                          child: Icon(Icons.remove),
                        ),
                        ElevatedButton(
                          onPressed: () {
                          setState(() {
                            visible = true;
                            angi += 10;
                            angi %= 360;
                          });
                        },
                          child: Icon(Icons.rotate_right),
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              DropdownButton(
                                value: _selectedText,
                                items: dropDownMenuItemsTextstyle,
                                onChanged: changedDropDownItemText,
                              ),
                              Icon(Icons.text_fields),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ),
      floatingActionButton: getthebutton(context),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:secondnumber/components/shortButton.dart';
import 'package:secondnumber/constants.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:secondnumber/components/border_text_field.dart';
import 'package:secondnumber/components/phone_ftextfield.dart';
import 'package:secondnumber/components/primary_button.dart';
import 'package:secondnumber/core/utils/image_constant.dart';
import 'package:secondnumber/routes/bottom_nav.dart';

import '../welcome/getstarted_screen.dart';

class SelectAreaCodeScreen extends StatefulWidget {
  const SelectAreaCodeScreen({Key? key}) : super(key: key);

  @override
  _SelectAreaCodeScreenState createState() => _SelectAreaCodeScreenState();
}

class _SelectAreaCodeScreenState extends State<SelectAreaCodeScreen> {
  var _switchValue = false;
  int? selectedIndex;

  TextEditingController controllerText = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Spacer(flex: 1),
            Container(
              padding: EdgeInsets.only(bottom: 10),
              alignment: Alignment.center,
              child: Text(
                "Select Area Code",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              alignment: Alignment.center,
              //  color: Colors.grey.shade300,
              padding: EdgeInsets.all(20),
              child: Container(
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  color: Colors.white,
                  width: 100,
                  height: 50,
                  child: new TextField(
                    onEditingComplete: () {
                      setState(() {
                        _switchValue = true;
                      });
                    },
                    onChanged: (v) {
                      setState(() {
                        _switchValue = true;
                      });
                    },
                    textAlign: TextAlign.center,
                    autofocus: true,
                    style: TextStyle(fontSize: 20),
                    keyboardType: TextInputType.text,
                    controller: controllerText,
                    decoration: new InputDecoration(
                      hintText: '503',
                      labelStyle: TextStyle(fontSize: 20),
                    ),
                    onSubmitted: (v) {
                      setState(() {
                        _switchValue = true;
                      });
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            _switchValue == false
                ? SpinKitFoldingCube(
                    itemBuilder: (BuildContext context, int index) {
                      return DecoratedBox(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(ImageConstant.imgNumbersign),
                          ),
                          //                      color: index.isEven ? Colors.black : Colors.grey,
                        ),
                      );
                    },
                  )
                : Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * .47,
                    width: 200,
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('(${controllerText.text}) 123 45$index'),
                          leading: selectedIndex == index
                              ? Icon(Icons.minimize)
                              : null,
                          tileColor: selectedIndex == index ? kgrey : null,
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                        );
                      },
                    ),
                  ),
            Spacer(
              flex: 1,
            ),
            PrimaryButton(
                text: "Select This Number",
                press: () {
                  if (_switchValue == true) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Select Number"),
                          content: Text(
                              "You Picked (503) 123-456 for your New Number"),
                          actions: [
                            Row(
                              children: [
                                ShortButton(
                                    text: "Confirm",
                                    press: () {
                                      Get.back();
                                       Get.to(() => MainBottomClass());
                                   //   Get.offAndToNamed('/mainlayout');
                                      //setState(() {
                                        currentIndex = 0;
                                     // });
                                      //Get.appUpdate();
                                    }),
                                ShortButton(
                                    text: "Cancel",
                                    press: () => Navigator.of(context).pop()),
                              ],
                            )
                          ],
                        );
                      },
                    );
                  }
                })
          ],
        ),
      ),
    );
  }

  Widget ListTitle() {
    return Container(
        width: 190,
        padding: EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            children: [
              Icon(
                CupertinoIcons.chat_bubble_text,
                size: 12,
              ),
              SizedBox(
                width: 5,
              ),
              Text("100 Text"),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                CupertinoIcons.photo,
                size: 12,
              ),
              SizedBox(
                width: 5,
              ),
              Text("Send Pics"),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                CupertinoIcons.phone,
                size: 12,
              ),
              SizedBox(
                width: 5,
              ),
              Text("50 Minutes"),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.recycling,
                size: 12,
              ),
              SizedBox(
                width: 5,
              ),
              Text("Auto Renew in 30 Days"),
            ],
          )
        ]));
  }
}

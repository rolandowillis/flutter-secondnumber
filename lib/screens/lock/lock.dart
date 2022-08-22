import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:secondnumber/components/border_text_field.dart';
import 'package:secondnumber/components/phone_ftextfield.dart';
import 'package:secondnumber/components/primary_button.dart';
import 'package:secondnumber/components/shortButton.dart';
import 'package:secondnumber/constants.dart';
import 'package:secondnumber/routes/bottom_nav.dart';

enum _Tab { one, two }

class LockScreen extends StatefulWidget {
  @override
  _LockScreenState createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  var _switchValue = true;
  _Tab _selectedTab = _Tab.one;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
            //  setState(() {
                currentIndex = 0;
            //  });
              Get.offAndToNamed('/mainlayout');
              //Get.appUpdate();
            },
          ),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
        ),
        body: SafeArea(
            child: Column(children: [
          // Spacer(flex: 1),
          Container(
            padding: EdgeInsets.only(bottom: 10),
            alignment: Alignment.center,
            child: Text(
              "Lock New Number",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Container(
                width: Get.width / 2,
                height: 3,
                color: _switchValue == true ? Colors.black54 : kgrey,
              ),
              Container(
                width: Get.width / 2,
                height: 3,
                color: _switchValue == true ? kgrey : Colors.black54,
              ),
            ],
          ),
          _switchValue == true
              ? Spacer(
                  flex: 1,
                )
              : SizedBox(height: 30),
          _switchValue == true
              ? Container(
                  child: Column(
                    children: [
                      Icon(
                        Icons.lock,
                        color: kgrey,
                        size: 80,
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: Text(
                            "You have to enter pin code to lock New Number"),
                      )
                    ],
                  ),
                )
              : Container(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.all(20),
                        child: Text("Enter pin and do not share with others"),
                      ),
                      BorderTextField(
                        suffixIcon: "show",
                        hintText: "Enter your security pin",
                      ),
                    ],
                  ),
                ),
          Spacer(
            flex: 1,
          ),
          PrimaryButton(
              text: _switchValue == true ? "Enter Pin" : "Lock",
              press: () {
                if (_switchValue == true) {
                  setState(() {
                    _switchValue = false;
                  });
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Lock Number"),
                        content: Text(
                            "Are you sure to lock this number\n (503) 123-456?"),
                        actions: [
                          Row(
                            children: [
                              ShortButton(
                                  text: "Confirm",
                                  press: () {
                                    Get.back();
                                     Get.to(() => MainBottomClass());
                                 //   Get.offAndToNamed('/mainlayout');
                                 //   setState(() {
                                      currentIndex = 0;
                                 //   });
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
        ])));
  }
}

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:secondnumber/components/border_text_field.dart';
import 'package:secondnumber/components/phone_ftextfield.dart';
import 'package:secondnumber/components/primary_button.dart';
import 'package:secondnumber/constants.dart';
import 'package:secondnumber/core/utils/color_constant.dart';
import 'package:secondnumber/core/utils/math_utils.dart';
import 'package:secondnumber/screens/reg/interest.dart';
import 'package:secondnumber/screens/subscription/buy_plan_screen.dart';

import '../welcome/getstarted_screen.dart';

class SubscriptionScreen extends StatefulWidget {
  @override
  _SubscriptionScreenState createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  var _switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: kgrey,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Spacer(flex: 1),
            Container(
              padding: EdgeInsets.only(bottom: 10),
              color: kgrey,
              alignment: Alignment.center,
              child: Text(
                "Subscription",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: kgrey,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey, spreadRadius: .5, blurRadius: 10),
                ],
              ),
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      "3  Credits",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Container(
                    child: Text(
                      "1  Auto Renewing Line",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
              ),
              // padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    child: Container(
                      width: Get.width / 2,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          border: Border.all(color: kPrimaryColor)),
                      alignment: Alignment.center,
                      child: Text(
                        "Add Credit",
                      ),
                    ),
                    onTap: () => null,
                  ),
                  GestureDetector(
                    child: Container(
                      width: Get.width / 2,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          border: Border.all(color: kPrimaryColor)),
                      alignment: Alignment.center,
                      child: Text(
                        "Create New Number",
                      ),
                    ),
                    onTap: () => Get.to(() => BuyPlanScreen()),
                  ),
                ],
              ),
            ),
            tileList(),

            Spacer(flex: 1),
            Container(
                width: Get.width,
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      width: Get.width / 2,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("John Doe"),
                            Text("(799) 123 456 789"),
                          ]),
                    ),
                    FlatButton(
                      child: Text(
                        "Log Out",
                        style: TextStyle(fontSize: 20.0),
                      ),
                      onPressed: () => null,
                    )
                  ],
                )),
            Container(
                width: Get.width,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FlatButton(
                      child: Text(
                        "Terms",
                      ),
                      onPressed: () => null,
                    ),
                    FlatButton(
                      child: Text(
                        "Privacy Policy",
                      ),
                      onPressed: () => null,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Widget tileList() {
    return Column(
      children: [
        ListTile(
          title: Text("Contacts"),
          leading: Icon(Icons.call_outlined),
        ),
        Divider(),
        ListTile(
          title: Text("Settings"),
          leading: Icon(Icons.settings_outlined),
        ),
        Divider(),
        ListTile(
            title: Text("Do not Disturb"),
            leading: Icon(CupertinoIcons.minus_circle),
            trailing: Transform.scale(
                scale: 0.5,
                child: Container(
                  width: 80,
                  child: CupertinoSwitch(
                    activeColor: kPrimaryColor,
                    value: _switchValue,
                    onChanged: (value) {
                      setState(() {
                        _switchValue = value;
                      });
                    },
                  ),
                ))),
        Divider(),
        ListTile(
          title: Text("Contact Support"),
          leading: Icon(Icons.support_agent_sharp),
        ),
        Divider(),
      ],
    );
  }
}

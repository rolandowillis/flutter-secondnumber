import 'package:flutter/material.dart';
import 'package:secondnumber/constants.dart';
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
import 'package:secondnumber/screens/settings/select_area_code_screen.dart';

import '../welcome/getstarted_screen.dart';

class VoiceMailScreen extends StatefulWidget {
  const VoiceMailScreen({Key? key}) : super(key: key);

  @override
  _VoiceMailScreenState createState() => _VoiceMailScreenState();
}

class _VoiceMailScreenState extends State<VoiceMailScreen> {
  var _switchValue = true;
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
                "Select Friendly Name",
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
                child: Text(
                  "Sara Amy",
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(fontWeight: FontWeight.w400),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            ListTitle(),
            Spacer(
              flex: 1,
            ),
            PrimaryButton(
                text: "Continue",
                press: () {
                  Get.to(() => SelectAreaCodeScreen());
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

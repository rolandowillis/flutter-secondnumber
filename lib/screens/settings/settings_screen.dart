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
import 'package:secondnumber/routes/bottom_nav.dart';
import 'package:secondnumber/screens/reg/interest.dart';
import 'package:secondnumber/screens/settings/voice_mail_screen.dart';

import '../welcome/getstarted_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  var _switchValue = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            //   setState(() {
            currentIndex = 0;
            //   });
            Get.to(() => MainBottomClass());
            //  Get.offAndToNamed('/mainlayout');
            //Get.appUpdate();
          },
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            // Spacer(flex: 1),
            Container(
              padding: EdgeInsets.only(bottom: 10),
              alignment: Alignment.center,
              child: Text(
                "Settings",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              color: Colors.grey.shade300,
              padding: EdgeInsets.all(20),
              child: Container(
                child: Text(
                  "newNumber",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
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
                      //  decoration: BoxDecoration(
                      //      border: Border.all(color: kPrimaryColor)),
                      alignment: Alignment.centerLeft,
                      child: Text("(530) 123 456",
                          style: TextStyle(color: Colors.black, fontSize: 20)),
                    ),
                    onTap: () => null,
                  ),
                  GestureDetector(
                    child: Container(
                      width: Get.width / 2,
                      padding: EdgeInsets.all(20),
                      //   decoration: BoxDecoration(
                      //       border: Border.all(color: kPrimaryColor)),
                      alignment: Alignment.center,
                      child: Text(
                        "limied Calls,Texts and Pics",
                      ),
                    ),
                    onTap: () => null,
                  ),
                ],
              ),
            ),

            CallSettings(),
            TextSettings(),
          ],
        ),
      ),
    );
  }

  Widget CallSettings() {
    return Column(
      children: [
        Container(
          width: Get.width,
          padding: EdgeInsets.all(20),
          //  decoration: BoxDecoration(
          //      border: Border.all(color: kPrimaryColor)),
          alignment: Alignment.centerLeft,
          child: Text("Call Settings",
              style: TextStyle(color: Colors.black, fontSize: 20)),
        ),
        ListTile(
          dense: true,
          visualDensity: VisualDensity(vertical: -3), // to compact

          title: Text("    Rings"),
          trailing: Transform.scale(
            scale: 0.6,
            child: CupertinoSwitch(
              value: _switchValue,
              activeColor: kPrimaryColor,
              onChanged: (bool value) {
                setState(() {
                  _switchValue = value;
                });
              },
            ),
          ),
        ),
        Divider(),
        ListTile(
          dense: true,
          visualDensity: VisualDensity(vertical: -3), // to compact

          title: Text("    Notifications"),
          trailing: Transform.scale(
            scale: 0.6,
            child: CupertinoSwitch(
              value: _switchValue,
              activeColor: kPrimaryColor,
              onChanged: (bool value) {
                setState(() {
                  _switchValue = value;
                });
              },
            ),
          ),
        ),
        Divider(),
        ListTile(
          dense: true,
          visualDensity: VisualDensity(vertical: -3), // to compact

          title: Text("     Voice Mail Greetings"),
          trailing: GestureDetector(
            child: Container(
              width: 40,
              height: 20,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(color: kPrimaryColor),
                  borderRadius: BorderRadius.circular(20)),
              padding: EdgeInsets.all(2),
              // margin: EdgeInsets.all(5),
              child: Text(
                "Edit",
                style: TextStyle(color: kPrimaryColor, fontSize: 10),
              ),
            ),
            onTap: () {
              Get.to(() => VoiceMailScreen());
            },
          ),
        ),
        Divider(),
        ListTile(
          dense: true,
          visualDensity: VisualDensity(vertical: -3), // to compact

          title: Text("    Forward Calls to Voice Mails"),
          trailing: Transform.scale(
            scale: 0.6,
            child: CupertinoSwitch(
              value: _switchValue,
              activeColor: kPrimaryColor,
              onChanged: (bool value) {
                setState(() {
                  _switchValue = value;
                });
              },
            ),
          ),
        ),
        Divider(),
        ListTile(
            dense: true,
            visualDensity: VisualDensity(vertical: -3), // to compact

            title: Text("     Inbound Caller ID"),
            subtitle: Text(
                "     Show inbound calls as New Number contact or caller's\n     phone number"),
            trailing: Container(
              width: 40,
              height: 20,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(color: kPrimaryColor),
                  borderRadius: BorderRadius.circular(20)),
              padding: EdgeInsets.all(2),
              // margin: EdgeInsets.all(5),
              child: Text(
                "Caller",
                style: TextStyle(color: kPrimaryColor, fontSize: 10),
              ),
            )),
        Divider(),
        ListTile(
            dense: true,
            visualDensity: VisualDensity(vertical: -3), // to compact

            title: Text("     Appearance"),
            trailing: IconButton(
              icon: Icon(Icons.keyboard_arrow_right_outlined),
              onPressed: () => null,
            )),
        Divider(),
      ],
    );
  }

  Widget TextSettings() {
    return Column(
      children: [
        Container(
          width: Get.width,
          padding: EdgeInsets.all(20),
          //  decoration: BoxDecoration(
          //      border: Border.all(color: kPrimaryColor)),
          alignment: Alignment.centerLeft,
          child: Text("Text Settings",
              style: TextStyle(color: Colors.black, fontSize: 20)),
        ),
        ListTile(
          dense: true,
          visualDensity: VisualDensity(vertical: -3), // to compact

          title: Text("    Text Tone"),
          trailing: Text(
            "Default",
            style: TextStyle(color: kgrey),
          ),
        ),
        Divider(),
        ListTile(
          dense: true,
          visualDensity: VisualDensity(vertical: -3), // to compact

          title: Text("    Auto Reply to Text"),
          subtitle: Text(
              "    When turned on, people will recieve auto reply\n    messages from your New Number."),
          trailing: Transform.scale(
            scale: 0.6,
            child: CupertinoSwitch(
              value: _switchValue,
              activeColor: kPrimaryColor,
              onChanged: (bool value) {
                setState(() {
                  _switchValue = value;
                });
              },
            ),
          ),
        ),
        Divider(),
        ListTile(
          dense: true,
          visualDensity: VisualDensity(vertical: -3), // to compact

          title: Text("    Default"),
          subtitle: Text(
              "    Hi, Thanks for reaching out. We will get back to\n    you soon."),
          trailing: Container(
              width: 100,
              child: Row(
                children: [
                  IconButton(
                      onPressed: null, icon: Icon(Icons.delete, size: 12)),
                  Container(
                    width: 40,
                    height: 20,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: kPrimaryColor),
                        borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.all(2),
                    // margin: EdgeInsets.all(5),
                    child: Text(
                      "Edit",
                      style: TextStyle(color: kPrimaryColor, fontSize: 10),
                    ),
                  )
                ],
              )),
        ),
        Divider(),
        ListTile(
          dense: true,
          visualDensity: VisualDensity(vertical: -3), // to compact

          title: Text("    Shortcuts"),
          subtitle: Text(
              "    Save frequently used messages as \n    keyboard short cuts, so it’s easy to provide better \n    customer service."),
          trailing: Transform.scale(
            scale: 0.6,
            child: CupertinoSwitch(
              value: _switchValue,
              activeColor: kPrimaryColor,
              onChanged: (bool value) {
                setState(() {
                  _switchValue = value;
                });
              },
            ),
          ),
        ),
        Divider(),
        ListTile(
          dense: true,
          visualDensity: VisualDensity(vertical: -3), // to compact

          title: Text("    Thank you"),
          subtitle: Text(
              "    Hi, Thanks for reaching out. We will get back to\n    you soon."),
          trailing: Container(
              width: 100,
              child: Row(
                children: [
                  IconButton(
                      onPressed: null, icon: Icon(Icons.delete, size: 12)),
                  Container(
                    width: 40,
                    height: 20,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: kPrimaryColor),
                        borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.all(2),
                    // margin: EdgeInsets.all(5),
                    child: Text(
                      "Edit",
                      style: TextStyle(color: kPrimaryColor, fontSize: 10),
                    ),
                  )
                ],
              )),
        ),
        Divider(),
        ListTile(
          dense: true,
          visualDensity: VisualDensity(vertical: -3), // to compact

          title: Text("    Follow Up"),
          subtitle: Text(
              "    Hi, Thanks for reaching out. We will get back to\n    you soon."),
          trailing: Container(
              width: 100,
              child: Row(
                children: [
                  IconButton(
                      onPressed: null, icon: Icon(Icons.delete, size: 12)),
                  Container(
                    width: 40,
                    height: 20,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: kPrimaryColor),
                        borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.all(2),
                    // margin: EdgeInsets.all(5),
                    child: Text(
                      "Edit",
                      style: TextStyle(color: kPrimaryColor, fontSize: 10),
                    ),
                  )
                ],
              )),
        ),
        SizedBox(
          height: 50,
        )
      ],
    );
  }
}

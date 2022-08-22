import 'dart:async';
import 'package:colorful_iconify_flutter/icons/emojione.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/zondicons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:secondnumber/components/border_text_field.dart';
import 'package:secondnumber/components/phone_ftextfield.dart';
import 'package:secondnumber/components/primary_button.dart';
import 'package:secondnumber/constants.dart';
import 'package:secondnumber/core/twilio/voice.dart';
import 'package:secondnumber/core/utils/color_constant.dart';
import 'package:secondnumber/core/utils/math_utils.dart';
import 'package:secondnumber/screens/bin/bin_screen.dart';
import 'package:secondnumber/screens/calls/call_screen.dart';
import 'package:secondnumber/screens/calls/dialer_screen.dart';
import 'package:secondnumber/screens/messages/message_screen.dart';
import 'package:secondnumber/screens/reg/interest.dart';

import '../welcome/getstarted_screen.dart';

class ContactDetailScreen extends StatefulWidget {
  @override
  _ContactDetailScreenState createState() => _ContactDetailScreenState();
}

class _ContactDetailScreenState extends State<ContactDetailScreen> {
  var _switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          child: Text(
            "Contact",
            style: TextStyle(color: kPrimaryColor),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => CallScreen(),
            ),
          ),
        ),
        backgroundColor: kgrey,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 30, bottom: 20),
              color: kgrey,
              alignment: Alignment.center,
              child: Text(
                "(123) 456 789 123",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(20),
              child: Text(
                "History",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            callHistory(),
            optionsButtons()
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => false;
  Widget optionsButtons() {
    return Column(
      children: [
        ListTile(
          title: Text("Text"),
          leading: Icon(
            CupertinoIcons.chat_bubble_2_fill,
            color: kPrimaryColor,
          ),
          onTap: () => Get.to(() => MessagesScreen()),
        ),
        ListTile(
          title: Text("Call"),
          leading: Icon(CupertinoIcons.phone_fill, color: kPrimaryColor),
          onTap: () => Get.to(() => DialerScreen()),
        ),
        ListTile(
          title: Text("Delete"),
          leading: Icon(Icons.delete_forever, color: kPrimaryColor),
          onTap: () => Get.to(() => BinScreen()),
        )
      ],
    );
  }

  Widget callHistory() {
    return Column(
      children: [
        ListTile(
          title: Text("(123)456 789 123"),
          subtitle: Text("Completed Call"),
          trailing: Container(
              width: 80,
              child: Row(
                children: [
                  Text("1 Min"),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: kPrimaryColor,
                  )
                ],
              )),
        ),
        Divider(),
        ListTile(
          title: Text("(123)456 789 123"),
          subtitle: Text("Voice Mail"),
          trailing: Container(
              width: 80,
              child: Row(
                children: [
                  Text("1 Min"),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: kPrimaryColor,
                  )
                ],
              )),
        ),
        Divider(),
      ],
    );
  }
}

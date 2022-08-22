import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:secondnumber/components/border_text_field.dart';
import 'package:secondnumber/components/phone_ftextfield.dart';
import 'package:secondnumber/components/primary_button.dart';
import 'package:secondnumber/core/utils/color_constant.dart';
import 'package:secondnumber/core/utils/math_utils.dart';
import 'package:secondnumber/routes/bottom_nav.dart';
import 'package:secondnumber/screens/reg/verify_num.dart';

import '../welcome/getstarted_screen.dart';

class Interest extends StatefulWidget {
  @override
  _InterestState createState() => _InterestState();
}

class _InterestState extends State<Interest> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();

  List<String> itemList = [];
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  int selectedCard = -1;
  @override
  Widget build(BuildContext context) {
    itemList = [
      "Auto Reply",
      "Calling & Texting",
      "Phone Number",
      "Sseparate Contacts",
      "Text Marketing",
      "Reminders",
      "Productivity Tools",
      "Digital Profile"
    ];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Spacer(flex: 1),
            Text(
              "Share Interest",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Spacer(flex: 1),
            Container(
              padding: EdgeInsets.only(left: 20),
              alignment: Alignment.topLeft,
              child: Text(
                "What bring you to new number? \nSelect the features you plann to use:",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
            ),
            Spacer(flex: 1),
            Container(
                padding: EdgeInsets.all(10),
                width: Get.width,
                height: Get.height / 2.5,
                child: GridView.builder(
                    shrinkWrap: false,
                    scrollDirection: Axis.vertical,
                    itemCount: itemList.length,
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height / 5),
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            // ontap of each card, set the defined int to the grid view index
                            selectedCard = index;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: Get.width / 2.4,
                          height: 50,
                          child: Text(itemList[index]),
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: selectedCard == index
                                  ? Colors.grey
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.black)),
                        ),
                      );
                    })),
            Spacer(flex: 3),
            PrimaryButton(
                padding: EdgeInsets.only(left: 20, right: 20),
                color: Colors.black,
                text: "Continue",
                press: () => Get.to(() => MainBottomClass())),
          ],
        ),
      ),
    );
  }
}

class interestItems {
  String? itemName;
  interestItems({this.itemName});
  List itemData = [
    interestItems(itemName: "Auto Reply"),
    interestItems(itemName: "Calling & Texting"),
    interestItems(itemName: "Phone Number"),
    interestItems(itemName: "Sseparate Contacts"),
    interestItems(itemName: "Text Marketing"),
    interestItems(itemName: "Digital Profile"),
  ];
}

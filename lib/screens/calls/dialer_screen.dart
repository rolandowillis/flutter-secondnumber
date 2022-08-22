import 'package:flutter/material.dart';
import 'package:flutter_dialpad/flutter_dialpad.dart';
import 'package:get/get.dart';
import 'package:secondnumber/constants.dart';
import 'package:secondnumber/core/app_export.dart';
import 'package:secondnumber/core/utils/image_constant.dart';
import 'package:secondnumber/routes/bottom_nav.dart';

class DialerScreen extends StatefulWidget {
  const DialerScreen({Key? key}) : super(key: key);

  @override
  State<DialerScreen> createState() => _DialerScreenState();
}

class _DialerScreenState extends State<DialerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kgrey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
           setState(() {
              currentIndex = 0;
          });
           Get.to(() => MainBottomClass());
           // Get.offAndToNamed('/mainlayout');
            //Get.appUpdate();
          },
        ),
        actions: [
          Container(
            padding: EdgeInsets.only(
              right: 20,
            ),
            child: Row(
              children: [
                Container(
                    padding: EdgeInsets.only(
                      right: 20,
                    ),
                    child: Icon(Icons.add_circle_outline_rounded,
                        color: kPrimaryColor)),
                //   Icon(Icons.lock, color: kPrimaryColor),
              ],
            ),
          )
        ],
        backgroundColor: kgrey,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Container(
          alignment: Alignment.center,
          child: Image.asset(ImageConstant.imgNumbersign,
              height: getSize(33.00), width: getSize(33.00), fit: BoxFit.fill),
        ),
      ),
      body: SafeArea(
          child: DialPad(
              enableDtmf: true,
              dialButtonIcon: Icons.phone,
              //  dialButtonIconColor: kPrimaryColor,
              buttonColor: kSecondaryColor,
              //  dialButtonColor: kSecondaryColor,
              outputMask: "(000) 000-0000",
              backspaceButtonIconColor: Colors.red,
              makeCall: (number) {
                print(number);
              })),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:secondnumber/components/border_text_field.dart';
import 'package:secondnumber/components/phone_ftextfield.dart';
import 'package:secondnumber/components/primary_button.dart';
import 'package:secondnumber/core/utils/color_constant.dart';
import 'package:secondnumber/core/utils/math_utils.dart';
import 'package:secondnumber/screens/reg/interest.dart';

import '../welcome/getstarted_screen.dart';

class VerifyPhoneNum extends StatefulWidget {
  @override
  _VerifyPhoneNumState createState() => _VerifyPhoneNumState();
}

class _VerifyPhoneNumState extends State<VerifyPhoneNum> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();
  String initialCountry = 'US';
  PhoneNumber number = PhoneNumber(isoCode: 'US');

  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
        await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'US');

    setState(() {
      this.number = number;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Verify Account",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Text(
                  "Waiting for automatically detect a SMS sent to:",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
                Form(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15.0,
                      ),
                     Container(
        margin: EdgeInsets.only(left: 16, right: 16),
        padding: EdgeInsets.symmetric(horizontal: 18.0),
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.black)
            /*boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(169, 176, 185, 0.42),
            spreadRadius: 0,
            blurRadius: 8,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],*/
            ),
        child: InternationalPhoneNumberInput(
          onInputChanged: (PhoneNumber number) {
            print(number.phoneNumber);
              Get.to(() => Interest());
          },
          onInputValidated: (bool value) {
            print(value);
          },
          selectorConfig: SelectorConfig(
            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
          ),
          ignoreBlank: false,
          autoValidateMode: AutovalidateMode.disabled,
          selectorTextStyle: TextStyle(color: Colors.black),
          initialValue: this.number,
          textFieldController: this.controller,
          formatInput: false,
          keyboardType:
              TextInputType.numberWithOptions(signed: true, decimal: true),
          inputBorder: InputBorder.none,
          onSaved: (PhoneNumber number) {
            print('On Saved: $number');
              Get.to(() => Interest());
          },
        )),
                      SizedBox(
                        height: 15.0,
                      ),
                    ],
                  ),
                ),
                Align(
                    alignment: Alignment.center,
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: getHorizontalSize(29.00),
                            top: getVerticalSize(21.00),
                            right: getHorizontalSize(27.00)),
                        child: Container(
                            height: getVerticalSize(5.00),
                            width: getHorizontalSize(319.00),
                            decoration: BoxDecoration(
                                color: ColorConstant.gray300,
                                borderRadius: BorderRadius.circular(
                                    getHorizontalSize(10.00))),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    getHorizontalSize(10.00)),
                                child: LinearProgressIndicator(
                                    value: 0.36,
                                    backgroundColor: ColorConstant.gray300,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        ColorConstant.gray400)))))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

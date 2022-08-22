import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:secondnumber/components/border_text_field.dart';
import 'package:secondnumber/components/phone_ftextfield.dart';
import 'package:secondnumber/components/primary_button.dart';
import 'package:secondnumber/screens/reg/signin_or_signup_screen.dart';
import 'package:secondnumber/screens/reg/verify_num.dart';

import '../welcome/getstarted_screen.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
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
                  "Create Account",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 35.0,
                ),
                Form(
                  child: Column(
                    children: [
                      BorderTextField(
                        hintText: "First Name *",
                        suffixIcon: "",
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      BorderTextField(
                        hintText: "Last Name *",
                        suffixIcon: "",
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      BorderTextField(
                        hintText: "owner_name@gmail.com",
                        suffixIcon: "",
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      BorderTextField(
                        hintText: "Business Name (Optional)",
                        suffixIcon: "",
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      PhoneTextField(
                        initialCountry: initialCountry,
                        number: number,
                        controller: controller,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      BorderTextField(
                        hintText: "Password *",
                        obscureText: true,
                        suffixIcon: "Show",
                        //  suffixIcon: Icon(
                        //    Icons.remove_red_eye,
                        //    color: Theme.of(context).colorScheme.primary,
                        //  ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  "By registering, you agree to  New Number’s Privacy\nPolicy and Terms & Conditions",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
                SizedBox(
                  height: 100.0,
                ),
                PrimaryButton(
                    color: Colors.black,
                    text: "Create Account",
                    press: () => Get.to(()=>VerifyPhoneNum())),
                SizedBox(
                  height: 15.0,
                ),
                Center(
                  child: Wrap(
                    runAlignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        "Already have account?",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Color.fromRGBO(169, 176, 185, 1),
                        ),
                      ),
                      TextButton(
                        onPressed: () => Get.to(()=>LoginAccount()),
                        child: Text(
                          "Log In",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

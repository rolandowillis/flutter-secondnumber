import 'package:get/get.dart';
import 'package:secondnumber/components/primary_button.dart';
import 'package:secondnumber/constants.dart';
import 'package:secondnumber/screens/reg/createAccount.dart';
import 'package:secondnumber/screens/reg/signin_or_signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:secondnumber/screens/welcome/welcome_screen.dart';

class GetStartedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Spacer(flex: 2),
            Text(
              "Turn your missed calls into opportunities",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Spacer(flex: 2),
            Image.asset("assets/images/Artboard.png"),
            Spacer(flex: 3),
            Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Automatically answer to your missed calls with message that conveniently move his conversation to text.",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontWeight: FontWeight.bold),
                )),
            Spacer(flex: 3),
            PrimaryButton(
                padding: EdgeInsets.only(left: 20, right: 20),
                color: Colors.black,
                text: "Get Started",
                press: () => Get.to(() => CreateAccount())),
          ],
        ),
      ),
    );
  }
}

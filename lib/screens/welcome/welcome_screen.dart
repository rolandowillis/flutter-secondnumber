import 'package:get/get.dart';
import 'package:secondnumber/components/primary_button.dart';
import 'package:secondnumber/constants.dart';
import 'package:secondnumber/screens/reg/signin_or_signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:secondnumber/screens/welcome/getstarted_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Spacer(flex: 2),
            Text(
              "Your New Number",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Spacer(flex: 2),
            Container(
                width: Get.width - 50,
                child: Image.asset("assets/images/Artboard1.png")),
            Spacer(flex: 3),
            Container(
                child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/charm_tick-double.png"),
                    Text(
                      "Number of your choice",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/charm_tick-double.png"),
                    Text(
                      "Unlimited Calls & Texts",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/charm_tick-double.png"),
                    Text(
                      "Any time Any where    ",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            )),
            Spacer(flex: 3),
            PrimaryButton(
                color: Colors.black,
                text: "Continue",
                press: () => Get.to(() => GetStartedScreen())),
          ],
        ),
      ),
    );
  }
}

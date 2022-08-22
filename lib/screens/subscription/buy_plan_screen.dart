import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secondnumber/components/shortButton.dart';

import '../../constants.dart';

class BuyPlanScreen extends StatefulWidget {
  const BuyPlanScreen({Key? key}) : super(key: key);

  @override
  State<BuyPlanScreen> createState() => _BuyPlanScreenState();
}

class _BuyPlanScreenState extends State<BuyPlanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: kSecondaryColor,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
        ),
        body: SafeArea(
            child: ListView(children: [
          // Spacer(flex: 1),
          Container(
            padding: EdgeInsets.only(bottom: 10),
            // color: kgrey,
            alignment: Alignment.center,
            child: Text(
              "Select Plan",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.w400),
            ),
          ),
          Container(
            color: kWColor,
            padding: EdgeInsets.only(left: 20, top: 20),
            // color: kgrey,
            alignment: Alignment.centerLeft,
            child: Text(
              "Your Plan: Subscription",
              textAlign: TextAlign.center,
            ),
          ),
          Container(
              color: kWColor,
              width: Get.width,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FlatButton(
                    child: Text(
                      " 1 Auto Renewing Line",
                    ),
                    onPressed: () => null,
                  ),
                  FlatButton(
                    child: Text(
                      "Available 0 Lines",
                    ),
                    onPressed: () => null,
                  )
                ],
              )),
          Container(
              margin: EdgeInsets.all(20),
              width: Get.width,
              height: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Unlimited Calls,Texts and Pics",
                  ),
                  GestureDetector(
                    child: Container(
                      width: 50,
                      height: 20,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          border: Border.all(color: kPrimaryColor),
                          borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.all(2),
                      // margin: EdgeInsets.all(5),
                      child: Text(
                        "Subscribe",
                        style: TextStyle(color: kSecondaryColor, fontSize: 10),
                      ),
                    ),
                    onTap: () {
                      //   Get.to(() => VoiceMailScreen());
                    },
                  ),
                ],
              )),
          Container(
            color: kWColor,
            padding: EdgeInsets.all(20),
            // color: kgrey,
            alignment: Alignment.centerLeft,
            child: Text(
              "Prepaid Lines",
              textAlign: TextAlign.center,
            ),
          ),
          PrepaidLines()
        ])));
  }

  Widget PrepaidLines() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Picture Bundle",
                    textAlign: TextAlign.center,
                  ),
                  GestureDetector(
                    child: Container(
                      width: 50,
                      height: 20,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(color: kPrimaryColor),
                          borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.all(2),
                      // margin: EdgeInsets.all(5),
                      child: Text(
                        "8 Credits",
                        style: TextStyle(color: kPrimaryColor, fontSize: 10),
                      ),
                    ),
                    onTap: () {
                      //   Get.to(() => VoiceMailScreen());
                    },
                  ),
                ],
              ),
              Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                      ]))
            ],
          ),
        ),
        Divider(),
        Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Unlimited Bundle",
                    textAlign: TextAlign.center,
                  ),
                  GestureDetector(
                    child: Container(
                      width: 50,
                      height: 20,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(color: kPrimaryColor),
                          borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.all(2),
                      // margin: EdgeInsets.all(5),
                      child: Text(
                        "5 Credits",
                        style: TextStyle(color: kPrimaryColor, fontSize: 10),
                      ),
                    ),
                    onTap: () {
                      //   Get.to(() => VoiceMailScreen());
                    },
                  ),
                ],
              ),
              Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                      ]))
            ],
          ),
        ),
        Divider(),
        Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Standard Bundle",
                    textAlign: TextAlign.center,
                  ),
                  GestureDetector(
                    child: Container(
                      width: 50,
                      height: 20,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(color: kPrimaryColor),
                          borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.all(2),
                      // margin: EdgeInsets.all(5),
                      child: Text(
                        "8 Credits",
                        style: TextStyle(color: kPrimaryColor, fontSize: 10),
                      ),
                    ),
                    onTap: () {
                      //   Get.to(() => VoiceMailScreen());
                    },
                  ),
                ],
              ),
              Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                      ]))
            ],
          ),
        ),
        Divider(),
        Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Mini Bundle",
                    textAlign: TextAlign.center,
                  ),
                  GestureDetector(
                    child: Container(
                      width: 50,
                      height: 20,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(color: kPrimaryColor),
                          borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.all(2),
                      // margin: EdgeInsets.all(5),
                      child: Text(
                        "3 Credits",
                        style: TextStyle(color: kPrimaryColor, fontSize: 10),
                      ),
                    ),
                    onTap: () {
                      //   Get.to(() => VoiceMailScreen());
                    },
                  ),
                ],
              ),
              Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                      ]))
            ],
          ),
        ),
      ],
    );
  }
}

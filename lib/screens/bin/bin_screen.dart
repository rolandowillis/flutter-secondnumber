import 'package:flutter/material.dart';
import 'package:secondnumber/components/shortButton.dart';
import 'package:secondnumber/constants.dart';
import 'package:secondnumber/routes/bottom_nav.dart';

import '../../core/app_export.dart';

class BinScreen extends StatefulWidget {
  const BinScreen({Key? key}) : super(key: key);

  @override
  _BinScreenState createState() => _BinScreenState();
}

class _BinScreenState extends State<BinScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kgrey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            print("${currentIndex} Bin");
          //  Get.to(() => MainBottomClass());
            Get.offAndToNamed('/mainlayout');
            setState(() {
              currentIndex = 0;
            });
            Get.appUpdate();
          },
        ),
        title: Container(
          alignment: Alignment.center,
          child: Image.asset(ImageConstant.imgNumbersign,
              height: getSize(33.00), width: getSize(33.00), fit: BoxFit.fill),
        ),
        backgroundColor: kgrey,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Spacer(flex: 1),
            Container(
              padding: EdgeInsets.only(bottom: 10),
              color: kgrey,
              alignment: Alignment.center,
              child: Text(
                "Delete",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 10),
              color: kgrey,
              alignment: Alignment.center,
              child: Text(
                "newNumber",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(fontWeight: FontWeight.w400),
              ),
            ),
            Spacer(flex: 1),
            GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                  child: Text(
                    "Delete",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontWeight: FontWeight.w400),
                  ),
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Delete Number"),
                        content: Text(
                            "Are you sure to delete this number\n (503) 123-456?"),
                        actions: [
                          Row(
                            children: [
                              ShortButton(
                                  text: "Confirm",
                                  press: () {
                                    Get.back();
                                    Get.to(() => MainBottomClass());
                                    //   Get.offAndToNamed('/mainlayout');
                                    setState(() {
                                      currentIndex = 0;
                                    });
                                    Get.appUpdate();
                                  }),
                              ShortButton(
                                  text: "Cancel",
                                  press: () => Navigator.of(context).pop()),
                            ],
                          )
                        ],
                      );
                    },
                  );
                }),
            Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}

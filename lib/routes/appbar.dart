import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secondnumber/constants.dart';
import 'package:secondnumber/core/app_export.dart';
import 'package:secondnumber/core/utils/image_constant.dart';
import 'package:secondnumber/screens/subscription/subscription_screen.dart';

PreferredSizeWidget appbarCustom() {
  return AppBar(
    iconTheme: IconThemeData(color: kPrimaryColor),

    leading: IconButton(
        onPressed: () => Get.to(() => SubscriptionScreen()),
        icon: Icon(
          Icons.menu,
          color: kPrimaryColor,
        )), // you can put Icon as well, it accepts any widget.
    //  title: Text("Your Title"),
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
                child: Icon(Icons.notifications, color: kPrimaryColor)),
            Icon(Icons.lock, color: kPrimaryColor),
          ],
        ),
      )
    ],
    toolbarHeight: 100,
    backgroundColor: kgrey,
    title: Container(
      alignment: Alignment.center,
      child: Image.asset(ImageConstant.imgNumbersign,
          height: getSize(33.00), width: getSize(33.00), fit: BoxFit.fill),
    ),
    // title: Text(widgetTitle.elementAt(selectedIndex)),
  );
}

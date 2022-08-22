import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:secondnumber/constants.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:secondnumber/core/app_export.dart';
import 'package:secondnumber/core/twilio/twilio_config.dart';
import 'package:secondnumber/screens/settings/settings_screen.dart';
import 'components/body.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  TextEditingController controller = new TextEditingController();
  TextEditingController controllerText = new TextEditingController();
  final String url = 'https://jsonplaceholder.typicode.com/users';
  List<String> itemList = [];
  int selectedCard = -1;
  var data, dataw;
  Twilio_Config twilio_Config = Twilio_Config();
  // Get json result and convert it to model. Then add
  Future<Null> getUserDetails() async {
    final response = await http.get(Uri.parse(url));
    final responseJson = json.decode(response.body);
    dataw = await twilio_Config.twilioFlutter.getSmsList();
    data = await twilio_Config.twilioFlutter.getSmsList();
    print(data.messages[1].body);
    print(dataw.messages[1].to);
    setState(() {
      for (Map user in responseJson) {
        _userDetails.add(UserDetails.fromJson(user));
      }
    });
  }

  @override
  void initState() {
    super.initState();

    getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    itemList = [
      "Come Over...!",
      "Let's meet.",
      "Ohh No!",
      "Thank You",
      "Again",
      "Bla Bla...",
    ];

    controller.text = '+61415309024';
    return Scaffold(
        appBar: AppBar(
          title: Container(
            alignment: Alignment.center,
            child: Text(
              "New Message",
              style: TextStyle(color: kPrimaryColor),
            ),
          ),
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop()),
          backgroundColor: kgrey,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
        ),
        body: SingleChildScrollView(
            child: SafeArea(
                child: Container(
                    child: Column(
          children: [
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: kgrey,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey, spreadRadius: .5, blurRadius: 10),
                ],
              ),
              // padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: Get.width / 2,
                    padding: EdgeInsets.all(5),
                    color: Colors.grey.shade400,
                    child: Text(
                      "Text",
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: Get.width / 2,
                    padding: EdgeInsets.all(5),
                    color: Colors.grey.shade200,
                    child: Text(
                      "Broadcast",
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: Get.width,
              height: 60, //_height,
              child: new Column(
                children: <Widget>[
                  new Container(
                    // color: Theme.of(context).primaryColor,
                    child: new Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: ListTile(
                        leading: Text(
                          "To:",
                          style: TextStyle(fontSize: 20.0),
                        ),
                        title: new TextField(
                          controller: controller,
                          decoration: new InputDecoration(
                              hintText: 'Name or Number',
                              border: InputBorder.none),
                          onChanged: onSearchTextChanged,
                        ),
                        /* trailing: new IconButton(
                          icon: new Icon(Icons.cancel),
                          onPressed: () {
                            controller.clear();
                            onSearchTextChanged('');
                          },
                        ),*/
                      ),
                    ),
                  ),
                  /*  controller.text.isNotEmpty
                      ? new Expanded(
                          child: _searchResult.length != 0 ||
                                  controller.text.isNotEmpty
                              ? new ListView.builder(
                                  itemCount: _searchResult.length,
                                  itemBuilder: (context, i) {
                                    return new Card(
                                      child: new ListTile(
                                        title: new Text(
                                            _searchResult[i].firstName! +
                                                ' ' +
                                                _searchResult[i].lastName!),
                                      ),
                                      margin: const EdgeInsets.all(0.0),
                                    );
                                  },
                                )
                              : new ListView.builder(
                                  itemCount: _userDetails.length,
                                  itemBuilder: (context, index) {
                                    return new Card(
                                      child: new ListTile(
                                        title: new Text(
                                            _userDetails[index].firstName! +
                                                ' ' +
                                                _userDetails[index].lastName!),
                                      ),
                                      margin: const EdgeInsets.all(0.0),
                                    );
                                  },
                                ),
                        )
                      : SizedBox(width: 50),
              */
                ],
              ),
            ),
            ChatMessages(),
            sendMessage(),
            TextSuggestion(),
            ManageAll(),
          ],
        )))));
  }

  Widget ManageAll() {
    return Container(
        padding: EdgeInsets.only(right: 5, bottom: 10),
        width: Get.width,
        alignment: Alignment.centerRight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GestureDetector(
              child: Text(
                "Manage All",
              ),
              onTap: () => Get.to(() => SettingScreen()),
            )
          ],
        ),
        color: kgrey);
  }

  Widget TextSuggestion() {
    return Container(
        height: 100,
        width: Get.width,
        color: kgrey,
        child: GridView.builder(
            shrinkWrap: false,
            scrollDirection: Axis.vertical,
            itemCount: itemList.length,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 6),
            ),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    // ontap of each card, set the defined int to the grid view index
                    controllerText.text = itemList[index];
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  width: Get.width / 2.4,
                  height: 50,
                  child: Text(
                    itemList[index],
                    style: TextStyle(color: kPrimaryColor, fontSize: 12),
                  ),
                  //  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: selectedCard == index ? Colors.grey : Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.black)),
                ),
              );
            }));
  }

  Widget sendMessage() {
    return Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.grey, spreadRadius: .5, blurRadius: 10),
          ],
        ),
        child: Row(
          children: [
            IconButton(
                onPressed: () => null,
                icon: Icon(
                  CupertinoIcons.camera,
                  color: kgrey,
                )),
            IconButton(
                onPressed: () => null,
                icon: Icon(
                  CupertinoIcons.doc_text,
                  color: kgrey,
                )),
            SizedBox(
              width: Get.width / 1.7,
              height: 50,
              child: new TextField(
                controller: controllerText,
                decoration: new InputDecoration(
                    hintText: 'I am at party...!', border: InputBorder.none),
              ),
            ),
            IconButton(
                onPressed: () async {
                  twilio_Config.twilioFlutter;
                  twilio_Config.sendSms(controller.text, controllerText.text);
                  controllerText.clear();
                  //    data = await twilio_Config.twilioFlutter.getSmsList();
                  //    print(data.messages[1].body);
                },
                icon: Icon(
                  Icons.send,
                  color: kgrey,
                )),
          ],
        ));
  }

  Widget ChatMessages() {
    return SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Container(
            height: MediaQuery.of(context).size.height * .47,
            color: kgrey,
            child: ListView.builder(
                // physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: data.messages.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      //  MissedCall(),
                      ReplayText(data.messages[index]),
                      RecieveText(data.messages[index]),
                    ],
                  );
                })));
  }

  Widget MissedCall() {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          margin: EdgeInsets.only(
              left: getHorizontalSize(24.00),
              top: getVerticalSize(13.00),
              right: getHorizontalSize(6.00)),
          padding: EdgeInsets.only(
            right: getHorizontalSize(13.00),
            left: getHorizontalSize(13.00),
            top: getVerticalSize(12.00),
            //  bottom: getVerticalSize(26.00)
          ),

          child: Text("Missed Call",
              maxLines: 2,
              textAlign: TextAlign.left,
              style: AppStyle.textStyleRuluko165
                  .copyWith(fontSize: getFontSize(16), height: 1.38)),
          // decoration: AppDecoration.textStyleRuluko165new,
          // color: Colors.amber,
        ),
        Padding(
            padding: EdgeInsets.only(top: getVerticalSize(10.00)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                      width: getHorizontalSize(76.00),
                      margin: EdgeInsets.only(
                          left: getHorizontalSize(70.00),
                          right: getHorizontalSize(70.00),
                          top: getVerticalSize(1.00)),
                      child: Text("12:30 AM",
                          maxLines: null,
                          textAlign: TextAlign.left,
                          style: AppStyle.textStyleRuluko12.copyWith(
                              fontSize: getFontSize(12), height: 1.83))),
                ])),
      ],
    ));
  }

  Widget RecieveText(data) {
    if (data.to == "+19853332206") {
      return Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            margin: EdgeInsets.only(
                left: getHorizontalSize(24.00),
                top: getVerticalSize(13.00),
                right: getHorizontalSize(6.00)),
            padding: EdgeInsets.only(
                right: getHorizontalSize(13.00),
                left: getHorizontalSize(13.00),
                top: getVerticalSize(12.00),
                bottom: getVerticalSize(26.00)),

            child: Text(data.body,
                maxLines: 5,
                textAlign: TextAlign.left,
                style: AppStyle.textStyleRuluko165
                    .copyWith(fontSize: getFontSize(16), height: 1.38)),
            decoration: AppDecoration.textStyleRuluko165new,
            // color: Colors.amber,
          ),
          Padding(
              padding: EdgeInsets.only(top: getVerticalSize(10.00)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                        width: getHorizontalSize(76.00),
                        margin: EdgeInsets.only(
                            left: getHorizontalSize(20.00),
                            right: getHorizontalSize(70.00),
                            top: getVerticalSize(1.00)),
                        child: Text(data.dateSent,
                            maxLines: null,
                            textAlign: TextAlign.left,
                            style: AppStyle.textStyleRuluko12.copyWith(
                                fontSize: getFontSize(12), height: 1.83))),
                    Container(
                        width: getHorizontalSize(72.00),
                        margin: EdgeInsets.only(
                            right: getHorizontalSize(100.00),
                            //   left: getHorizontalSize(150.00),
                            bottom: getVerticalSize(1.00)),
                        child: Text(data.status,
                            maxLines: null,
                            textAlign: TextAlign.left,
                            style: AppStyle.textStyleRuluko12.copyWith(
                                fontSize: getFontSize(12), height: 1.83)))
                  ])),
        ],
      ));
    } else {
      return Text('');
    }
  }

  Widget ReplayText(data) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          margin: EdgeInsets.only(
              left: getHorizontalSize(6.00),
              top: getVerticalSize(13.00),
              right: getHorizontalSize(24.00)),
          padding: EdgeInsets.only(
              right: getHorizontalSize(13.00),
              left: getHorizontalSize(13.00),
              top: getVerticalSize(12.00),
              bottom: getVerticalSize(26.00)),

          child: Text(data.body,
              maxLines: 5,
              textAlign: TextAlign.left,
              style: AppStyle.textStyleRuluko165
                  .copyWith(fontSize: getFontSize(16), height: 1.38)),
          decoration: AppDecoration.textStyleRuluko165,
          // color: Colors.amber,
        ),
        Padding(
            padding: EdgeInsets.only(top: getVerticalSize(10.00)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                      //  width: getHorizontalSize(76.00),
                      margin: EdgeInsets.only(
                          //    left: getHorizontalSize(150.00),
                          top: getVerticalSize(1.00)),
                      child: Text(data.dateSent,
                          maxLines: null,
                          textAlign: TextAlign.left,
                          style: AppStyle.textStyleRuluko12.copyWith(
                              fontSize: getFontSize(12), height: 1.83))),
                  Container(
                      width: getHorizontalSize(72.00),
                      margin: EdgeInsets.only(
                          left: getHorizontalSize(77.00),
                          bottom: getVerticalSize(1.00)),
                      child: Text(data.status,
                          maxLines: null,
                          textAlign: TextAlign.left,
                          style: AppStyle.textStyleRuluko12.copyWith(
                              fontSize: getFontSize(12), height: 1.83)))
                ])),
      ],
    ));
  }

  double _height = 60;
  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (_height == 200) {
      setState(() {
        _height = 60.0;
      });
    } else {
      setState(() {
        _height = 200;
      });
    }
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _userDetails.forEach((userDetail) {
      if (userDetail.firstName!.contains(text) ||
          userDetail.lastName!.contains(text)) _searchResult.add(userDetail);
    });

    setState(() {});
  }
}

List<UserDetails> _searchResult = [];

List<UserDetails> _userDetails = [];

final String url = 'https://jsonplaceholder.typicode.com/users';

class UserDetails {
  final int? id;
  final String? firstName, lastName, profileUrl;

  UserDetails(
      {this.id,
      this.firstName,
      this.lastName,
      this.profileUrl =
          'https://i.amz.mshcdn.com/3NbrfEiECotKyhcUhgPJHbrL7zM=/950x534/filters:quality(90)/2014%2F06%2F02%2Fc0%2Fzuckheadsho.a33d0.jpg'});

  factory UserDetails.fromJson(Map<dynamic, dynamic> json) {
    return new UserDetails(
      id: json['id'],
      firstName: json['name'],
      lastName: json['username'],
    );
  }
}

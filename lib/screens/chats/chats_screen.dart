import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:secondnumber/constants.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:secondnumber/core/app_export.dart';
import 'package:secondnumber/routes/bottom_nav.dart';
import 'package:secondnumber/screens/messages/message_screen.dart';
import 'package:secondnumber/screens/settings/settings_screen.dart';
import 'components/body.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController controller = new TextEditingController();
  TextEditingController controllerText = new TextEditingController();
  final String url = 'https://jsonplaceholder.typicode.com/users';
  List<String> itemList = [];
  int selectedCard = -1;
  // Get json result and convert it to model. Then add
  Future<Null> getUserDetails() async {
    final response = await http.get(Uri.parse(url));
    final responseJson = json.decode(response.body);

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
  bool get wantKeepAlive => false;
  @override
  Widget build(BuildContext context) {
    print(currentIndex);
    itemList = [
      "Come Over...!",
      "Let's meet.",
      "Ohh No!",
      "Thank You",
      "Again",
      "Bla Bla...",
    ];
    return Scaffold(
        appBar: AppBar(
          title: Container(
            alignment: Alignment.center,
            child: Text(
              "Inbox",
              style: TextStyle(color: kPrimaryColor),
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Get.back();
              //  setState(() {
              // Navigator.pop(context, true);
              currentIndex = 0;
              //  });
              Get.to(() => MainBottomClass());
              //  Get.to(() => MainBottomClass());
              //  Get.appUpdate();
            },
          ),
          backgroundColor: kgrey,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
        ),
        body: SafeArea(
            child: Container(
                height: Get.height - 50,
                child: ListView(
                  children: [
                    Container(
                      width: Get.width,
                      height: _height,
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
                                  keyboardType: TextInputType.text,
                                  controller: controller,
                                  focusNode: inputNode2,
                                  autofocus: true,
                                  decoration: new InputDecoration(
                                      hintText: 'Name or Number',
                                      border: InputBorder.none),
                                  onChanged: onSearchTextChanged,
                                ),
                                trailing: new IconButton(
                                  icon:
                                      new Icon(Icons.add_circle_outline_sharp),
                                  onPressed: () {
                                    Get.to(() => MessagesScreen());
                                    //  controller.clear();
                                    //  onSearchTextChanged('');
                                  },
                                ),
                              ),
                            ),
                          ),
                          controller.text.isNotEmpty
                              ? new Expanded(
                                  child: _searchResult.length != 0 ||
                                          controller.text.isNotEmpty
                                      ? new ListView.builder(
                                          itemCount: _searchResult.length,
                                          itemBuilder: (context, i) {
                                            return new Card(
                                              child: new ListTile(
                                                title: new Text(_searchResult[i]
                                                        .firstName! +
                                                    ' ' +
                                                    _searchResult[i].lastName!),
                                                onTap: () {
                                                  controller.text =
                                                      _searchResult[i]
                                                              .firstName! +
                                                          ' ' +
                                                          _searchResult[i]
                                                              .lastName!;

                                                  setState(() {
                                                    _height = 60.0;
                                                    _newHeight = 400;
                                                  });
                                                },
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
                                                    _userDetails[index]
                                                            .firstName! +
                                                        ' ' +
                                                        _userDetails[index]
                                                            .lastName!),
                                              ),
                                              margin: const EdgeInsets.all(0.0),
                                            );
                                          },
                                        ),
                                )
                              : SizedBox(width: 50),
                        ],
                      ),
                    ),
                    ChatMessages(),
                    sendMessage(),
                  ],
                ))));
  }

  FocusNode inputNode = FocusNode();
  FocusNode inputNode2 = FocusNode();
// to open keyboard call this function;
  void openKeyboard() {
    FocusScope.of(context).requestFocus(inputNode2);
  }

  Widget sendMessage() {
    return Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
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
            Container(
              padding: EdgeInsets.only(left: 10),
              color: Colors.white,
              width: Get.width / 1.4,
              height: 50,
              child: new TextField(
                focusNode: inputNode,
                //  autofocus: true,
                keyboardType: TextInputType.text,
                controller: controllerText,
                decoration: new InputDecoration(
                    hintText: 'Type Message Here...', border: InputBorder.none),
              ),
            ),
            IconButton(
                onPressed: () => controllerText.clear(),
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
            height: MediaQuery.of(context).size.height * .7,
            color: kgrey,
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "From: newNumber (786) 123 456 789",
                          style: TextStyle(color: Colors.grey),
                        ),
                      )
                    ],
                  );
                })));
  }

  double _height = 60;
  double _newHeight = 400;
  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (_height == 200) {
      setState(() {
        _height = 60.0;
        _newHeight = 400;
      });
    } else {
      setState(() {
        _height = 200;
        _newHeight = 350;
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secondnumber/constants.dart';
import 'package:secondnumber/core/app_export.dart';
import 'package:secondnumber/screens/calls/contact_detail_screen.dart';
import 'package:secondnumber/screens/lock/lock.dart';
import 'package:secondnumber/screens/subscription/subscription_screen.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({Key? key}) : super(key: key);

  @override
  _CallScreenState createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
          //  backgroundColor: Colors.grey,
          appBar: AppBar(
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
                    GestureDetector(
                      child: Icon(Icons.lock, color: kPrimaryColor),
                      onTap: () {
                        Get.to(() => LockScreen());
                      },
                    )
                  ],
                ),
              )
            ],
            toolbarHeight: 100,
            backgroundColor: kgrey,
            title: Container(
              alignment: Alignment.center,
              child: Image.asset(ImageConstant.imgNumbersign,
                  height: getSize(33.00),
                  width: getSize(33.00),
                  fit: BoxFit.fill),
            ),
            // title: Text(widgetTitle.elementAt(selectedIndex)),

            bottom: PreferredSize(
                child: TabBar(
                    indicator: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          style: BorderStyle.solid,
                          color: Theme.of(context).primaryColor,
                          width: 2.0,
                        ),
                      ),
                    ),
                    isScrollable: true,
                    labelColor: Theme.of(context).primaryColor,
                    unselectedLabelColor: Colors.black.withOpacity(0.7),
                    indicatorColor: Colors.black,
                    tabs: [
                      Tab(
                        child: Text('All'),
                      ),
                      Tab(
                        child: Text('John Doe'),
                      ),
                      Tab(
                        child: Text('Sara Amy'),
                      ),
                      Tab(
                        child: Text('Linda Markel'),
                      ),
                      Tab(
                        child: Text('Annye John'),
                      ),
                      Tab(
                        child: Text('Alish Bin'),
                      )
                    ]),
                preferredSize: Size.fromHeight(30.0)),
          ),
          body: TabBarView(
            children: <Widget>[
              CallList(),
              CallList(),
              Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  children: [testCall(), testText(), NoMessageList()],
                ),
              ),
              NoMessageList(),
              NoMessageList(),
              NoMessageList(),
            ],
          )),
    );
  }

  List<String> callitemList = [
    "Completed Call",
    "Some Text Message",
    "Completed Call",
    "Some Text Message",
    "Completed Call",
    "Some Text Message",
    "Completed Call",
    "Some Text Message",
    "Completed Call",
    "Some Text Message"
  ];

  Widget CallList() {
    return SingleChildScrollView(
        physics: ScrollPhysics(),
        child: ListView.separated(
            separatorBuilder: (context, index) {
              return Divider();
            },
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return GestureDetector(
                child: ListTile(
                  title: Text("+6141530902${index}"),
                  subtitle: Text(callitemList[index]),
                  trailing: Container(
                      width: 80,
                      child: Row(
                        children: [
                          Text("1 Min"),
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: kPrimaryColor,
                          )
                        ],
                      )),
                ),
                onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContactDetailScreen(),
                  ),
                ),
              );
            }));
  }

  Widget testCall() {
    return Container(
      padding: EdgeInsets.only(left: 5, top: 20, bottom: 20, right: 10),
      margin: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 5),
      //alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          border: Border.all(color: kPrimaryColor)),
      child: Row(
        children: [
          Icon(
            Icons.verified_user,
          ),
          Container(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Get a Test Call",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text("Try out your New Number")
                ],
              ))
        ],
      ),
    );
  }

  Widget testText() {
    return Container(
      padding: EdgeInsets.only(left: 5, top: 20, bottom: 20, right: 10),
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 80),
      //alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          border: Border.all(color: kPrimaryColor)),
      child: Row(
        children: [
          Icon(
            Icons.verified_user,
          ),
          Container(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Try Receiving a Text",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text("Test inbound message")
                ],
              ))
        ],
      ),
    );
  }

  Widget NoMessageList() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("No messages to Show"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                CupertinoIcons.arrow_counterclockwise_circle_fill,
                color: kgrey,
              ),
              Text("Refresh")
            ],
          )
        ],
      ),
    );
  }
}

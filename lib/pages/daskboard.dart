import 'dart:async';
import 'dart:developer';

import 'package:egapp/fakedata/fakedata.dart';
import 'package:egapp/fakedata/modelpage.dart';
import 'package:egapp/main.dart';
import 'package:egapp/pages/studentlist.dart';
import 'package:egapp/services/services.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int totalclass = 10;
  int totalatten = 7;

  String nouser =
      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png";

  Service obj = new Service();

  @override
  Widget build(BuildContext context) {
    // print("dashboard");
    return Scaffold(
      primary: false,
      appBar: AppBar(
        title: Text("DASHBOARD"),
        centerTitle: true,
        backgroundColor: Colors.green,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        actions: [
          // IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_outlined)),
          PopupMenuButton(
            // icon: Icon(Icons.access_alarm_outlined),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                    child: TextButton(
                        onPressed: () {}, child: Text("Activities"))),
                PopupMenuItem(
                    child: TextButton(onPressed: () {}, child: Text("Tasks"))),
              ];
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
              padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Attendance",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // SizedBox(width: 390),
                      TextButton(onPressed: () {}, child: Text("View"))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "${totalatten * 100 / totalclass}%",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
              padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Today's Task",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // SizedBox(width: 370),
                      TextButton(onPressed: () {}, child: Text("View all"))
                    ],
                  ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Create a pop up menu",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  // color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "create a pop up menu in the screen",
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
              padding: EdgeInsets.fromLTRB(20, 5, 20, 50),
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Students",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // SizedBox(width: 390),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          First()));
                            });
                          },
                          child: Text("View All"))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    // width: double.infinity,
                    height: 120,
                    decoration: BoxDecoration(
                        color: Colors.grey[500],
                        borderRadius: BorderRadius.circular(10)),
                    child: FutureBuilder(
                      future: obj.fetchdata(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasError) {
                            return Center(
                              child: Text("${snapshot.error} occurred"),
                            );
                          } else if (snapshot.hasData) {
                            List<UserModel> data = snapshot.data;
                            return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: data.length,
                                itemBuilder: ((context, index) {
                                  return Padding(
                                    padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          (data[index].imgurl == ""
                                              ? '$nouser'
                                              : data[index].imgurl)),
                                      radius: 30,
                                    ),
                                  );
                                }));
                          }
                        }

                        return Center(
                          child: Text("something when wrong!"),
                        );
                      },
                    ),
                    // child: ListView.builder(
                    //   scrollDirection: Axis.horizontal,
                    //   shrinkWrap: true,
                    //   itemCount: fakedata.length,
                    //   itemBuilder: (Context, index) {
                    //     return Padding(
                    //       padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                    //       child: CircleAvatar(
                    //         backgroundImage:
                    //             NetworkImage('${fakephoto[index]['url']}'),
                    //         radius: 30,
                    //       ),
                    //     );
                    //   },
                    // ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

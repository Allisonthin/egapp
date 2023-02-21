import 'dart:developer';

import 'package:egapp/fakedata/modelpage.dart';
import 'package:egapp/pages/daskboard.dart';
import 'package:egapp/pages/second.dart';
import 'package:egapp/services/services.dart';
import 'package:flutter/material.dart';
import 'package:egapp/fakedata/fakedata.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  Service obj = new Service();
  String nouser =
      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.3),
      appBar: AppBar(
        title: Text('STUDENT'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),

      body: FutureBuilder(
        future: obj.fetchdata(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          // if (snapshot.data != null) {
          //   return Text(snapshot.data);
          // }

          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text("${snapshot.error} occurred"),
              );
            } else if (snapshot.hasData) {
              // String data = snapshot.data as String;
              List<UserModel> data = snapshot.data;
              // print(user.length);

              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: TextButton(
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              (data[index].imgurl == ""
                                  ? '$nouser'
                                  : data[index].imgurl)),
                        ),
                        onPressed: () async {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) => Second(
                                          data: fakedata[index],
                                          photo: fakephoto[index],
                                        )));
                          });
                        },
                      ),
                      title: Text("${data[index].name}"),
                      subtitle: Text("${data[index].name}"),
                      trailing: Icon(Icons.more_vert),
                    ),
                  );
                },
              );
            }
            // return Center(
            //   child: CircularProgressIndicator(),
            // );
          }

          return Center(
            child: Text("something when wrong!"),
          );
        },
      ),
      // body: ListView.builder(
      //   itemCount: fakedata.length,
      //   itemBuilder: (context, index) {
      //     return Card(
      //       child: ListTile(
      //         leading: TextButton(
      //           child: CircleAvatar(
      //               backgroundImage:
      //                   NetworkImage('${fakephoto[index]['url']}')),
      //           onPressed: () async {
      //             setState(() {
      //               Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                       builder: (BuildContext context) => Second(
      //                             data: fakedata[index],
      //                             photo: fakephoto[index],
      //                           )));
      //             });
      //           },
      //         ),
      //         title: Text("${user[index].name}"),
      //         subtitle: Text("${user[index].address!.street}"),
      //         trailing: Icon(Icons.more_vert),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}

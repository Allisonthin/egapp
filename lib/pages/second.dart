// import 'package:egapp/fakedata/fakedata.dart';
import 'package:egapp/main.dart';
import 'package:egapp/pages/task.dart';
import 'package:flutter/material.dart';

class Second extends StatefulWidget {
  // final int a;
  final Map<String, dynamic> data;
  final Map<String, dynamic> photo;
  const Second({super.key, required this.data, required this.photo});
  // List<int> rate = [];
  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.5),
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          ElevatedButton(
              onPressed: () {
                setState(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Taskpage(),
                      ));
                });
              },
              child: Text("task"),
              style: ElevatedButton.styleFrom(
                elevation: 10,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                backgroundColor: Colors.green[700],
              ))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: CircleAvatar(
                backgroundImage: NetworkImage('${widget.photo['url']}'),
                radius: 50,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '${widget.data['name']}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              '${widget.data['username']}',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _star(),
                _star(),
                _star(),
                _star(),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 10, 0),
              child: Row(
                children: [
                  Text(
                    "Address",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 10, 0),
              child: Row(
                children: [
                  Text(
                    '${widget.data['address']['street']}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 10, 0),
              child: Row(
                children: [
                  Text(
                    "Contact",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 10, 0),
              child: Row(
                children: [
                  Text(
                    '${widget.data['phone']}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 10, 0),
              child: Row(
                children: [
                  Text(
                    "Email",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 10, 0),
              child: Row(
                children: [
                  Text(
                    '${widget.data['email']}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Icon _star() {
    return Icon(
      Icons.star,
      color: Colors.grey,
    );
  }
}

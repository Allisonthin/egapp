import 'package:flutter/material.dart';

class Taskpage extends StatefulWidget {
  const Taskpage({super.key});

  @override
  State<Taskpage> createState() => _TaskpageState();
}

class _TaskpageState extends State<Taskpage> {
  final tasknamecontroller = TextEditingController();
  final taskdescontroller = TextEditingController();

  List<Map<String, dynamic>> task = [
    {"name": "task name", "description": "discrip", "isdone": false},
    {"name": "task name", "description": "discrip", "isdone": false},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My task"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: task.length,
        itemBuilder: (context, index) {
          return Card(
              child: ListTile(
            title: Text("${task[index]["name"]}"),
            subtitle: Text("${task[index]["description"]}"),
            trailing: Checkbox(
                value: task[index]["isdone"],
                onChanged: (v) {
                  setState(() {
                    task[index]["isdone"] = !task[index]["isdone"];
                  });
                }),
          ));
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    // backgroundColor: Colors.grey,
                    title: Text("Task"),
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                            controller: tasknamecontroller,
                            autofocus: true,
                            // focusNode,
                            decoration: InputDecoration(
                                hintText: "enter the Task Name",
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ))),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                            controller: taskdescontroller,
                            // focusNode: FocusNode,
                            decoration: InputDecoration(
                                hintText: "enter the Task Description",
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ))),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              task.add({
                                "name": "${tasknamecontroller.text}",
                                "description": "${taskdescontroller.text}",
                                "isdone": false
                              });
                              setState(
                                () {},
                              );
                              tasknamecontroller.text = "";
                              taskdescontroller.text = "";
                              Navigator.pop(context);
                            },
                            child: Text("Add Task"))
                      ],
                    ),
                  ));
        },
        label: Text("add"),
      ),
    );
  }
}

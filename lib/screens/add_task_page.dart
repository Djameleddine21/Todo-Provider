import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/models/task_data.dart';

class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Color(0xff757575),
      child: Container(
        height: 800.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.0), topLeft: Radius.circular(30.0)),
        ),
        padding: EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text("Add Task",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.lightBlueAccent, fontSize: 30.0)),
            TextField(
              autofocus: true,
              controller: controller,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30.0),
            FlatButton(
              onPressed: () {
                Provider.of<TaskData>(context,listen: false).addTask(controller.text);
                Navigator.pop(context);
              },
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                "ADD",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.w700),
              ),
              color: Colors.lightBlueAccent,
            ),
          ],
        ),
      ),
    );
  }
}

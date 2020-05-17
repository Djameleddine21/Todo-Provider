import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkCallBack;
  final Function longPressCallBack;
  const TaskTile({this.taskTitle, this.isChecked, this.checkCallBack, this.longPressCallBack});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallBack,
      title: Text(
        taskTitle,
        style: TextStyle(decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        checkColor: Colors.white,
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkCallBack,
      ),
    );
  }
}

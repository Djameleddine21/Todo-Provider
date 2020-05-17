import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/components/task_tile.dart';
import 'package:todo_provider/models/task_data.dart';

class ListTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return Expanded(
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
              itemCount: taskData.taskCount,
              itemBuilder: (_, index) {
                final task = taskData.tasks[index];
                return TaskTile(
                  taskTitle: task.title,
                  isChecked: task.isDone,
                  checkCallBack: (value) {
                    taskData.updateTask(task);
                  },
                  longPressCallBack: (){
                    taskData.deleteTask(task);
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}

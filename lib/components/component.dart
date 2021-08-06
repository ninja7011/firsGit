import 'package:flutter/material.dart';
import 'package:test1/layout/cubit.dart';

import '../login/login_screen.dart';

class DefaultButton extends StatelessWidget {
  DefaultButton(
      {required this.title, required this.color, required this.pressed});

  final String? title;
  final Color? color;
  final void Function() pressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: pressed,
      child: Text(
        title.toString(),
        style: textStyle,
      ),
      color: color,
    );
  }
}

Widget buildTaskItem(Map model, context) => Dismissible(
      key: Key(model['id'].toString()),
      onDismissed: (direction) {
        AppCubit.get(context).deleteDatabase(id: model['id']);
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40.0,
              child: Text(
                '${model['time']}',
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${model['title']}',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${model['date']}',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            IconButton(
              onPressed: () {
                AppCubit.get(context).updateDatabase(
                  status: 'done',
                  id: model['id'],
                );
              },
              icon: Icon(
                Icons.check_box,
                color: Colors.green,
              ),
            ),
            IconButton(
              onPressed: () {
                AppCubit.get(context).updateDatabase(
                  status: 'archive',
                  id: model['id'],
                );
              },
              icon: Icon(
                Icons.archive,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );

class TasksCondition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.menu, size: 60, color: Colors.grey),
            SizedBox(
              height: 20,
            ),
            Text(
              'No Tasks Yet , Please Enter Tasks ',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 25,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



Widget tasksBuilder({
  required List<Map> tasks,
}) =>
    ListView.separated(
      itemBuilder: (context, index) => buildTaskItem(tasks[index], context),
      separatorBuilder: (context, index) => Padding(
        padding: const EdgeInsetsDirectional.only(
          start: 20.0,
        ),
        child: containerLine(),
      ),
      itemCount: tasks.length,
    );

Container containerLine() {
  return Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[400],
      );
}

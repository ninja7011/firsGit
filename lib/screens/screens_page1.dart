import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/components/component.dart';
import 'package:test1/layout/cubit.dart';
import 'package:test1/layout/states.dart';

class ScreenOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var tasks = AppCubit.get(context).newTasks;
        return tasks.length > 0 ? tasksBuilder(tasks: tasks) : TasksCondition();
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/layout/cubit.dart';
import 'package:test1/layout/states.dart';
import 'package:test1/components/text_form.dart';

class HomeLayout extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createToDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if (state is AppInsertDatabaseState) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                cubit.appTitle[cubit.currentIndex],
              ),
            ),
            body: state is! AppGetDatabaseLoadingState
                ? cubit.screens[cubit.currentIndex]
                : Center(
                    child: CircularProgressIndicator(),
                  ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (cubit.isBottomSheetShow) {
                  if (formKey.currentState!.validate()) {
                    cubit.insertToDatabase(
                      title: cubit.titleController.text,
                      time: cubit.timeController.text,
                      date: cubit.dateController.text,
                    );
                  }
                } else {
                  scaffoldKey.currentState!
                      .showBottomSheet(
                        (context) => Container(
                          color: Colors.grey[300],
                          padding: EdgeInsets.all(20.0),
                          child: Form(
                            key: formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextForm(
                                  controller: cubit.titleController,
                                  textType: TextInputType.text,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'title Must be empty';
                                    }
                                    return null;
                                  },
                                  label: 'Task title',
                                  prefix: Icons.title_outlined,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextForm(
                                  controller: cubit.timeController,
                                  textType: TextInputType.datetime,
                                  onTap: () => cubit.timeShow(context),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'time Must be empty';
                                    }
                                    return null;
                                  },
                                  label: 'Task time',
                                  prefix: Icons.watch_later,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextForm(
                                  controller: cubit.dateController,
                                  textType: TextInputType.datetime,
                                  onTap: () => cubit.dateShow(context),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'date Must be empty';
                                    }
                                    return null;
                                  },
                                  label: 'Task date',
                                  prefix: Icons.calendar_today,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      .closed
                      .then((value) {
                    cubit.changeBottomSheetState(
                      isShow: false,
                      icon: Icons.edit,
                    );
                  });
                  cubit.changeBottomSheetState(
                    isShow: true,
                    icon: Icons.add,
                  );
                }
              },
              child: Icon(cubit.fabIcon),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              unselectedItemColor: Colors.white,
              selectedItemColor: Colors.black,
              backgroundColor: Colors.teal,
              onTap: (index) {
                cubit.changeIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.menu,
                  ),
                  label: 'tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.check_circle_outline,
                  ),
                  label: 'Dome',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.archive,
                  ),
                  label: 'Archived',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

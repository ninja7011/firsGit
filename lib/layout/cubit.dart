import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test1/layout/states.dart';
import 'package:test1/news_app/dio/cache_helper.dart';
import 'package:test1/screens/screens_page1.dart';
import 'package:test1/screens/screens_page2.dart';
import 'package:test1/screens/screens_page3.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  late Database database;

  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archiveTasks = [];

  int currentIndex = 0;
  List<Widget> screens = [
    ScreenOne(),
    ScreenTwo(),
    ScreenThree(),
  ];
  List<String> appTitle = [
    'Tasks',
    'Done',
    'Archived',
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }

  void createToDatabase() {
    openDatabase('todo2.db', version: 1, onCreate: (database, version) {
      print('data created');
      database
          .execute(
              'CREATE TABLE tasks (id INTEGER PRIMARY KEY , title TEXT , date TEXT , time TEXT , status TEXT  )')
          .then((value) {
        print('table created');
      }).catchError((error) {
        print(' error ${error.toString()}');
      });
    }, onOpen: (database) {
      getDataFromDatabase(database);
      print('opened ');
    }).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }

  insertToDatabase({
    required String title,
    required String time,
    required String date,
  }) async {
    await database.transaction((txn) {
      return txn
          .rawInsert(
              'INSERT INTO tasks (title , date , time , status ) VALUES ("$title ","$date","$time","new")')
          .then((value) {
        print('$value inserted successfully ');
        emit(AppInsertDatabaseState());
        getDataFromDatabase(database);
      }).catchError((error) {
        print('error insert ${error.toString()}');
      });
    });
  }

  void getDataFromDatabase(database)  {
    newTasks = [];
    archiveTasks = [];
    doneTasks = [];
    emit(AppGetDatabaseLoadingState());
     database.rawQuery('SELECT * FROM tasks').then((value) {

       value.forEach((element)
       {
         if(element['status'] == 'new'){
           newTasks.add(element);
         }else if(element['status'] == 'done'){
           doneTasks.add(element);
         }else {
           archiveTasks.add(element);
         }
       });
       emit(AppGetDatabaseState());
     });
  }

  void updateDatabase({
    required String status,
    required int id,
  }) async {
     database.rawUpdate(
      'UPDATE tasks SET status = ?  WHERE id = ?',
      ['$status', id],
    ).then((value)
     {
       getDataFromDatabase(database);
      emit(AppUpdateDatabaseState());
     });
  }

  void deleteDatabase({
    required int id,
  }) async {
    database.rawDelete(
      'DELETE FROM tasks WHERE id = ?' ,[id],
    ).then((value)
    {
      getDataFromDatabase(database);
      emit(AppDeleteDatabaseState());
    });
  }


  bool isBottomSheetShow = false;
  IconData fabIcon = Icons.edit;

  void changeBottomSheetState({
    required bool isShow,
    required IconData icon,
  }) {
    isBottomSheetShow = isShow;
    fabIcon = icon;

    emit(AppChangeBottomSheetState());
  }

  final  titleController = TextEditingController();
  final  timeController = TextEditingController();
  final  dateController = TextEditingController();

  void dateShow(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.utc(2021, 8),
    ).then((value) {
      dateController.text = DateFormat.yMMMd().format(value!);
    });
  }

  void timeShow(
      BuildContext context,
      ) {
    showTimePicker(
      context: (context),
      initialTime: TimeOfDay.now(),
    ).then((value) {
      timeController.text = value!.format(context);
      print(value.format(context));
    });
  }
  bool isDark = false ;
  // ThemeMode appMode = ThemeMode.dark;

  void changeAppMode({ bool? fromShared})
  {
    if(fromShared != null )
    {
      isDark = fromShared;
      emit(AppChangeThemeModeState());
    }else
      {
        isDark = !isDark ;
        CacheHelper.setData(key: 'isDark', value: isDark).then((value)
        {
          emit(AppChangeThemeModeState());
        });
      }


  }
}

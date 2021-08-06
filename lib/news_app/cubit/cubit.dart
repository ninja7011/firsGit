import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/news_app/cubit/states.dart';
import 'package:test1/news_app/dio/dio_helper.dart';
import 'package:test1/news_app/moduals/business.dart';
import 'package:test1/news_app/moduals/science.dart';
import 'package:test1/news_app/moduals/sports.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  List<Widget> screens =
  [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  List<String> appBarTitle = [
    'Business News',
    'Sports News',
    'Science News',
  ];

  int currentIndex = 0;

  void currentState(int index) {
    currentIndex = index;
    emit(NewsBottomNavState());
  }

  List<BottomNavigationBarItem> bottomNAvBar =
  [

    BottomNavigationBarItem(
      icon: Icon(Icons.business_sharp), label: 'Business',),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports_baseball), label: 'Sports',),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science',),

  ];

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'business',
          'apiKey': '877a1ea697ea4640a2ae0838831c4f46',
        }
    ).then((value) {
      //print(value.data['articles'][0]['title']);
      business = value.data['articles'];
      // print(business[0]['title'].toString());
      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }


  List<dynamic> sports = [];

  void getSports() {
    emit(NewsGetSportsLoadingState());
    if (sports.length == 0) {
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country': 'eg',
            'category': 'sports',
            'apiKey': '877a1ea697ea4640a2ae0838831c4f46',
          }
      ).then((value) {
        //print(value.data['articles'][0]['title']);
        sports = value.data['articles'];
        // print(sports[0]['title'].toString());
        emit(NewsGetSportsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSportsErrorState(error.toString()));
      });
    } else {
      emit(NewsGetSportsSuccessState());
    }
  }


  List<dynamic> science = [];

  void getScience() {
    emit(NewsGetScienceLoadingState());
    if (science.length == 0) {
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country': 'eg',
            'category': 'Entertainment',
            'apiKey': '877a1ea697ea4640a2ae0838831c4f46',
          }
      ).then((value) {
        //print(value.data['articles'][0]['title']);
        science = value.data['articles'];
        // print(science[0]['title'].toString());
        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }


  List<dynamic> search = [];

  void getSearch(String value) {
    emit(NewsGetSearchLoadingState());
    search = [];

    DioHelper.getData(
        url: 'v2/everything',
        query: {
          'q': '$value',
          'apiKey': '877a1ea697ea4640a2ae0838831c4f46',
        }
    ).then((value) {
      //print(value.data['articles'][0]['title']);
      search = value.data['articles'];
      // print(science[0]['title'].toString());
      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/layout/cubit.dart';
import 'package:test1/news_app/components.dart';
import 'package:test1/news_app/cubit/cubit.dart';
import 'package:test1/news_app/cubit/states.dart';
import 'package:test1/news_app/search_module/search.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              cubit.appBarTitle[cubit.currentIndex],
            ),
            actions: [
              IconButton(
                onPressed: ()
                {
                  navigateTo(context, Search());
                },
                icon: Icon(Icons.search),
              ),
              IconButton(
                onPressed: ()
                {
                  AppCubit.get(context).changeAppMode();
                },
                icon: Icon(Icons.brightness_6_sharp),
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) => cubit.currentState(index),
            items: cubit.bottomNAvBar,
          ),
        );
      },
    );
  }
}

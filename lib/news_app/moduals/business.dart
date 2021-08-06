import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/news_app/components.dart';
import 'package:test1/news_app/cubit/cubit.dart';
import 'package:test1/news_app/cubit/states.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit
            .get(context)
            .business;
        return articleBuilder(list);
      },
    );
  }

}

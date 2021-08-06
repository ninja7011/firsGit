import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/components/text_form.dart';
import 'package:test1/news_app/components.dart';
import 'package:test1/news_app/cubit/cubit.dart';
import 'package:test1/news_app/cubit/states.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();

    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextForm(
                controller: searchController,
                textType: TextInputType.text,
                changed: (value) {
                  NewsCubit.get(context).getSearch(value);
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Search Must Not Be Empty';
                  }
                  return null;
                },
                label: 'search',
                prefix: Icons.search,
              ),
            ),
            Expanded(child: articleBuilder(list)),
          ]),
        );
      },
    );
  }
}

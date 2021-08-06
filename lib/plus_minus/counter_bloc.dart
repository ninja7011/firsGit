import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/components/constant.dart';
import 'package:test1/cubit/cubit.dart';
import 'package:test1/cubit/states.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterStates>(
        listener: (context, state)
        {
          if (state is CounterMinusState)
          {
            print('Minus State ${state.counter}');
          }
          if (state is CounterPlusState)
          {
            print('plus State ${state.counter}');
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Counter'),
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.redAccent,
                    child: TextButton(
                        onPressed: () {
                          CounterCubit.get(context).minus();
                        },
                        child: Text(
                          'MiNUS',
                          style: style,
                        )),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    '${CounterCubit.get(context).counter}',
                    style: counterStyle,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    color: Colors.green,
                    child: TextButton(
                        onPressed: () {
                          CounterCubit.get(context).plus();
                        },
                        child: Text(
                          'PLUS',
                          style: style,
                        )),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

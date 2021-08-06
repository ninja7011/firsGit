import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test1/components/constant.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;
  @override
  void initState()
  {
    super.initState();
  }
  @override

  Widget build(BuildContext context) {

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
                  onPressed: ()
                  {
                    setState(()
                    {
                      counter--;
                    });
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
              '$counter',
              style: counterStyle,
            ),
            SizedBox(
              width: 30,
            ),
            Container(
              color: Colors.green,
              child: TextButton(
                  onPressed: ()
                  {
                    setState(()
                    {
                      counter++;
                    });

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
  }
}

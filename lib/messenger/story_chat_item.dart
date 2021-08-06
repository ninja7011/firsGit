import 'package:flutter/material.dart';

Widget buildChatItem() => Row(
  children: [
    Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        CircleAvatar(
          radius: 30.0,
          backgroundImage: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnIyZxJAl5REjZbn-b1EMFrTtXw3dXAQ7fTg&usqp=CAU'),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(
            bottom: 3,
            end: 3,
          ),
          child: CircleAvatar(
            radius: 7,
            backgroundColor: Colors.green,
          ),
        ),
      ],
    ),
    SizedBox(
      width: 20,
    ),
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ahmed NAsr Mostafa Ahmed NAsr Mostafa Ahmed NAsr Mostafa ',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 7,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Hello , How Are You My Friend My NAme Is Ahmed ',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Container(
                  width: 7,
                  height: 7,
                  decoration: BoxDecoration(
                      color: Colors.blue, shape: BoxShape.circle),
                ),
              ),
              Text('00:21 PM'),
            ],
          ),
        ],
      ),
    ),
  ],
);

Widget buildStoryItem() => Container(
  width: 60.0,
  child: Column(
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnIyZxJAl5REjZbn-b1EMFrTtXw3dXAQ7fTg&usqp=CAU'),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              bottom: 3,
              end: 3,
            ),
            child: CircleAvatar(
              radius: 7,
              backgroundColor: Colors.green,
            ),
          ),
        ],
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        'Ahmed NAsr Mostafa Ahmed',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      )
    ],
  ),
);
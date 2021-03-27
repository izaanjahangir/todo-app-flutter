import 'package:flutter/material.dart';
import 'package:todo_app/components/todo_item/todo_item.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/config/theme_colors.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Todo> dummyData = [
    new Todo("1", "Some description", false),
    new Todo("2", "Some description", true),
    new Todo("3", "Some description", false)
  ];

  handleTodoStateChange(item, newValue, index) {
    List<Todo> localList = dummyData;

    localList[index].isDone = newValue;

    setState(() {
      dummyData = localList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            color: ThemeColors.lightBlue,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                ...dummyData
                    .asMap()
                    .entries
                    .map((entry) => TodoItem(
                          item: entry.value,
                          index: entry.key,
                          onStateChange: handleTodoStateChange,
                        ))
                    .toList(),
              ],
            )),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todo_app/components/checkbox/checkbox.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/config/theme_colors.dart';

class TodoItem extends StatelessWidget {
  final Function onStateChange;
  final Todo item;
  final int index;

  TodoItem({@required this.onStateChange, this.item, this.index});

  handleStateChange(newValue) {
    onStateChange(item, newValue, index);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: ThemeColors.darkBlue,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          // mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CustomCheckbox(
              value: item.isDone,
              onChanged: handleStateChange,
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(item.description,
                  maxLines: 1,
                  style: TextStyle(fontSize: 16, color: ThemeColors.white)),
            )
          ],
        ),
      ),
    );
  }
}

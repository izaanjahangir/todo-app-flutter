import 'package:flutter/material.dart';
import 'package:todo_app/components/checkbox/checkbox.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/config/theme_colors.dart';

class TodoItem extends StatelessWidget {
  final Function onStateChange;
  final Function onItemDelete;
  final Todo item;
  final int index;

  TodoItem(
      {@required this.onStateChange,
      this.item,
      this.index,
      @required this.onItemDelete});

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
        padding: const EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 15),
        child: Row(
          // mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CustomCheckbox(
              value: item.isDone,
              onChanged: handleStateChange,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                child: Text(item.description,
                    maxLines: 1,
                    style: TextStyle(fontSize: 16, color: ThemeColors.white)),
              ),
            ),
            GestureDetector(
                onTap: () {
                  onItemDelete(index);
                },
                child: Icon(Icons.delete, color: Colors.red))
          ],
        ),
      ),
    );
  }
}

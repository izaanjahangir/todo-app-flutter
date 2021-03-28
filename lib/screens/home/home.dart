import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/components/todo_item/todo_item.dart';
import 'package:todo_app/config/theme_colors.dart';
import 'package:flui/flui.dart';

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

  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  Widget animatedTodo(BuildContext context, int index, animation) {
    Todo item = dummyData[index];

    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1, 0),
        end: Offset(0, 0),
      ).animate(animation),
      child: TodoItem(
        onStateChange: () {},
        onItemDelete: (newIndex) {
          removeItem(newIndex);
        },
        item: item,
        index: index,
      ),
    );
  }

  addItem() {
    setState(() {
      dummyData.insert(0, new Todo("10", "Some Description", false));
    });
  }

  removeItem(indexToRemove) {
    setState(() {
      dummyData.removeAt(indexToRemove);
    });
  }

  handleStateChange(item, newValue, index) {
    setState(() {
      dummyData[index].isDone = newValue;
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
                Expanded(
                    child: ReorderableListView(
                  children: [
                    for (int index = 0; index < dummyData.length; index++)
                      TodoItem(
                          key: Key(index.toString()),
                          item: dummyData[index],
                          index: index,
                          onStateChange: handleStateChange,
                          onItemDelete: removeItem),
                  ],
                  onReorder: (int oldIndex, int newIndex) {
                    if (oldIndex < newIndex) {
                      newIndex -= 1;
                    }
                    final Todo item = dummyData.removeAt(oldIndex);

                    setState(() {
                      dummyData.insert(newIndex, item);
                    });
                  },
                )),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: FLRaisedButton(
                    expanded: true,
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: ThemeColors.darkBlue,
                    textColor: Colors.white,
                    child: Text(
                      'Add Item',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                    onPressed: addItem,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

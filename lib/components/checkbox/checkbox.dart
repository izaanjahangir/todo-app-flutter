import 'package:flutter/material.dart';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:todo_app/config/theme_colors.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final Function onChanged;

  CustomCheckbox({this.value = false, @required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return CircularCheckBox(
        value: value,
        checkColor: ThemeColors.white,
        activeColor: ThemeColors.lightBlue,
        inactiveColor: ThemeColors.white,
        disabledColor: ThemeColors.white,
        onChanged: onChanged);
  }
}

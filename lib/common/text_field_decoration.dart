import 'package:flutter/material.dart';
import 'package:public_tourism/common/constants.dart';

InputDecoration buildTextFieldDecorator({required String hintText}) {
  return InputDecoration(
    hintText: hintText,
    fillColor: AppContants.textFieldColor,
    filled: true,
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
    ),
  );
}
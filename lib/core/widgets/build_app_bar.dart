import 'package:flutter/material.dart';

AppBar buildAppBar(String text) {
  return AppBar(
    title: Center(
      child: Text(
        text,
      ),
    ),
  );
}

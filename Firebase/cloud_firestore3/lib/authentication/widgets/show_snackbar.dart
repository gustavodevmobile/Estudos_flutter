import 'package:flutter/material.dart';

showSnackBar(
    {required BuildContext context,
    required String menssege,
    bool isError = true}) {
  SnackBar snackBar = SnackBar(
    content: Text(menssege),
    backgroundColor: isError ? Colors.red : Colors.green,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

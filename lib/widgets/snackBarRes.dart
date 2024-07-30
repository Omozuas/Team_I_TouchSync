import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void success({String? message, required BuildContext context}) {
  Flushbar(
    icon: Icon(
      CupertinoIcons.check_mark,
      color: Colors.white,
    ),
    shouldIconPulse: false,
    title: "success",
    message: message,
    duration: Duration(seconds: 3),
    flushbarPosition: FlushbarPosition.TOP,
    borderRadius: BorderRadius.all(Radius.circular(30)),
    margin: EdgeInsets.only(left: 120, right: 5, top: 20),
    backgroundColor: Colors.green.withOpacity(0.9),
    maxWidth: 200,
    messageSize: 15,
    titleSize: 15,
  ).show(context);
}

void error({String? message, required BuildContext context}) {
  Flushbar(
    icon: Icon(
      Icons.close_sharp,
      color: Colors.white,
    ),
    shouldIconPulse: false,
    title: "Failed",
    message: message,
    duration: Duration(seconds: 3),
    flushbarPosition: FlushbarPosition.TOP,
    borderRadius: BorderRadius.all(Radius.circular(30)),
    margin: EdgeInsets.only(left: 120, right: 5, top: 20),
    backgroundColor: Colors.red.withOpacity(0.9),
    maxWidth: 200,
    messageSize: 15,
    titleSize: 15,
  ).show(context);
}

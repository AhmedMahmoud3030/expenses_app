import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveFlatButton extends StatelessWidget {
  final Function handler;
  final String text ;

  AdaptiveFlatButton({this.handler,this.text});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            onPressed: handler,
            child: Text(
              text,
              style: Theme.of(context).textTheme.headline6,
            ),
          )
        : FlatButton(
            textColor: Theme.of(context).primaryColor,
            onPressed: handler,
            child: Text(
              text,
            ),
          );
  }
}

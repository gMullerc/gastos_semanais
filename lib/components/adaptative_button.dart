import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeButton extends StatelessWidget {
  const AdaptativeButton(
      {Key? key, required this.label, required this.onPressed})
      : super(key: key);

  final String label;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            color: Theme.of(context).primaryColor,
            child: Text(label),
            onPressed: onPressed,
          )
        : ElevatedButton(
            style: TextButton.styleFrom(
                foregroundColor: Colors.pinkAccent,
                backgroundColor: Theme.of(context).primaryColor),
            child: Text(label,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white)),
            onPressed: onPressed,
          );
  }
}

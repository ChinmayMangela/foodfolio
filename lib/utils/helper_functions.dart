import 'package:flutter/material.dart';

class HelperFunctions {
  static void showSnackBar(BuildContext context, String message,
      [void Function()? onTap]) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        content: Text(message, style: TextStyle(
          color: Theme.of(context).colorScheme.onSurface
        ),),
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeForm extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType inputType;
  final Function(String) onSubmitted;

  AdaptativeForm({
    this.label,
    this.controller,
    this.inputType = TextInputType.text,
    this.onSubmitted,
  });
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
            ),
            child: CupertinoTextField(
              controller: controller,
              onSubmitted: onSubmitted,
              keyboardType: inputType,
              placeholder: label,
              padding: EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 12,
              ),
            ),
          )
        : TextField(
            controller: controller,
            onSubmitted: onSubmitted,
            keyboardType: inputType,
            decoration: InputDecoration(labelText: label),
          );
  }
}

import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  TextInput({
    @required this.formValidator,
    @required this.onChanged,
    @required this.label,
    this.autofocus,
    this.obscureText,
  });
    final Function formValidator;
    final Function onChanged;
    final String label;
    final bool autofocus;
    final bool obscureText;
    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 3),
        child: TextFormField(
          obscureText: obscureText != null ? true : false,
          autofocus: autofocus != null ? true : false,
          validator: (value) => formValidator(value),
          onChanged: (text) => onChanged(text),
          decoration: InputDecoration(
            icon: Icon(Icons.person),
            labelText: label,
          ),
        ),
      );
    }
}


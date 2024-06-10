import 'package:flutter/material.dart';

enum InputDecorationCustom {
  labolBord,
  focusBord,
}

extension IDCustom on InputDecorationCustom {
  dynamic value(BuildContext context, String value) {
    switch (this) {
      case InputDecorationCustom.focusBord:
        return decorationFocusBord(context, value);
      case InputDecorationCustom.labolBord:
        return decorationLabolBord(context, value);
    }
  }
}

InputDecoration decorationLabolBord(BuildContext context, String text_labol,
    {Icon? icon = null}) {
  return InputDecoration(
    icon: icon,
    labelText: text_labol,
    focusedBorder: defaultBorder(Theme.of(context).primaryColor),
    enabledBorder: defaultBorder(Theme.of(context).primaryColor),
    disabledBorder: defaultBorder(Theme.of(context).primaryColor),
    focusedErrorBorder: defaultBorder(Theme.of(context).primaryColor),
    errorBorder: defaultBorder(Theme.of(context).primaryColor),
  );
}

InputDecoration decorationFocusBord(BuildContext context, String text_labol) {
  return InputDecoration(
    hintText: text_labol,
    focusedBorder: defaultBorder(Theme.of(context).primaryColor),
    enabledBorder: defaultBorder(Theme.of(context).primaryColor),
    disabledBorder: defaultBorder(Theme.of(context).primaryColor),
    focusedErrorBorder: defaultBorder(Theme.of(context).primaryColor),
    errorBorder: defaultBorder(Theme.of(context).primaryColor),
  );
}

OutlineInputBorder defaultBorder(Color color) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20)),
    borderSide: BorderSide(color: color),
  );
}

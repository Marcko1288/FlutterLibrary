library my_library;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:flutterlibrary/Enum/Enum_TypeFormatDate.dart';

extension ExtString on String {
  DateTime changeStringToDate(
      {TypeFormatDate type = TypeFormatDate.DD_MM_AAAA}) {
    return new DateFormat(type.value).parse(this);
  }

  double changeStringToDouble() {
    var string = this.changeValutaToString();
    if (isNumeric(string) && string != "") {
      return double.parse(string);
    } else {
      return 0;
    }
  }

  int changeStringToInt() {
    var string = this.changeValutaToString();
    if (isNumeric(string) && string != "") {
      return int.parse(string);
    } else {
      return 0;
    }
  }

  String changeValutaToString() {
    var string =
        this.replaceAll(' €', '').replaceAll('.', '').replaceAll(',', '.');
    return string;
  }

  /* Funzione che restituisce TRUE se il valore passato è un numero, altrimenti FALSE */
  bool isNumeric(String string) {
    final numericRegex = RegExp(r'^-?(([0-9]*)|(([0-9]*)\.([0-9]*)))$');

    return numericRegex.hasMatch(string);
  }

  /* Funzione che restituisce TRUE se il valore passato rispecchia il formato del CF, altrimenti FALSE */
    dynamic get isCF {
    if (this.isNotEmpty){
      final cfRegex =
      //RegExp(r'/^[A-Za-z]{6}[0-9]{2}[A-Za-z]{1}[0-9]{2}[A-Za-z]{1}[0-9]{3}[A-Za-z]{1}$/');
      RegExp(r'^([A-Z]{6}[0-9LMNPQRSTUV]{2}[ABCDEHLMPRST]{1}[0-9LMNPQRSTUV]{2}[A-Z]{1}[0-9LMNPQRSTUV]{3}[A-Z]{1})$|([0-9]{11})$');
      return cfRegex.hasMatch(this.toUpperCase());
    }
    return true;
  }

  /* Funzione che restituisce TRUE se il valore passato rispecchia il formato di PIVA, altrimenti FALSE */
  dynamic get isPIVA {
    if (this.isNotEmpty) {
    final pivaRegex =
    RegExp(r'/^[0-9]{11}$/');

    return pivaRegex.hasMatch(this);
    }
    return true;
  }
}

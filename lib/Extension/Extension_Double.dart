import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension ExtDouble on double {

  String changeDoubleToValuta(){
    return NumberFormat.simpleCurrency(locale: 'it_IT').format(this);
  }

  // Funzione per arrotondare un numero
  double roundUp(int places) {
    var factor = pow(10, places);
    return (this * factor).ceilToDouble() / factor;
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension ExtDouble on double {

  String changeDoubleToValuta(){
    return NumberFormat.simpleCurrency(locale: 'it_IT').format(this);
  }
}
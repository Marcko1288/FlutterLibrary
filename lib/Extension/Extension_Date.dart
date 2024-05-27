import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutterlibrary/Enum/Enum_TypeDate.dart';
import 'package:flutterlibrary/Enum/Enum_TypeFormatDate.dart';
import 'package:intl/date_symbol_data_local.dart';

extension ExtDate on DateTime {
  DateTime addDate({required int value, required TypeDate type}) {
    switch (type) {
      case TypeDate.H:
        return this.add(Duration(hours: value));
      case TypeDate.W:
        return this.add(Duration(days: (7 * value)));
      case TypeDate.D:
        return this.add(Duration(days: value));
      case TypeDate.M:
        return new DateTime(this.year, this.month + value, this.day);
      case TypeDate.Y:
        return new DateTime(this.year + value, this.month, this.day);
      default:
        return this;
    }
  }

  String changeDateToString({TypeFormatDate type = TypeFormatDate.DD_MM_AAAA}) {
    return DateFormat(type.value, 'it').format(this);
  }

  int changeDateToInt({TypeFormatDate type = TypeFormatDate.AAAAMMDD}) {
    var data_string = DateFormat(type.value).format(this);
    return int.parse(data_string);
  }

  DateTime startMonth() {
    return DateTime(this.year, this.month, 1);
  }

  DateTime endMonth() {
    return DateTime(year, month + 1, 0);
  }

  bool compare(DateTime data, TypeQuery type){
  bool output = false;
  switch (type){
    case TypeQuery.EQ:
      if(this.changeDateToString() == data.changeDateToString()) output = true;
      break; // Aggiungi la dichiarazione break per terminare il caso
    case TypeQuery.LT:
      if(this.compareTo(data) < 0) output = true;
      break;
    case TypeQuery.LE:
      if(this.compareTo(data) <= 0) output = true;
      break;
    case TypeQuery.GT:
      if(this.compareTo(data) > 0) output = true;
      break;
    case TypeQuery.GE:
      if(this.compareTo(data) >= 0) output = true;
      break;
    case TypeQuery.NE:
      if(this.changeDateToString() != data.changeDateToString()) output = true;
      break;
    default:
      // Gestione del caso in cui il tipo di query non è supportato
      throw ArgumentError('Tipo di query non supportato: $type');
  }

  return output;
}

}

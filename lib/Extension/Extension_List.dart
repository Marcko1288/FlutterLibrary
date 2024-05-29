import 'package:flutter/material.dart';
import 'package:flutterlibrary/Enum/Enum_TypeSort.dart';

extension CustomSortExtension<T> on List<T> {
  void customSort(Comparable Function(T element) keySelector, TypeSort typeSort) {
    sort((a, b) {
      int compareResult = keySelector(a).compareTo(keySelector(b));
      switch (typeSort) {
        case TypeSort.UP:
          return compareResult <= 0 ? -1 : 1;
        case TypeSort.DO:
          return compareResult >= 0 ? -1 : 1;
        default:
          return 0;
      }
    });
  }

String printListClass() {
   if (isEmpty) return ''; // Se la lista è vuota, restituisce una stringa vuota

  var firstLine = '';
  var otherLines = [];

  List<DBConvertible> list = [this];

  for (var i = 0; i < list.length; i++) {
    var element = list[i]; // Accede all'elemento corrente della lista
    var map = element.toDB();
    var line = '';

    map.forEach((key, value) {
      if (i == 0) {
        // Costruisce la prima linea con i nomi delle chiavi
        firstLine = firstLine.isNotEmpty ? '$firstLine;$key' : key;
      }
      // Costruisce la linea corrente con i valori
      line = line.isNotEmpty ? '$line;$value' : '$value';
    });

    // Aggiunge la linea corrente alla lista di altre linee
    otherLines.add(line);
  }

  // Unisce la prima linea e tutte le altre linee con un ritorno a capo
  String output = '$firstLine\n${otherLines.join('\n')}';
  return output;
}
}

abstract class DBConvertible {
  Map<String, dynamic> toDB();
}

import 'package:flutter/material.dart';
import 'package:flutterlibrary/Enum/Enum_TypeQuery.dart';

extension CustomSortExtension<T> on List<T> {
  void customSort(Comparable Function(T) keySelector, TypeQuery typeQuery) {
    sort((a, b) {
      int compareResult = keySelector(a).compareTo(keySelector(b));
      switch (typeQuery) {
        case TypeQuery.EQ:
          return compareResult == 0 ? 0 : (compareResult > 0 ? 1 : -1);
        case TypeQuery.MI:
          return compareResult < 0 ? -1 : 1;
        case TypeQuery.MIU:
          return compareResult <= 0 ? -1 : 1;
        case TypeQuery.MA:
          return compareResult > 0 ? -1 : 1;
        case TypeQuery.MAU:
          return compareResult >= 0 ? -1 : 1;
        case TypeQuery.NL:
          return compareResult != 0 ? -1 : 1;
        default:
          return 0;
      }
    });
  }
}

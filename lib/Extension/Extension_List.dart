import 'package:flutter/material.dart';
import 'package:flutterlibrary/Enum/Enum_TypeSort.dart';

extension CustomSortExtension<T> on List<T> {
  void customSort(Comparable Function(T) keySelector, TypeSort typeSort) {
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
}

import 'package:flutter/material.dart';
import 'package:flutterlibrary/Enum/Enum_TypeExtraction.dart';

extension GeneralExtensions on Object {
  dynamic extractionDB<T>({
    required Map<String, dynamic> dictionary,
    required T Function(Map<String, dynamic>) fromJson,
    TypeExtraction type = TypeExtraction.multy,
  }) {
    if (dictionary.isEmpty) {
      return type == TypeExtraction.single ? null : [];
    }

    switch (type) {
      case TypeExtraction.single:
        var dic = dictionary.values.first;
        return fromJson(dic);
      case TypeExtraction.multy:
        List<T> array = [];
        for (var dic in dictionary.values) {
          array.add(fromJson(dic));
        }
        return array;
    }
  }
}

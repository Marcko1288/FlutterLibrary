import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

extension MapExtensions<K, V> on Map<K, V> {
  String convertJsonToString(K key) {
    return this[key] is String ? this[key] as String : '';
  }

  DateTime convertJsonToDate(K key) {
    if (this[key] is String) {
      try {
        return DateTime.parse(this[key] as String);
      } catch (e) {
        // Fall back to current date if parsing fails
      }
    }
    return DateTime.now();
  }

  double convertJsonToDouble(K key) {
    if (this[key] is double) {
      return this[key] as double;
    } else if (this[key] is num) {
      return (this[key] as num).toDouble();
    }
    return 0.0;
  }

  int convertJsonToInt(K key) {
    if (this[key] is int) {
      return this[key] as int;
    } else if (this[key] is num) {
      return (this[key] as num).toInt();
    }
    return 0;
  }

  bool convertJsonToBool(K key) {
    return this[key] is bool ? this[key] as bool : false;
  }
}

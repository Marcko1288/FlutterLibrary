import 'package:flutter/material.dart';

extension MapExtensions<K, V> on Map<K, V> {
String convertJsonToString(K key) {
  return this[key] is String ? this[key] : '';
}

DateTime convertJsonToDate(K key) {
  try {
    DateTime.parse(this[key]);
    return DateTime.parse(this[key]);
  } catch (e) {
    return DateTime.now();
  }
}

double convertJsonToDouble(K key) {
  return this[key] is double ? this[key] : 0.0;
}

int convertJsonToInt(K key) {
  return this[key] is int ? this[key] : 0;
}

bool convertJsonToBool(K key) {
  return this[key] is bool ? this[key] : false;
}
}

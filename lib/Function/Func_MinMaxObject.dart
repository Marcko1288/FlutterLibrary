import 'package:flutter/material.dart';

List<double> getMinMaxValues<T>(List<T> objects, double Function(T) getValue) {
  if (objects.isEmpty) {
    throw ArgumentError('The list of objects cannot be empty.');
  }

  double minValue = getValue(objects[0]);
  double maxValue = getValue(objects[0]);

  for (T obj in objects) {
    double value = getValue(obj);
    if (value < minValue) {
      minValue = value;
    }
    if (value > maxValue) {
      maxValue = value;
    }
  }

  return [minValue, maxValue];
}

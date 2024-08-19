import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterlibrary/Extension/Extension_Double.dart';

// Funzione per calcolare il valore del salto
double dynamicJumpYAss<T>(List<T> array, double Function(T element) getValue) {
  // Valori predefiniti
  double maxV = 100;
  double minV = 1;

  // Controlla se l'array non è vuoto
  if (array.isNotEmpty) {
    maxV = array.map(getValue).reduce((value, element) => value > element ? value : element);
    minV = array.map(getValue).reduce((value, element) => value < element ? value : element);
  }

  // Arrotonda i valori minimo e massimo
  //var roundedYAxisMaxValue = roundUp(maxV, 2);
  //var roundedYAxisMinValue = roundUp(minV, 2);
  maxV.roundUp(2);
  minV.roundUp(2);

  // Calcola il valore del salto (stride)
  //var strideValue = (roundedYAxisMaxValue - roundedYAxisMinValue) / 5.0;
  var strideValue = (maxV - minV) / 5.0;

  // Verifica che il valore del salto non sia NaN o zero
  if (strideValue.isNaN || strideValue == 0) {
    return 10.0;
  } else {
    return strideValue;
  }
}

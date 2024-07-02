import 'package:flutter/material.dart';

List<DateTime> holidaysIT({required int year_da, required int year_a}) {
  List<DateTime> holidays = [];
  List<String> day_holiday = [
    '01/01', //Capodanno
    '06/01', //Epifania
    '25/04', //Liberazione
    '01/05', //Festa dei Lavoratori
    '02/06', //Festa della Repubblica
    '15/08', //Ferragosto
    '01/11', //Tutti i Santi
    '08/12', //Immacolata
    '25/12', //Natale
    '26/12', //Santo Stefano
  ];

  //int year_da = DateTime.now().year - 5;
  //int year_a = DateTime.now().year + 10;

  for (int year = year_da; year <= year_a; year++) {
    for (String day in day_holiday) {
      holidays.add(DateTime.parse(
          '$year-${day.substring(3, 5)}-${day.substring(0, 2)}'));
    }
    holidays.add(calculateEaster(year));
  }

  holidays.sort();

  return holidays;
}

DateTime calculateEaster(int year) {
  int a = year % 19;
  int b = year ~/ 100;
  int c = year % 100;
  int d = b ~/ 4;
  int e = b % 4;
  int f = (b + 8) ~/ 25;
  int g = (b - f + 1) ~/ 3;
  int h = (19 * a + b - d - g + 15) % 30;
  int i = c ~/ 4;
  int k = c % 4;
  int l = (32 + 2 * e + 2 * i - h - k) % 7;
  int m = (a + 11 * h + 22 * l) ~/ 451;
  int month = (h + l - 7 * m + 114) ~/ 31;
  int day = ((h + l - 7 * m + 114) % 31) + 1;

  return DateTime(year, month, day);
}

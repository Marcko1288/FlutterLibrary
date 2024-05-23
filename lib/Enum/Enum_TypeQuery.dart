import 'package:flutter/material.dart';

///Le tipologie di valore che può assumere:
///
/// EQ --> Uguale
///
/// MI --> Minore Strettamente
///
/// MIU --> Minore e Uguale
///
/// MA --> Maggiore Strettamente
///
/// MAU --> Maggiore e Uguale
///
/// NL --> Diverso

enum TypeQuery {
  EQ,
  MI,
  MIU,
  MA,
  MAU,
  NL,
}

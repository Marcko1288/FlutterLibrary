import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:excel/excel.dart';

Future<List<Map<String, dynamic>>> loadExcelToHive(
    {bool header = false, required Function(List<Data?>) createRecord}) async {
  List<Map<String, dynamic>> records = [];

  // Seleziona il file Excel
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['xlsx'],
  );

  if (result != null && result.files.single.bytes != null) {
    Uint8List bytes = result.files.single.bytes!;
    // Leggi il file Excel
    var excel = Excel.decodeBytes(bytes);

    // Itera attraverso le righe e le colonne del file Excel
    // Ma prende solo il primo foglio che trova
    var table = excel.tables.keys.first; //Recupero il NOME del primo foglio
    var rows =
        excel.tables[table]!.rows; //Recupero tutte le righe presenti nel foglio
    if (header) rows.removeAt(0); //Elimina la prima riga (intestazione)

    for (var row in rows) {
      // Supponiamo che ogni riga rappresenti un record e ogni cella un campo
      var record = createRecord(row);
      records.add(record);
    }
  } else {
    // L'utente ha annullato la selezione del file
    print('L\'utente ha annullato la selezione del file');
  }
  return records;
}

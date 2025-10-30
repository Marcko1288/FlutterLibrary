import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterlibrary/Enum/Enum_TypeQuery.dart';

import 'Firestore.dart';

//Installare il package: flutter pub add firebase_core
//Installare il package: flutter pub add cloud_firestore

class FireStore {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> dirDB({
    required String db,
    required String document,
    required String value,
  }) {
    return FirebaseFirestore.instance
        .collection(db)
        .doc(document)
        .collection(value);
  }

  Future<void> insertFirestore({
    required CollectionReference patch,
    required Map<String, dynamic> map,
    bool test = false,
  }) async {
    var route = patch.doc(map['uid']);
    if (!test) {
      try {
        await route.set(map).onError((error, stackTrace) => print('$error'));
      } on FirebaseException catch (e) {
        print(
          '❌ Errore durante il caricamento in Firebase FireStore: ${e.code} - ${e.message}',
        );
      } catch (e) {
        print('❌ Errore generico insertFireStorage: $e');
      }
    }
  }

  Future<void> cancelFireStore({
    required CollectionReference patch,
    required Map<String, dynamic> map,
    bool test = false,
  }) async {
    var route = patch.doc(map['uid']);
    if (!test) {
      try {
        await route.delete().onError((error, stackTrace) => print('$error'));
      } on FirebaseException catch (e) {
        print(
          '❌ Errore durante il caricamento in Firebase FireStore: ${e.code} - ${e.message}',
        );
      } catch (e) {
        print('❌ Errore generico insertFireStorage: $e');
      }
    }
  }

  Future<void> modifyFireStore({
    required CollectionReference patch,
    required Map<String, dynamic> map,
    bool test = false,
  }) async {
    map['data_modify'] = DateTime.now();
    var route = patch.doc(map['uid']);
    if (!test) {
      try {
        await route.update(map).onError((error, stackTrace) => print('$error'));
      } on FirebaseException catch (e) {
        print(
          '❌ Errore durante il caricamento in Firebase FireStore: ${e.code} - ${e.message}',
        );
      } catch (e) {
        print('❌ Errore generico insertFireStorage: $e');
      }
    }
  }

  Future<List<Map<String, dynamic>>> queryFireStore({
    required CollectionReference patch,
    TypeQuery type = TypeQuery.NL,
    String campo = '',
    String value = '',
  }) async {
    List<Map<String, dynamic>> map = [];

    try {
      var route = patchQuery(
        patch: patch,
        type: type,
        campo: campo,
        value: value,
      );
      var elementQuery = await route.get().then(
        (value) {
          for (var element in value.docs) {
            map.add(element.data() as Map<String, dynamic>);
          }
        },
        onError: (e) {
          print("Error completing: $e");
          return [];
        },
      );

      return map;
    } on FirebaseException catch (e) {
      return [];
    } catch (e) {
      print('❌ Errore generico insertFireStorage: $e');
      return [];
    }
  }

  Query patchQuery({
    required CollectionReference patch,
    TypeQuery type = TypeQuery.NL,
    String campo = '',
    String value = '',
  }) {
    switch (type) {
      case TypeQuery.EQ:
        return patch.where(campo, isEqualTo: value);
      case TypeQuery.MI:
        return patch.where(campo, isLessThan: value);
      case TypeQuery.MIU:
        return patch.where(campo, isLessThanOrEqualTo: value);
      case TypeQuery.MA:
        return patch.where(campo, isGreaterThan: value);
      case TypeQuery.MAU:
        return patch.where(campo, isGreaterThanOrEqualTo: value);
      case TypeQuery.NL:
        return patch;
    }
  }
}


// class FireStore {
//   final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

//   CollectionReference<Map<String, dynamic>> dirDB(
//       {required String db, required String document, required String value}) {
//     //String db = 'Database';
//     return _firebaseFirestore.collection(db).doc(document).collection(value);
//   }

//   Future<void> insertFirestore(
//       {required CollectionReference patch,
//       required Map<String, dynamic> map}) async {
//     var route = patch.doc(map['uid']);
//     if (!Uri.base.toString().contains('localhost')) {
//        await route.set(map).onError((error, stackTrace) => print('$error'));
//     }
//   }

//   Future<void> cancelFireStore(
//       {required CollectionReference patch,
//       required Map<String, dynamic> map}) async {
//     var route = patch.doc(map['uid']);
//     if (!Uri.base.toString().contains('localhost')) {
//        await route.delete().onError((error, stackTrace) => print('$error'));
//     }
//   }

//   Future<void> modifyFireStore(
//       {required CollectionReference patch,
//       required Map<String, dynamic> map}) async {
//     map['data_modify'] = DateTime.now();
//     var route = patch.doc(map['uid']);
//     if (!Uri.base.toString().contains('localhost')) {
//        await route.update(map).onError((error, stackTrace) => print('$error'));
//     }
//   }

//   Future<List<Map<String, dynamic>>> queryFireStore(
//       {required CollectionReference patch,
//       TypeQuery type = TypeQuery.NL,
//       String campo = '',
//       String value = ''}) async {
//     List<Map<String, dynamic>> map = [];
//     var route =
//         patchQuery(patch: patch, type: type, campo: campo, value: value);
//     var elementQuery = await route.get().then((value) {
//       for (var element in value.docs) {
//         map.add(element.data() as Map<String, dynamic>);
//       }
//     }, onError: (e) {
//       print("Error completing: $e");
//       return [];
//     }); //=> print("Error completing: $e"));
//     return map;
//   }

//   Query patchQuery(
//       {required CollectionReference patch,
//       TypeQuery type = TypeQuery.NL,
//       String campo = '',
//       String value = ''}) {
//     switch (type) {
//       case TypeQuery.EQ:
//         return patch.where(campo, isEqualTo: value);
//       case TypeQuery.MI:
//         return patch.where(campo, isLessThan: value);
//       case TypeQuery.MIU:
//         return patch.where(campo, isLessThanOrEqualTo: value);
//       case TypeQuery.MA:
//         return patch.where(campo, isGreaterThan: value);
//       case TypeQuery.MAU:
//         return patch.where(campo, isGreaterThanOrEqualTo: value);
//       case TypeQuery.NL:
//         return patch;
//     }
//   }
// }

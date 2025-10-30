import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

//Installare il package: flutter pub add firebase_core
//Installare il package: flutter pub add firebase_storage

class FireStorage {
  final Reference _firebaseStorage = FirebaseStorage.instance.ref();

  Future<String> insertFireStorage({
    required String path,
    required Uint8List data,
  }) async {
    final ref = FirebaseStorage.instance.ref().child(path);
    final meta = SettableMetadata(contentType: 'image/jpeg');

    try {
      print('📤 Uploading to: $path (${data.lengthInBytes} bytes)');

      final task = ref.putData(data, meta);
      final snapshot = await task.whenComplete(() => null);
      final downloadUrl = await snapshot.ref.getDownloadURL();
      print('📤 Uploading downloadUrl: $downloadUrl');
      return downloadUrl;
    } on FirebaseException catch (e) {
      print(
        '❌ Errore durante il caricamento in Firebase Storage: ${e.code} - ${e.message}',
      );
      return '';
    } catch (e) {
      print('❌ Errore generico insertFireStorage: $e');
      return '';
    }
  }

  Future<bool> deleteFireStorage({
    required String path,
  }) async {
    final ref = _firebaseStorage.child(path);

    try {
      _firebaseStorage.delete();
      return true;
    } on FirebaseException catch (e) {
      print(
        '❌ Errore durante la cancellazione da Firebase Storage: ${e.code} - ${e.message}',
      );
      return false;
    } catch (e) {
      print('❌ Errore generico deleteFireStorage: $e');
      return false;
    }
  }

  Future<Uint8List?> queryFireStorage({required String path}) async {
    final ref = _firebaseStorage.child(path);
    try {
      // Scarica i byte (massimo 10 MB, modificabile)
      const int maxSize = 10 * 1024 * 1024; // 10 MB
      final Uint8List? data = await ref.getData(maxSize);

      if (data != null) {
        print(
          '✅ File caricato da Firebase: $path (${data.lengthInBytes} bytes)',
        );
        return data;
      } else {
        print('⚠️ Nessun dato trovato per: $path');
        return null;
      }
    } on FirebaseException catch (e) {
      print(
        '❌ Errore durante il download da Firebase Storage: ${e.code} - ${e.message}',
      );
      return null;
    } catch (e) {
      print('❌ Errore generico queryFireStorage: $e');
      return null;
    }
  }
}

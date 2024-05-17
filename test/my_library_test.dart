import 'package:flutter_test/flutter_test.dart';
import 'package:flutterlibrary/my_library.dart';

void main() {
  test('sayHello returns correct greeting', () {
    final myLibrary = MyLibrary();
    expect(myLibrary.sayHello('World'), 'Hello, World!');
  });
}

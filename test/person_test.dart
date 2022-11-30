import 'package:exercise_flutter_unit_test/person.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group("Mengecek class person", () {
    Person person = Person();

    test('test inisialisasi objek person', () {
      print("test 1");
      expect(person.name, equals("no name"));
      expect(person.getAge, equals(0));
    });

    test("test age harus positif", () {
      print("test 2");
      person.age = -5;
      expect(person.getAge, isPositive);
    });

    // we can using up to 7 match
    test("Angka keberuntungan harus 3 buah bilangan positif", () {
      print("test 3");
      //syarat pertama adalah panjang tiga
      //syarat kedua number tidak ada yg negative
      expect(person.luckyNumbers, allOf([hasLength(equals(3)), isNot(anyElement(isNegative))]));
    });
  });

  //dijalankan sebelum test
  setUp(() {
    print("set up");
  });

  //dijalankan setelah test (walaupun tidak berhasil tetap jalan)
  tearDown((){
    print("tear down");
  });
}

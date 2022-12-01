import 'package:exercise_flutter_unit_test/warrior.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockWarrior extends Mock implements Warrior {}

void main() {
  group("group mock test", () {
    MockWarrior warrior = MockWarrior();

    test('verivy demo', () {
      warrior.rest();
      warrior.training();
      verifyInOrder([
        warrior.rest(),
        warrior.training(),
      ]);
    });

    test("Null Demo", () {
      expect(warrior.fullname, isNull);
    });

    test("thenReturn Demo", () {
      when(warrior.fullname).thenReturn("farhan");
      expect(warrior.fullname, equals("farhan"));
    });

    test("thenThrow Demo", () {
      when(warrior.rest()).thenThrow(Exception("Can't sleep"));
      expect(() => warrior.rest(), throwsException);
    });

    test("thenAnswer Demo", () async {
      when(warrior.training()).thenAnswer((_) => Future.value(true));
      bool result = await warrior.training()!;
      expect(result, equals(true));
    });
  });
}

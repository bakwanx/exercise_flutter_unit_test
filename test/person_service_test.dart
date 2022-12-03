import 'package:exercise_flutter_unit_test/person_two.dart';
import 'package:exercise_flutter_unit_test/services/person_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

class MockClient extends Mock with http.Client {

}

void main() {
  http.Client client = MockClient();

  test("Test ambil data", () async {
      String id = "1";

      var response = client.get(
        Uri.parse(".../persons" + id),
        headers: {
          'Content-type': 'application/json'
        }
      );

      when(response).thenAnswer(
        (_) async => Future.value(
          http.Response(
          '''
          {
            "id": ${id},
            "name": "Dodi",
            "age": 20
          }
        ''',
            200,
          ),
        ),
      );


      PersonTwo? personTwo = await PersonService.getPersonById(id, client);
      expect(personTwo!, equals(PersonTwo(id: 1, name: "Dodi", age: 20)));
    },
  );
}

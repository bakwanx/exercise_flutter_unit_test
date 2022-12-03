import 'dart:convert';

import 'package:exercise_flutter_unit_test/person_two.dart';
import 'package:http/http.dart' as http;

class PersonService {

  static Future<PersonTwo?> getPersonById(String id, http.Client client) async {
    String url = ".../persons" + id;

    var response = await client.get(Uri.parse(url));

    if (response.statusCode != 200) {
      throw Exception("Error");
    }

    var result = jsonDecode(response.body);

    return PersonTwo.fromJson(result);
  }
}

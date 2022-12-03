import 'package:equatable/equatable.dart';

class PersonTwo extends Equatable {

  int? id;
  String? name;
  int? age;

  PersonTwo({this.id, this.name, this.age});

  factory PersonTwo.fromJson(Map<String, dynamic> json){
    return PersonTwo(
      id: json["id"],
      name: json["name"],
      age: json["age"],
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, age];


}
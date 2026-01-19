import 'dart:convert';

class User {
  final String id;
  final String name;
  final String password;
  User({required this.name, required this.password, required this.id});
  //Transforme l'objet User en Map
  Map<String, dynamic> toMap() {
    return {"id": id, "name": name, "password": password};
  }

  //Transforme le Map en text Json
  String toJson() => json.encode(toMap());

  //Crée un user à partir d'un text Json
  factory User.fromJson(String source) {
    final Map<String, dynamic> map = json.decode(source);
    return User(name: map["name"], password: map['password'], id: map['id']);
  }
}

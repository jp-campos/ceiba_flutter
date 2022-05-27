import 'dart:convert';

import 'package:prueba_ceiba_flutter/domain/user.dart';
import 'package:prueba_ceiba_flutter/domain/user_gateway.dart';
import 'package:http/http.dart' as http;

const _baseUrl = 'https://jsonplaceholder.typicode.com';

class UserApi implements UserGateway {
  @override
  Future<List<User>> listUsers() async {
    final uri = Uri.parse('$_baseUrl/users');
    final response = await http.get(uri);
    Iterable users = jsonDecode(response.body);

    return users.map((e) => _mapUser(e)).toList();
  }

  @override
  Future<void> saveUsers(List<User> users) async {
    // TODO: implement saveUsers
  }

  User _mapUser(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      mail: json['email'],
      phone: json['phone'],
    );
  }
}

import 'package:prueba_ceiba_flutter/domain/user.dart';

abstract class UserGateway {
  Future<List<User>> listUsers();
  Future<void> saveUsers(List<User> users);
}

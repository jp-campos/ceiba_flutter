import 'package:prueba_ceiba_flutter/domain/user.dart';
import 'package:prueba_ceiba_flutter/domain/user_gateway.dart';

class UserUsecase {
  final UserGateway _apiGateway;
  final UserGateway _cacheGateway;

  UserUsecase(this._apiGateway, this._cacheGateway);

  Future<List<User>> listUsers() async {
    var users = await listUsersCache();
    if (users.isEmpty) {
      users = await listUsersApi();
      saveUsers(users);
    }
    return users;
  }

  Future<List<User>> listUsersCache() async {
    return _cacheGateway.listUsers();
  }

  Future<List<User>> listUsersApi() async {
    return _apiGateway.listUsers();
  }

  Future<void> saveUsers(List<User> users) async {
    return _cacheGateway.saveUsers(users);
  }
}

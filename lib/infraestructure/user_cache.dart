import 'package:hive_flutter/hive_flutter.dart';
import 'package:prueba_ceiba_flutter/domain/user.dart';
import 'package:prueba_ceiba_flutter/domain/user_gateway.dart';
import 'package:prueba_ceiba_flutter/infraestructure/entities/user_entity.dart';

const _boxName = 'users';
const _keyName = 'users';

class UserCache implements UserGateway {
  Future<Box> get box async => await Hive.openBox(_boxName);

  @override
  Future<List<User>> listUsers() async {
    List<UserEntity>? userEntities =
        (await box).get(_keyName)?.cast<UserEntity>();
    if (userEntities != null) {
      final users = userEntities.map((e) => e.toUser()).toList();
      return users;
    } else {
      return [];
    }
  }

  @override
  Future<void> saveUsers(List<User> users) async {
    final entities = users.map((u) => UserEntity.fromUser(u)).toList();
    (await box).put(_keyName, entities);
  }
}

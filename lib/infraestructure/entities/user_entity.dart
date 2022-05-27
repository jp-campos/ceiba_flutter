import 'package:hive/hive.dart';
import 'package:prueba_ceiba_flutter/domain/user.dart';

part 'user_entity.g.dart';

@HiveType(typeId: 0)
class UserEntity {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String mail;
  @HiveField(3)
  String phone;

  UserEntity({
    required this.id,
    required this.name,
    required this.mail,
    required this.phone,
  });

  User toUser() {
    return User(id: id, mail: mail, phone: phone, name: name);
  }

  static UserEntity fromUser(User u) {
    return UserEntity(id: u.id, mail: u.mail, phone: u.phone, name: u.name);
  }
}

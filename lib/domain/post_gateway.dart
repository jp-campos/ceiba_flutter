import 'package:prueba_ceiba_flutter/domain/post.dart';

abstract class PostGateway {
  Future<List<Post>> getPostsbyUser(int userId);
}

import 'package:prueba_ceiba_flutter/domain/post.dart';
import 'package:prueba_ceiba_flutter/domain/post_gateway.dart';

class PostUsecase {
  final PostGateway _postGateway;

  PostUsecase(this._postGateway);

  Future<List<Post>> listPostsByUser(int userId) {
    return _postGateway.getPostsbyUser(userId);
  }
}

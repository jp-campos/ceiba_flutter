import 'dart:convert';

import 'package:prueba_ceiba_flutter/domain/post.dart';
import 'package:prueba_ceiba_flutter/domain/post_gateway.dart';
import 'package:http/http.dart' as http;

const host = 'https://jsonplaceholder.typicode.com';

class PostApi implements PostGateway {
  @override
  Future<List<Post>> getPostsbyUser(int userId) async {
    Uri uri = Uri(
      scheme: 'https',
      host: 'jsonplaceholder.typicode.com',
      path: '/posts/',
      queryParameters: {'userId': '$userId'},
    );

    final response = await http.get(uri);
    Iterable list = jsonDecode(response.body);
    return list.map((e) => _postMapper(e)).toList();
  }

  Post _postMapper(Map<String, dynamic> json) => Post(
        id: json['id'],
        userId: json['userId'],
        body: json['body'],
        title: json['title'],
      );
}

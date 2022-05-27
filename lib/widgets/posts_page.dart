import 'package:flutter/material.dart';
import 'package:prueba_ceiba_flutter/domain/post.dart';
import 'package:prueba_ceiba_flutter/domain/posts_usecase.dart';
import 'package:prueba_ceiba_flutter/domain/user.dart';
import 'package:prueba_ceiba_flutter/infraestructure/post_api.dart';
import 'package:prueba_ceiba_flutter/widgets/user_card.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({required this.user, Key? key}) : super(key: key);
  final User user;
  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  late Future<List<Post>> posts;
  late PostUsecase usecase;
  @override
  void initState() {
    usecase = PostUsecase(PostApi());
    posts = usecase.listPostsByUser(widget.user.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.arrow_back_ios),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          UserCard(user: widget.user),
          SizedBox(
            height: 10,
          ),
          FutureBuilder(
            future: posts,
            builder: (ctx, AsyncSnapshot<List<Post>> snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (ctx, i) {
                      return _toListTile(snapshot.data![i]);
                    },
                  ),
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          )
        ],
      ),
    );
  }

  Widget _toListTile(Post p) {
    return Card(
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        title: Text(p.title),
        subtitle: Text(p.body),
      ),
    );
  }
}

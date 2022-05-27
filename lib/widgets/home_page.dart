import 'package:flutter/material.dart';
import 'package:prueba_ceiba_flutter/domain/user.dart';
import 'package:prueba_ceiba_flutter/domain/user_usecase.dart';
import 'package:prueba_ceiba_flutter/infraestructure/user_api.dart';
import 'package:prueba_ceiba_flutter/infraestructure/user_cache.dart';
import 'package:prueba_ceiba_flutter/widgets/posts_page.dart';
import 'package:prueba_ceiba_flutter/widgets/search_bar.dart';
import 'package:prueba_ceiba_flutter/widgets/user_card.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, this.usecase}) : super(key: key);
  final UserUsecase? usecase;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late UserUsecase _usecase;
  late Future<List<User>> users;
  String searchText = '';

  @override
  void initState() {
    _usecase = widget.usecase ?? UserUsecase(UserApi(), UserCache());

    users = _usecase.listUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Prueba Ceiba'),
          centerTitle: false,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              SearchBar(
                label: 'Buscar usuario',
                onValueChanged: (value) {
                  setState(() {
                    searchText = value;
                  });
                },
              ),
              SizedBox(
                height: 30,
              ),
              FutureBuilder(
                future: users,
                builder: _userListBuilder,
              ),
            ],
          ),
        ));
  }

  List<User> _getFilteredUsers(List<User> users) {
    if (searchText == '') {
      return users;
    }
    String up(String s) => s.toUpperCase();
    return users.where((u) => up(u.name).startsWith(up(searchText))).toList();
  }

  void _nagivateToPosts(User u) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) {
        return PostsPage(user: u);
      }),
    );
  }

  Widget _userListBuilder(
      BuildContext ctx, AsyncSnapshot<List<User>> snapshot) {
    if (snapshot.hasData) {
      var list = snapshot.data!;
      list = _getFilteredUsers(list);

      return list.isEmpty
          ? Text('List is empty')
          : Expanded(
              child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (ctx, i) {
                    final user = list[i];
                    return UserCard(
                      user: user,
                      onViewPosts: _nagivateToPosts,
                    );
                  }),
            );
    } else {
      return CircularProgressIndicator();
    }
  }
}

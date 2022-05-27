import 'package:flutter/material.dart';
import 'package:prueba_ceiba_flutter/domain/user.dart';
import 'package:prueba_ceiba_flutter/theme/colors.dart';
import 'package:prueba_ceiba_flutter/theme/text.dart';

class UserCard extends StatelessWidget {
  const UserCard({required this.user, this.onViewPosts, Key? key})
      : super(key: key);
  final User user;
  final void Function(User user)? onViewPosts;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(bottom: 20),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleText(user.name),
              _iconText(icon: Icons.phone, text: user.phone),
              _iconText(icon: Icons.mail, text: user.mail),
              onViewPosts != null
                  ? Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                          style: TextButton.styleFrom(primary: primaryColor),
                          onPressed: () => onViewPosts?.call(user),
                          child: Text(
                            'VER PUBLICACIONES',
                          )),
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ));
  }

  Widget _iconText({required IconData icon, required String text}) {
    return Row(
      children: [
        Icon(
          icon,
        ),
        SizedBox(width: 5),
        Text(text),
      ],
    );
  }
}

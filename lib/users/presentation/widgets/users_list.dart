import 'package:flutter/material.dart';
import 'package:my_network_practice/users/data/models/user.dart';
import 'package:my_network_practice/users/presentation/widgets/user_tile.dart';

class UsersList extends StatelessWidget {
  const UsersList({
    super.key,
    required this.users,
  });

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      final currentUser = users[index];
      return UserTile(user: currentUser);
    }, itemCount: users.length,);
  }
}

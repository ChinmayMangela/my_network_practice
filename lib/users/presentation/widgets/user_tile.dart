import 'package:flutter/material.dart';
import 'package:my_network_practice/users/data/models/user.dart';

class UserTile extends StatelessWidget {
  const UserTile({super.key, required this.user,});

  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(user.image!),
      title: Text('${user.firstName} ${user.lastName}'),
      subtitle: Text(user.email!),
      trailing: Text(user.phone!),
    );
  }
}

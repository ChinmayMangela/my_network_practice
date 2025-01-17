import 'package:flutter/material.dart';
import 'package:my_network_practice/shared/result.dart';
import 'package:my_network_practice/users/data/api/user_api_impl.dart';
import 'package:my_network_practice/users/data/repository/user_repository_impl.dart';
import 'package:my_network_practice/users/presentation/widgets/users_list.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userRepository = UserRepositoryImpl(userApi: UserApiImpl());
    return Scaffold(
      body: _buildBody(userRepository),
    );
  }

  Widget _buildBody(UserRepositoryImpl userRepository) {
    return FutureBuilder(future: userRepository.fetchUsers(), builder: (context, snapshot) {
      if(snapshot.connectionState == ConnectionState.waiting) {
        return _buildCircularProgressIndicator();
      } else if(snapshot.hasData) {
        final result = snapshot.data;
        if(result!.state == ResultState.success) {
          final users = result.data;
          return UsersList(users: users!);
        } else {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }
      } else {
        return const Center(
          child: Text('Something went wrong'),
        );
      }
    },);
  }

  Widget _buildCircularProgressIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

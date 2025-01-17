import 'package:my_network_practice/users/data/api/user_api.dart';
import 'package:my_network_practice/users/data/models/user.dart';
import 'package:my_network_practice/users/domain/repository/user_repository.dart';

import '../../../shared/result.dart';

class UserRepositoryImpl extends UserRepository {
  final UserApi userApi;

  UserRepositoryImpl({
    required this.userApi,
  });

  @override
  Future<Result<List<User>>> fetchUsers() async {
    try {
      final users = await userApi.fetchUsers();
      return Result.success(users);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}

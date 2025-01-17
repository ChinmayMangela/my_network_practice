

import 'package:my_network_practice/users/data/models/user.dart';

import '../../../shared/result.dart';

abstract class UserRepository {

  Future<Result<List<User>>> fetchUsers();
}
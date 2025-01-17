

import 'package:my_network_practice/users/data/models/user.dart';

abstract class UserApi {

  Future<List<User>> fetchUsers();
}
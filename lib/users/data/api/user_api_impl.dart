

import 'dart:convert';

import 'package:my_network_practice/users/data/api/user_api.dart';
import 'package:http/http.dart'as http;
import '../models/user.dart';

class UserApiImpl extends UserApi {

  @override
  Future<List<User>> fetchUsers() async {
    try {
      final response = await http.get(Uri.parse('https://dummyjson.com/users'));
      if(response.statusCode == 200) {
        final userData = jsonDecode(response.body);
        final List<dynamic> users = userData['users'];
        return users.map((user) => User.fromJson(user)).toList();
      } else {
        throw Exception('HTTP error ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching users: $e');
    }
  }
}

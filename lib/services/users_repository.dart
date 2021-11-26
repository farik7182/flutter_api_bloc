import 'package:flutter_bloclib/models/user.dart';
import 'package:flutter_bloclib/services/users_api_provider.dart';

class UsersRepository {
  UserProvider userProvider = UserProvider();
  Future<List<User>> getAllUsers() => userProvider.getUsers();
}

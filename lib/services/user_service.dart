import 'dart:async';

import 'package:states/models/user.dart';

class _UserService {
  User? _user;
  User? get user => this._user;

  StreamController<User> _userController = StreamController<User>.broadcast();
  Stream<User> get userStrem => _userController.stream;

  bool get userExists => this._user != null;

  void loadUser(User user) {
    this._user = user;
    this._userController.add(this._user!);
  }

  void changeAge(int age) {
    this._user!.age = age;
    this._userController.add(this._user!);
  }
}

final userService = new _UserService();

part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {
  final userExists = false;
}

class UserActice extends UserState {
  final userExists = false;
  final User? user;

  UserActice(this.user);
}

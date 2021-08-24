part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class SetUser extends UserEvent {
  final User? user;
  SetUser({required this.user});
}

class ChangeAge extends UserEvent {
  final int newAge;

  ChangeAge({required this.newAge});
}

class AddProfession extends UserEvent {
  final String profession;

  AddProfession({required this.profession});
}

class RemoveUser extends UserEvent {}

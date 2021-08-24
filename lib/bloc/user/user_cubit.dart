import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:states/models/user.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  void selectUser(User? user) => emit(UserActice(user));

  void changeAge(int age) {
    final currentState = state;
    if (currentState is UserActice) {
      final updatedUser = currentState.user!.copyWith(age: age);
      emit(UserActice(updatedUser));
    }
  }

  void addProfession() {
    final currentState = state;
    if (currentState is UserActice) {
      final newProfessions = [
        ...currentState.user!.professions!,
        'Profesión: ${currentState.user!.professions!.length + 1}'
      ];
      final updatedUser = currentState.user!.copyWith(
        professions: newProfessions,
      );
      emit(UserActice(updatedUser));
    }
  }

  void removeUser() => emit(UserInitial());
}

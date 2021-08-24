import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:states/models/user.dart';

part 'user_state.dart';
part 'user_events.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    // Receives an Event and changes the State
    if (event is SetUser) {
      yield UserState(user: event.user);
    } else if (event is ChangeAge) {
      yield UserState(user: state.user!.copyWith(age: event.newAge));
    } else if (event is AddProfession) {
      final professions = [
        ...state.user!.professions!,
        event.profession,
      ];
      yield UserState(user: state.user!.copyWith(professions: professions));
    } else if (event is RemoveUser) {
      yield UserState();
    }
  }
}

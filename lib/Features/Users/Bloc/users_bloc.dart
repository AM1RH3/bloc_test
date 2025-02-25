import 'package:bloc_test/Features/Users/Bloc/users.events.dart';
import 'package:bloc_test/Features/Users/Bloc/users.states.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  //initialize
  //? when init... create a instance and add a empty List ↓
  UsersBloc() : super(UsersState([])) {
    on<AddUser>((event, emit) {
      state.users.add('${event.name} - ${DateTime.now().second}');
      return emit(UsersState(state.users));
    });
    on<ClearUser>((event, emit) {
      state.users.clear();
      return emit(UsersState(state.users));
    });
    on<RemoveUser>((event, emit) {
      state.users.removeAt(event.index);
      return emit(UsersState(state.users));
    });
  }
}


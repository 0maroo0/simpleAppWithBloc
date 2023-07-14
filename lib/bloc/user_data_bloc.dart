import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../model.dart';
import '../userRepo.dart';

part 'user_data_event.dart';
part 'user_data_state.dart';

class UserDataBloc extends Bloc<UserDataEvent, UserDataState> {
  final UserRepository _userRepository;

  UserDataBloc(this._userRepository) : super(UserDataLodaing()) {
    on<UserDataEvent>((event, emit) async {
      emit(UserDataLodaing());
      try {
        final users = await _userRepository.getUsers();
        emit(UserDataLoded(users));
      } catch (e) {
        emit(UserDataLodError(e.toString()));
      }
    });
  }
}

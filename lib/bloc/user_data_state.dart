part of 'user_data_bloc.dart';

abstract class UserDataState extends Equatable {
  const UserDataState();

  @override
  List<Object> get props => [];
}

class UserDataLodaing extends UserDataState {
  @override
  List<Object> get props => [];
}

class UserDataLoded extends UserDataState {
  final List<UserModel> users;
  UserDataLoded(this.users);
  @override
  List<Object> get props => [users];
}

class UserDataLodError extends UserDataState {
  final String error;
  UserDataLodError(this.error);
  @override
  List<Object> get props => [error];
}

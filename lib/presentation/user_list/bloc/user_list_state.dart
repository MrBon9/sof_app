part of 'user_list_bloc.dart';

abstract class UserListState extends Equatable {
  List<UserModel> get data;

  const UserListState();

  @override
  List<Object> get props => [data];
}

class UserListInitial extends UserListState {
  @override
  final List<UserModel> data;

  UserListInitial() : data = [];
}

class ShowLoadingState extends UserListState {
  @override
  final List<UserModel> data;

  const ShowLoadingState(this.data);
}

class GetUserListSuccess extends UserListState {
  @override
  final List<UserModel> data;

  const GetUserListSuccess({required this.data});

  @override
  List<Object> get props => [data];
}

class GetUserListEmpty extends UserListState {
  @override
  final List<UserModel> data;

  const GetUserListEmpty({required this.data});
}

class GetUserListFailed extends UserListState {
  @override
  final List<UserModel> data;
  final String? message;

  const GetUserListFailed({required this.data, this.message});
}

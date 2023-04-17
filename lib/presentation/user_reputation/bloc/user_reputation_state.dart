part of 'user_reputation_bloc.dart';

abstract class UserReputationState extends Equatable {
  List<UserReputationModel> get data;

  const UserReputationState();

  @override
  List<Object> get props => [data];
}

class UserReputationInitial extends UserReputationState {
  @override
  final List<UserReputationModel> data;

  UserReputationInitial() : data = [];
}

class ShowLoadingState extends UserReputationState {
  @override
  final List<UserReputationModel> data;

  const ShowLoadingState(this.data);
}

class GetUserReputationListSuccess extends UserReputationState {
  @override
  final List<UserReputationModel> data;

  const GetUserReputationListSuccess({required this.data});

  @override
  List<Object> get props => [data];
}

class GetUserReputationEmpty extends UserReputationState {
  @override
  final List<UserReputationModel> data;

  const GetUserReputationEmpty({required this.data});
}

class GetUserReputationFailed extends UserReputationState {
  @override
  final List<UserReputationModel> data;
  final String? message;

  const GetUserReputationFailed({required this.data, this.message});
}

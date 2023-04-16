part of 'user_reputation_bloc.dart';

abstract class UserReputationEvent extends Equatable {
  const UserReputationEvent();

  @override
  List<Object> get props => [];
}

class FetchUserReputationListEvent extends UserReputationEvent {
  final int userId;
  final int? page;
  final RefreshController? refreshController;

  const FetchUserReputationListEvent(
      {required this.userId, this.page, this.refreshController});
}

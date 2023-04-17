part of 'user_list_bloc.dart';

abstract class UserListEvent extends Equatable {
  const UserListEvent();

  @override
  List<Object> get props => [];
}

class FetchUserListEvent extends UserListEvent {
  final int? page;
  final RefreshController? refreshController;

  const FetchUserListEvent({this.page, this.refreshController});
}


// class BookmarkUserEvent extends UserListEvent {
//   final UserModel user;
//   final bool isBookmarked;

//   const BookmarkUserEvent({required this.user, required this.isBookmarked});
// }
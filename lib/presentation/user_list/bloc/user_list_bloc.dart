import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:sof_user_app/app/app.dart';
import 'package:sof_user_app/app/constant/constants.dart';
import 'package:sof_user_app/data/local_database/hive_manager.dart';
import 'package:sof_user_app/data/local_database/models/user_in_db.dart';
import 'package:sof_user_app/data/models/user.dart';
import 'package:sof_user_app/services/api/api_repository.dart';
import 'package:sof_user_app/services/usecases/user_list_usecase.dart';

part 'user_list_event.dart';
part 'user_list_state.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  int currentPage = 0;
  UserListBloc() : super(UserListInitial()) {
    on<FetchUserListEvent>(_onGetUserList);
    // on<BookmarkUserEvent>(_onBookmarkUserList);
  }

  Future<void> _onGetUserList(
    FetchUserListEvent event,
    Emitter<UserListState> emit,
  ) async {
    try {
      emit(ShowLoadingState(state.data));
      final currentState = state;
      final usecase = UserListUsecase();
      if (event.page != null) {
        currentPage = event.page!;
      }
      final result =
          await usecase.fetchList(currentPage, currentList: currentState.data);

      event.refreshController?.loadComplete();
      if (currentPage == 0) {
        event.refreshController?.refreshCompleted();
      }

      if (currentState.data == result) {
        event.refreshController?.loadNoData();
        currentPage = currentPage;
      } else {
        currentPage += 1;
      }

      if (result != null && result.isNotEmpty) {
        emit(GetUserListSuccess(data: result));
      } else {
        emit(const GetUserListEmpty(data: []));
      }
    } on DioError catch (e) {
      emit(GetUserListFailed(data: const [], message: e.message));
    } catch (e) {
      emit(GetUserListFailed(data: const [], message: e.name));
    }
  }

  void onBookmarkUser(
    int userId,
    bool isBookmarked,
  ) {
    getIt.get<HiveManager>().putDataWithKey(
        HiveBoxName.bookmark.name, userId.toString(), isBookmarked);
  }

  bool? onGetBookmarkUser(
    int userId,
  ) {
    return getIt
        .get<HiveManager>()
        .getDataWithKey(HiveBoxName.bookmark.name, userId.toString());
  }
}

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:sof_user_app/data/models/user_reputation.dart';
import 'package:sof_user_app/services/usecases/user_reputation_usecase.dart';

part 'user_reputation_event.dart';
part 'user_reputation_state.dart';

class UserReputationBloc
    extends Bloc<UserReputationEvent, UserReputationState> {
  int currentPage = 0;

  UserReputationBloc() : super(UserReputationInitial()) {
    on<FetchUserReputationListEvent>(_onGetUserReputationList);
  }

  Future<void> _onGetUserReputationList(
    FetchUserReputationListEvent event,
    Emitter<UserReputationState> emit,
  ) async {
    emit(ShowLoadingState(state.data));
    final currentState = state;
    final usecase = UserReputationUsecase();
    if (event.page != null) {
      currentPage = event.page!;
    }
    final result = await usecase.fetchList(event.userId, currentPage,
        currentList: currentState.data);

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
      emit(GetUserReputationListSuccess(data: result));
    } else {
      emit(const GetUserReputationEmpty(data: []));
    }
  }
}

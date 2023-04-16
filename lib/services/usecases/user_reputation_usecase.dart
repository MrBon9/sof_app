import 'package:dio/dio.dart';
import 'package:sof_user_app/app/app.dart';
import 'package:sof_user_app/data/models/user_reputation.dart';
import 'package:sof_user_app/services/api/api_repository.dart';
import 'package:logger/logger.dart';

class UserReputationUsecase {
  Future<List<UserReputationModel>?> fetchList(int userId, int page,
      {List<UserReputationModel>? currentList}) async {
    try {
      final Dio client = getIt.get();
      final response = await RestClient(client)
          .getUserReputation(userId, page + 1, 30, 'stackoverflow');

      if (page == 0) {
        return response.items;
      }

      return [...?currentList, ...?response.items];
    } catch (e, s) {
      Logger().e(() => 'Load user reputation list error $e', e, s);
      return currentList;
    }
  }
}

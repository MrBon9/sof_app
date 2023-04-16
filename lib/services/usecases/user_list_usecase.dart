import 'package:dio/dio.dart';
import 'package:sof_user_app/app/app.dart';
import 'package:sof_user_app/data/models/user.dart';
import 'package:sof_user_app/services/api/api_repository.dart';
import 'package:logger/logger.dart';

class UserListUsecase {
  Future<List<UserModel>?> fetchList(int page,
      {List<UserModel>? currentList}) async {
    try {
      final Dio client = getIt.get();
      final response =
          await RestClient(client).getUsers(page + 1, 30, 'stackoverflow');

      if (page == 0) {
        return response.items;
      }

      return [...?currentList, ...?response.items];
    } on DioError catch (e) {
      print(e.error);
      rethrow;
    } catch (e, s) {
      Logger().e(() => 'Load user list error ${e.name}', e, s);
      rethrow;
    }
  }
}

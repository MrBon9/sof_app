// import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:sof_user_app/data/response_models/user_data_response.dart';
import 'package:sof_user_app/data/response_models/user_reputation_data_response.dart';

part 'api_repository.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

  // Get stackoverFlow User List
  @GET("/users")
  Future<DataResponseModel> getUsers(
    @Query("page") int page,
    @Query("pageSize") int pageSize,
    @Query("site") String site,
  );

  // Get user reputation list
  @GET("/users/{userId}/reputation-history")
  Future<UserReputationDataResponseModel> getUserReputation(
    @Path('userId') int userId,
    @Query("page") int page,
    @Query("pageSize") int pageSize,
    @Query("site") String site,
  );
}

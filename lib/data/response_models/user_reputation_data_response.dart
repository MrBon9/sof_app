import 'package:json_annotation/json_annotation.dart';
import 'package:sof_user_app/data/models/user_reputation.dart';

part 'user_reputation_data_response.g.dart';

@JsonSerializable()
class UserReputationDataResponseModel {
  final List<UserReputationModel>? items;

  @JsonKey(name: 'has_more')
  final bool? hasMore;

  @JsonKey(name: 'quota_max')
  final int? max;

  @JsonKey(name: 'quota_remaining')
  final int? remaining;

  @JsonKey(name: 'error_id')
  final int? errorId;

  @JsonKey(name: 'error_message')
  final String? errorMessage;

  @JsonKey(name: 'error_name')
  final String? errorName;

  UserReputationDataResponseModel(
      {this.items,
      this.hasMore,
      this.max,
      this.remaining,
      this.errorId,
      this.errorMessage,
      this.errorName});

  factory UserReputationDataResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserReputationDataResponseModelFromJson(json);
  Map<String, dynamic> toJson() =>
      _$UserReputationDataResponseModelToJson(this);
}

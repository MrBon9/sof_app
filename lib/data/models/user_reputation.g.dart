// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_reputation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserReputationModel _$UserReputationModelFromJson(Map<String, dynamic> json) =>
    UserReputationModel(
      reputationHistoryType: json['reputation_history_type'] as String?,
      userId: json['user_id'] as int?,
      reputationChange: json['reputation_change'] as int?,
      postId: json['post_id'] as int?,
      creationDate: json['creation_date'] as int?,
    );

Map<String, dynamic> _$UserReputationModelToJson(
        UserReputationModel instance) =>
    <String, dynamic>{
      'reputation_history_type': instance.reputationHistoryType,
      'reputation_change': instance.reputationChange,
      'post_id': instance.postId,
      'creation_date': instance.creationDate,
      'user_id': instance.userId,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataResponseModel _$DataResponseModelFromJson(Map<String, dynamic> json) =>
    DataResponseModel(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasMore: json['has_more'] as bool?,
      max: json['quota_max'] as int?,
      remaining: json['quota_remaining'] as int?,
      errorId: json['error_id'] as int?,
      errorMessage: json['error_message'] as String?,
      errorName: json['error_name'] as String?,
    );

Map<String, dynamic> _$DataResponseModelToJson(DataResponseModel instance) =>
    <String, dynamic>{
      'items': instance.items,
      'has_more': instance.hasMore,
      'quota_max': instance.max,
      'quota_remaining': instance.remaining,
      'error_id': instance.errorId,
      'error_message': instance.errorMessage,
      'error_name': instance.errorName,
    };

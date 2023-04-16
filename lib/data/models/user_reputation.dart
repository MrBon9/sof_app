import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_reputation.g.dart';

@JsonSerializable()
class UserReputationModel extends Equatable {
  @JsonKey(name: 'reputation_history_type')
  final String? reputationHistoryType;

  @JsonKey(name: 'reputation_change')
  final int? reputationChange;

  @JsonKey(name: 'post_id')
  final int? postId;

  @JsonKey(name: 'creation_date')
  final int? creationDate;

  @JsonKey(name: 'user_id')
  final int? userId;

  const UserReputationModel({
    this.reputationHistoryType,
    this.userId,
    this.reputationChange,
    this.postId,
    this.creationDate,
  });

  factory UserReputationModel.fromJson(Map<String, dynamic> json) =>
      _$UserReputationModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserReputationModelToJson(this);

  UserReputationModel copyWith({
    final String? reputationHistoryType,
    final int? userId,
    final int? reputationChange,
    final int? postId,
    final int? creationDate,
  }) {
    return UserReputationModel(
      reputationHistoryType:
          reputationHistoryType ?? this.reputationHistoryType,
      userId: userId ?? this.userId,
      reputationChange: reputationChange ?? this.reputationChange,
      postId: postId ?? this.postId,
      creationDate: creationDate ?? this.creationDate,
    );
  }

  @override
  List<Object?> get props => [
        reputationHistoryType,
        userId,
        reputationChange,
        postId,
        creationDate,
      ];
}

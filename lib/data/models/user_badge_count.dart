import 'package:json_annotation/json_annotation.dart';

part 'user_badge_count.g.dart';

@JsonSerializable()
class UserBadgeCountModel {
  final int bronze;
  final int silver;
  final int gold;

  UserBadgeCountModel({
    required this.bronze,
    required this.silver,
    required this.gold,
  });

  factory UserBadgeCountModel.fromJson(Map<String, dynamic> json) =>
      _$UserBadgeCountModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserBadgeCountModelToJson(this);
}

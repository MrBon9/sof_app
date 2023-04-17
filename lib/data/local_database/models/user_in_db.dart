import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:sof_user_app/data/models/user.dart';

part 'user_in_db.g.dart';

@HiveType(typeId: 0)
class UserInformationInDatabase extends Equatable {
  @HiveField(0)
  final UserModel user;
  @HiveField(1)
  final bool isBookmarked;

  const UserInformationInDatabase({
    required this.user,
    required this.isBookmarked,
  });

  UserInformationInDatabase copyWith({
    UserModel? user,
    bool? isBookmarked,
  }) =>
      UserInformationInDatabase(
        user: user ?? this.user,
        isBookmarked: isBookmarked ?? this.isBookmarked,
      );

  @override
  List<Object?> get props => [
        user,
        isBookmarked,
      ];
}

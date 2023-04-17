part of app_layer;

class StoreDBUtils {
  static void storeBookmarkedUserData(UserInformationInDatabase? user) {
    getIt
        .get<HiveManager>()
        .addData<UserInformationInDatabase?>(HiveBoxName.user.name, user);
  }

  static List<UserInformationInDatabase>? get bookmarkedUserList =>
      getIt.get<HiveManager>().getListData<UserInformationInDatabase>(
            HiveBoxName.user.name,
          );
}

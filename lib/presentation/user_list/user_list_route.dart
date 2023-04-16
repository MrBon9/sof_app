part of 'user_list.dart';

class UserListRoute {
  static Widget get route => BlocProvider(
        create: (context) => UserListBloc()..add(const FetchUserListEvent()),
        child: const UserListScreen(),
      );
}

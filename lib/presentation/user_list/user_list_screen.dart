part of 'user_list.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  late AppBloc appBloc;
  late UserListBloc userListBloc;

  late RefreshController _refreshController;
  @override
  void initState() {
    super.initState();
    appBloc = context.read<AppBloc>();
    userListBloc = context.read<UserListBloc>();
    _refreshController = RefreshController();
  }

  void _onLoading() {
    userListBloc.add(FetchUserListEvent(refreshController: _refreshController));
  }

  void _onReFreshing() {
    userListBloc.add(
        FetchUserListEvent(page: 0, refreshController: _refreshController));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
        elevation: 0.0,
        actions: [
          IconButton(
              onPressed: () {
                if (ThemeUtils.appThemeMode == 1) {
                  appBloc.add(const SetThemeEvent(mode: ThemeMode.dark));
                } else {
                  appBloc.add(const SetThemeEvent(mode: ThemeMode.light));
                }
              },
              icon: const Icon(Icons.settings_brightness_rounded))
        ],
      ),
      body: BlocConsumer<UserListBloc, UserListState>(
          listener: (context, state) async {
            if (state is ShowLoadingState) {
              DialogWidget.showLoadingDialog(context);
            } else {
              DialogWidget.hideLoadingDialog;
            }
          },
          buildWhen: (_, current) =>
              current is GetUserListSuccess ||
              current is GetUserListEmpty ||
              current is GetUserListFailed,
          builder: (context, state) {
            if (state is GetUserListSuccess) {
              final userList = state.data;
              return SmartRefresher(
                controller: _refreshController,
                onLoading: _onLoading,
                onRefresh: _onReFreshing,
                enablePullUp: true,
                header: const MaterialClassicHeader(),
                footer: const LoadingFooter(),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                        child: SizedBox(
                      height: AppConstant.smallSpacing,
                    )),
                    ...userList.map(
                      (o) => SliverToBoxAdapter(
                        child: UserContainer(
                          userId: o.userId ?? 0,
                          userName: o.displayName ?? 'N/A',
                          userImageUrl: o.profileImage ?? '',
                          reputation: o.reputation ?? 0,
                          location: o.location ?? 'N/A',
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }

            if (state is GetUserListEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.list_alt_rounded,
                      size: AppConstant.largeRadius * 3, color: Colors.grey),
                  Center(
                      child: Text('User list is empty!',
                          style: TextStyle(fontSize: AppConstant.largeRadius)))
                ],
              );
            }

            if (state is GetUserListFailed) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.wifi_off_rounded,
                      size: AppConstant.largeRadius * 3, color: Colors.grey),
                  Center(
                      child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppConstant.mediumSpacing),
                    child: Text(
                        state.message ??
                            'Please check your internet connection!',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: AppConstant.largeRadius)),
                  )),
                  SizedBox(height: AppConstant.mediumSpacing),
                  Material(
                      color: Colors.grey,
                      borderRadius:
                          BorderRadius.circular(AppConstant.smallRadius),
                      child: MaterialButton(
                          onPressed: () {
                            userListBloc.add(const FetchUserListEvent());
                          },
                          child: const Text('Retry')))
                ],
              );
            }

            return const SizedBox();
          }),
    );
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }
}

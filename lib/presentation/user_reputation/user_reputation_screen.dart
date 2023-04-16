part of 'user_reputation.dart';

class UserReputationScreen extends StatefulWidget {
  final UserReputationFeatureModel feature;
  const UserReputationScreen({super.key, required this.feature});

  @override
  State<UserReputationScreen> createState() => _UserReputationScreenState();
}

class _UserReputationScreenState extends State<UserReputationScreen> {
  late RefreshController _refreshController;
  late UserReputationBloc userReputationBloc;

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController();
    userReputationBloc = context.read<UserReputationBloc>();
  }

  void _onLoading() {
    userReputationBloc.add(FetchUserReputationListEvent(
        userId: widget.feature.userId, refreshController: _refreshController));
  }

  void _onReFreshing() {
    userReputationBloc.add(FetchUserReputationListEvent(
        userId: widget.feature.userId,
        page: 0,
        refreshController: _refreshController));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('${widget.feature.userName}\'s Reputation'),
      ),
      body: BlocConsumer<UserReputationBloc, UserReputationState>(
        listener: (context, state) async {
          if (state is ShowLoadingState) {
            DialogWidget.showLoadingDialog(context);
          } else {
            DialogWidget.hideLoadingDialog;
          }
        },
        buildWhen: (_, current) =>
            current is GetUserReputationListSuccess ||
            current is GetUserReputationEmpty,
        builder: (context, state) {
          if (state is GetUserReputationListSuccess) {
            final data = state.data;
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
                    ),
                  ),
                  ...data.map(
                    (o) => SliverToBoxAdapter(
                        child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: AppConstant.mediumSpacing,
                                vertical: AppConstant.smallSpacing / 2),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('#${o.postId.toString()}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Text(DateTime.fromMillisecondsSinceEpoch(
                                              o.creationDate! * 1000)
                                          .toddMMMyyyy
                                          .toString()),
                                      Text(o.reputationHistoryType.toString()),
                                      const Divider()
                                    ],
                                  ),
                                ),
                                Text(o.reputationChange.toString()),
                              ],
                            ))),
                  ),
                ],
              ),
            );
          }

          if (state is GetUserReputationEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.list_alt_rounded,
                    size: AppConstant.largeRadius * 3, color: Colors.grey),
                Center(
                    child: Text('Reputation is empty!',
                        style: TextStyle(fontSize: AppConstant.largeRadius)))
              ],
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}

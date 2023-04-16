part of 'user_reputation.dart';

class UserReputationRoute {
  static Widget route(UserReputationFeatureModel feature) => BlocProvider(
        create: (context) => UserReputationBloc()
          ..add(FetchUserReputationListEvent(userId: feature.userId)),
        child: UserReputationScreen(feature: feature),
      );
}

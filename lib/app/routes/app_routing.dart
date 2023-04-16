part of app_layer;

enum RouteDefine {
  splashScreen,
  userListScreen,
  userReputationScreen,
}

class AppRouting {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    final routes = <String, WidgetBuilder>{
      RouteDefine.splashScreen.name: (_) => SplashRoute.route,
      RouteDefine.userListScreen.name: (_) => UserListRoute.route,
      RouteDefine.userReputationScreen.name: (_) => UserReputationRoute.route(
          settings.arguments as UserReputationFeatureModel),
    };

    final routeBuilder = routes[settings.name];

    return MaterialPageRoute(
      builder: (context) => routeBuilder!(context),
      settings: RouteSettings(name: settings.name),
    );
  }
}

extension RouteExt on Object {
  String get name => toString().substring(toString().indexOf('.') + 1);
}

part of app_layer;

GetIt getIt = GetIt.instance;

Future setupDependencies() async {
  await _registerAppComponents();
  await _registerNetworkComponents();
}

Future _registerAppComponents() async {
  final sharedPreferencesManager = await SharedPreferencesManager.getInstance();
  getIt.registerSingleton<SharedPreferencesManager>(sharedPreferencesManager!);

  final hiveManager = await HiveManager.getInstance();
  getIt.registerSingleton<HiveManager>(hiveManager);
}

Future<void> _registerNetworkComponents() async {
  final dio = Dio(
    BaseOptions(
      baseUrl: AppConstant.baseUrl,
      headers: {
        'Accept': 'application/json;charset=utf-t',
        'Accept-Language': 'en'
      },
      connectTimeout: const Duration(milliseconds: 10000),
    ),
  );

  dio.interceptors.addAll(
    [
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
      ),
    ],
  );

  getIt.registerSingleton(dio);
}

Future<void> initHiveDatabase() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserInformationInDatabaseAdapter());
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sof_user_app/app/app.dart';
import 'package:sof_user_app/app/bloc/app_bloc.dart';

class SOFApplication extends StatelessWidget {
  const SOFApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc(),
      child: BlocBuilder<AppBloc, AppState>(builder: (context, state) {
        return MaterialApp(
          navigatorKey: NavigationUtil.rootKey,
          debugShowCheckedModeBanner: false,
          initialRoute: RouteDefine.splashScreen.name,
          onGenerateRoute: AppRouting.generateRoute,
          theme: themeManager(
            mode: ThemeMode.light,
          ),
          darkTheme: themeManager(
            mode: ThemeMode.dark,
          ),
          themeMode: state.themeMode,
        );
      }),
    );
  }
}

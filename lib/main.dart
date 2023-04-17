import 'package:flutter/material.dart';
import 'package:sof_user_app/app/app.dart';
import 'package:sof_user_app/application.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHiveDatabase();
  await setupDependencies();

  runApp(const SOFApplication());
}

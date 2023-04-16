library app_layer;

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sof_user_app/app/constant/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:sof_user_app/data/models/user_reputation_feature.dart';
import 'package:sof_user_app/presentation/splash/splash_route.dart';
import 'package:sof_user_app/presentation/user_list/user_list.dart';
import 'package:sof_user_app/presentation/user_reputation/user_reputation.dart';

part 'di/injection.dart';
part 'managers/theme_manager.dart';
part 'managers/shared_pref_manager.dart';
part 'routes/app_routing.dart';
part 'utils/theme_utils.dart';
part 'utils/navigation_utils.dart';

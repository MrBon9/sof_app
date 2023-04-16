import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sof_user_app/app/app.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitial()) {
    on<SetThemeEvent>((event, emit) {
      if (ThemeUtils.appThemeMode == null ||
          ThemeUtils.appThemeMode != event.mode.index) {
        ThemeUtils.saveAppThemeMode(appThemeModeIndex: event.mode.index);
        emit(ChangeAppThemeSuccessState(themeMode: event.mode));
      }
    });
  }
}

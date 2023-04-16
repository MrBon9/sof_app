part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class SetThemeEvent extends AppEvent {
  final ThemeMode mode;

  const SetThemeEvent({required this.mode});
}

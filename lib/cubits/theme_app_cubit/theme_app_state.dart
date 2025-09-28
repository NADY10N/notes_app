part of 'theme_app_cubit.dart';

@immutable
sealed class ThemeAppState {}

final class ThemeAppInitial extends ThemeAppState {}

final class ThemeAppChange extends ThemeAppState {}

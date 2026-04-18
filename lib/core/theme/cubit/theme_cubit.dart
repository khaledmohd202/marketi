// import 'package:flutter/material.dart';
// import 'package:hydrated_bloc/hydrated_bloc.dart';

// class ThemeCubit extends HydratedCubit<ThemeMode> {
//   ThemeCubit() : super(ThemeMode.system);

//   void toggle() => emit(
//     state == ThemeMode.dark ? ThemeMode.dark : ThemeMode.light,
//   );

//   bool get isDark => state == ThemeMode.dark;

//   @override
//   ThemeMode? fromJson(Map<String, dynamic> json) {
//     return ThemeMode.values[json['theme'] as int];
//   }

//   @override
//   Map<String, dynamic>? toJson(ThemeMode state) {
//     return {'theme': state.index};
//   }
// }

import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<bool> {
  ThemeCubit() : super(false); // false = light, true = dark

  void toggle() => emit(!state);

  bool get isDark => state;

  @override
  bool? fromJson(Map<String, dynamic> json) => json['isDark'] as bool;

  @override
  Map<String, dynamic>? toJson(bool state) => {'isDark': state};
}

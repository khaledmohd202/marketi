// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:marketi/core/network/end_points.dart';
// import 'package:marketi/core/services/cache/cache_helper.dart';

// part 'theme_state.dart';

// class ThemeCubit extends Cubit<ThemeState> {
//   ThemeCubit() : super(ThemeInitial()) {
//     _loadTheme();
//   }

//   void _loadTheme() {
//     final isDark =
//         CacheHelper().getData(key: ApiKey.isDarkMode) as bool? ?? false;

//     emit(isDark ? ThemeDark() : ThemeLight());
//   }

//   void toggle() {
//     if (state is ThemeDark) {
//       CacheHelper().saveData(key: ApiKey.isDarkMode, value: false);

//       emit(ThemeLight());
//     } else {
//       CacheHelper().saveData(key: ApiKey.isDarkMode, value: true);

//       emit(ThemeDark());
//     }
//   }

//   bool get isDark => state is ThemeDark;
// }

import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  void toggle() => emit(
    state == ThemeMode.dark ? ThemeMode.dark : ThemeMode.light,
  );

  bool get isDark => state == ThemeMode.dark;

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    return ThemeMode.values[json['theme'] as int];
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    return {'theme': state.index};
  }
}

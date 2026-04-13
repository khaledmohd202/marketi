import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/routing/app_routes.dart';
import 'package:marketi/core/theme/colors/marketi_colors.dart';
import 'package:marketi/core/theme/cubit/theme_cubit.dart';

class MarketiApp extends StatelessWidget {
  const MarketiApp({required this.startRoute, super.key});

  final String startRoute;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            final isDark = state is ThemeDark;
            
            return MaterialApp(
              title: 'Marketi',
              debugShowCheckedModeBanner: false,
              themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
              theme: ThemeData(
                brightness: Brightness.light,
                scaffoldBackgroundColor: MarketiColors.whiteColor,
                colorScheme: ColorScheme.fromSeed(
                  seedColor: MarketiColors.lightBlue900Color,
                ),
              ),
              darkTheme: ThemeData(
                brightness: Brightness.dark,
                scaffoldBackgroundColor: MarketiColors.backgroundColorDarkTheme,
                colorScheme: ColorScheme.fromSeed(
                  seedColor: MarketiColors.lightBlue900Color,
                  brightness: Brightness.dark,
                  surface: const Color(0xFF0F1628),
                  onSurface: Colors.white
                ),
                cardColor: const Color(0xFF0F1628),
                 appBarTheme: const AppBarTheme(
                  backgroundColor: Color(0xFF0A0E1A),
                  foregroundColor: Colors.white,
                ),
              ),
              initialRoute: startRoute,
              onGenerateRoute: AppRoutes.onGenerateRoute,
            );
          },
        );
      },
    );
  }
}

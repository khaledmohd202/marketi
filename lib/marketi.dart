import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/routing/app_routes.dart';
import 'package:marketi/core/theme/app_theme.dart';
import 'package:marketi/core/theme/cubit/theme_cubit.dart';

class MarketiApp extends StatelessWidget {
  const MarketiApp({required this.startRoute, super.key});

  final String startRoute;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            builder: (context, index) {
              return MaterialApp(
                title: 'Marketi',
                debugShowCheckedModeBanner: false,
                themeMode: state,
                theme: AppTheme.light,
                darkTheme: AppTheme.dark,
                initialRoute: startRoute,
                onGenerateRoute: AppRoutes.onGenerateRoute,
              );
            },
          );
        },
      ),
    );
  }
}

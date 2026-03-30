import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marketi/core/services/cache/cache_helper.dart';
import 'package:marketi/marketi.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper().init();


  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(const MarketiApp());
  });
}

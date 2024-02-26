import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:pos/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  FlavorConfig(name: "Common", variables: {
    "url_api": 'http://po.mekdocabi.my.id/',
    "header_main": "assets/images/bg_rounded.png",
    "header_home": "assets/images/bg_rounded_home.png",
    "splash": "assets/images/circle.png",
    "development": true,
  });
  runApp(const MyApp());
}

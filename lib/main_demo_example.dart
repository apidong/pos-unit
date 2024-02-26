import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

import 'package:pos/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlavorConfig(name: "Common", variables: {
    "url_api": 'http://192.168.12.252:8000/',
    "header_main": "assets/images/bg_rounded.png",
    "header_home": "assets/images/bg_rounded_home.png",
    "splash": "assets/images/circle.png",
    "development": true,
  });
  runApp(const MyApp());
}

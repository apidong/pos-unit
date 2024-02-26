// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pos/config/route/route.gr.dart';
import 'package:pos/modul/splashscreen/services/splash_screen.services.dart';
import 'package:pos/utils/services/http_service.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  SplashScreenState();

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    super.dispose();
  }

  startSplashScreen() async {
    Future.delayed(const Duration(milliseconds: 1500), () async {
      try {
        final auth = await SplashscreenService(httpservice: HttpService()).auth();

        if (auth) {
          context.router.replace(const HomeRoute());
          return;
        } else {
          var desa = await Hive.openBox('desa');
          if (desa.containsKey('url')) {
            context.router.replace(const LoginRoute());
            return;
          }
          context.router.pushAndPopUntil(const PageRouteInfo(LoginRoute.name), predicate: (route) => false);
        }
      } catch (e) {
        context.router.pushAndPopUntil(const PageRouteInfo(LoginRoute.name), predicate: (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // final sizeH = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
          Image.asset(
            'assets/images/logo.png',
          )
        ]),
      ),
    );
  }

  void _load() {
    startSplashScreen();
  }
}

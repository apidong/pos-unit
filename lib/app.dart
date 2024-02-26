import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pos/config/route/route.dart';
import 'package:pos/utils/ui/styles/app_theme.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';

class MyApp extends StatefulWidget {
//   const MyApp({required Key key}) : super(key: key);
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
//   final NotificationBloc notificationBloc = NotificationBloc();
  final router = AppRouter();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();

    return MaterialApp(
        title: 'Point Of Sale',
        theme: AppTheme().themedata,
        home: MaterialApp.router(
          routeInformationParser: router.defaultRouteParser(),
          routerDelegate: router.delegate(),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            SfGlobalLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('id'),
          ],
          //   theme: theme,
          locale: const Locale('id'),
        ));
  }
}

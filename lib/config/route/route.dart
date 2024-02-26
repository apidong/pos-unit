import 'package:auto_route/auto_route.dart';
import 'package:pos/config/route/route.gr.dart';

@AutoRouterConfig(generateForDir: ['lib']
    // replaceInRouteName: 'Page,Route',
    // routes: <AutoRoute>[
    //   AutoRoute(path: '/', page: SplashscreenScreen(), initial: true),
    // ],
    )
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: '/', page: SplashRoute.page, initial: true),
        AutoRoute(path: '/login', page: LoginRoute.page),
        AutoRoute(path: '/home', page: HomeRoute.page, children: [
          AutoRoute(page: DashboardRoute.page, path: 'dasboard'),
          AutoRoute(page: PengajuanRoute.page, path: 'pengajuan'),
          AutoRoute(page: ProfilRoute.page, path: 'profil'),
        ]),
        AutoRoute(path: '/periksa/:id', page: PerikasPengajuanRoute.page, fullMatch: true),
      ];
}

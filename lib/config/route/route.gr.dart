// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i14;
import 'package:pos/modul/auth/screen/login_screen.dart' as _i5;
import 'package:pos/modul/auth/screen/lupa_password_screen.dart' as _i6;
import 'package:pos/modul/beranda/screen/dashboard_screen.dart' as _i1;
import 'package:pos/modul/home/screen/home_screen.dart' as _i4;
import 'package:pos/modul/pengajuan/screen/pengajuan_screen.dart' as _i7;
import 'package:pos/modul/pengajuan/screen/perikasPengajuan_screen.dart' as _i8;
import 'package:pos/modul/pengajuan/screen/periksaSukses_screen.dart' as _i9;
import 'package:pos/modul/profil/screen/detail_profil_screen.dart' as _i2;
import 'package:pos/modul/profil/screen/ganti_password_screen.dart' as _i3;
import 'package:pos/modul/profil/screen/profil_screen.dart' as _i10;
import 'package:pos/modul/profil/screen/update_profil_screen.dart' as _i12;
import 'package:pos/modul/splashscreen/screen/splash_screen.dart' as _i11;

abstract class $AppRouter extends _i13.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    DashboardRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.DashboardScreen(),
      );
    },
    DetailProfilRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.DetailProfilScreen(),
      );
    },
    GantiPasswordRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.GantiPasswordScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomeScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.LoginScreen(),
      );
    },
    LupaPasswordRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.LupaPasswordScreen(),
      );
    },
    PengajuanRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.PengajuanScreen(),
      );
    },
    PerikasPengajuanRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<PerikasPengajuanRouteArgs>(
          orElse: () => PerikasPengajuanRouteArgs(id: pathParams.get('id')));
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.PerikasPengajuanScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
    PeriksaSuksesRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.PeriksaSuksesScreen(),
      );
    },
    ProfilRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.ProfilScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.SplashScreen(),
      );
    },
    UpdateProfilRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.UpdateProfilScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.DashboardScreen]
class DashboardRoute extends _i13.PageRouteInfo<void> {
  const DashboardRoute({List<_i13.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i2.DetailProfilScreen]
class DetailProfilRoute extends _i13.PageRouteInfo<void> {
  const DetailProfilRoute({List<_i13.PageRouteInfo>? children})
      : super(
          DetailProfilRoute.name,
          initialChildren: children,
        );

  static const String name = 'DetailProfilRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i3.GantiPasswordScreen]
class GantiPasswordRoute extends _i13.PageRouteInfo<void> {
  const GantiPasswordRoute({List<_i13.PageRouteInfo>? children})
      : super(
          GantiPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'GantiPasswordRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i13.PageRouteInfo<void> {
  const HomeRoute({List<_i13.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i5.LoginScreen]
class LoginRoute extends _i13.PageRouteInfo<void> {
  const LoginRoute({List<_i13.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i6.LupaPasswordScreen]
class LupaPasswordRoute extends _i13.PageRouteInfo<void> {
  const LupaPasswordRoute({List<_i13.PageRouteInfo>? children})
      : super(
          LupaPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'LupaPasswordRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i7.PengajuanScreen]
class PengajuanRoute extends _i13.PageRouteInfo<void> {
  const PengajuanRoute({List<_i13.PageRouteInfo>? children})
      : super(
          PengajuanRoute.name,
          initialChildren: children,
        );

  static const String name = 'PengajuanRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i8.PerikasPengajuanScreen]
class PerikasPengajuanRoute
    extends _i13.PageRouteInfo<PerikasPengajuanRouteArgs> {
  PerikasPengajuanRoute({
    _i14.Key? key,
    required dynamic id,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          PerikasPengajuanRoute.name,
          args: PerikasPengajuanRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'PerikasPengajuanRoute';

  static const _i13.PageInfo<PerikasPengajuanRouteArgs> page =
      _i13.PageInfo<PerikasPengajuanRouteArgs>(name);
}

class PerikasPengajuanRouteArgs {
  const PerikasPengajuanRouteArgs({
    this.key,
    required this.id,
  });

  final _i14.Key? key;

  final dynamic id;

  @override
  String toString() {
    return 'PerikasPengajuanRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i9.PeriksaSuksesScreen]
class PeriksaSuksesRoute extends _i13.PageRouteInfo<void> {
  const PeriksaSuksesRoute({List<_i13.PageRouteInfo>? children})
      : super(
          PeriksaSuksesRoute.name,
          initialChildren: children,
        );

  static const String name = 'PeriksaSuksesRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i10.ProfilScreen]
class ProfilRoute extends _i13.PageRouteInfo<void> {
  const ProfilRoute({List<_i13.PageRouteInfo>? children})
      : super(
          ProfilRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfilRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i11.SplashScreen]
class SplashRoute extends _i13.PageRouteInfo<void> {
  const SplashRoute({List<_i13.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i12.UpdateProfilScreen]
class UpdateProfilRoute extends _i13.PageRouteInfo<void> {
  const UpdateProfilRoute({List<_i13.PageRouteInfo>? children})
      : super(
          UpdateProfilRoute.name,
          initialChildren: children,
        );

  static const String name = 'UpdateProfilRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

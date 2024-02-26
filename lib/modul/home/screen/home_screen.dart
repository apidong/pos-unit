import 'package:auto_route/auto_route.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:pos/config/route/route.gr.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  HomeScreenState createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  HomeScreenState();

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [DashboardRoute(), PengajuanRoute(), ProfilRoute()],
      bottomNavigationBuilder: (_, tabsRouter) {
        return ConvexAppBar(
          backgroundColor: const Color(0xff84b5ff),
          color: const Color(0xfffefefe),
          items: const [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: FlutterRemix.truck_fill, title: 'Pengajuan'),
            TabItem(icon: Icons.people, title: 'Profil'),
          ],
          onTap: tabsRouter.setActiveIndex,
        );
      },
    );
  }

  void _load() {}
}

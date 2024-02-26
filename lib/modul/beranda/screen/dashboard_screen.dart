import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:pos/modul/beranda/screen/dashboard_loading_screen.dart';
import 'package:pos/modul/profil/bloc/profil_user/profil_user_bloc.dart' as profil_user;

@RoutePage()
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({
    Key? key,
  }) : super(key: key);

  @override
  DashboardScreenState createState() {
    return DashboardScreenState();
  }
}

class DashboardScreenState extends State<DashboardScreen> {
  DashboardScreenState();

  dynamic foto = '';

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
    final sizeW = MediaQuery.of(context).size.width;

    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => profil_user.ProfilUserBloc()..add(const profil_user.ProfilUserEvent()),
          ),
        ],
        child: Builder(builder: (context) {
          return RefreshIndicator(
            onRefresh: () async {},
            child: BlocBuilder<profil_user.ProfilUserBloc, profil_user.ProfilUserState>(builder: (context, state) {
              if (state.status == profil_user.PostStatus.success) {
                final profil = state.profilUser;
                return SingleChildScrollView(
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        width: sizeW,
                        height: 250,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(sizeW * .13),
                            bottomRight: Radius.circular(sizeW * .13),
                          ),
                          image: const DecorationImage(
                            image: AssetImage("assets/images/bg.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              Expanded(child: Container()),
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                child: Image.asset(
                                  'assets/images/logo.png',
                                  width: sizeW / 3,
                                ),
                              ),
                              Expanded(child: Container()),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
                                height: 195,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 3,
                                      blurRadius: 5,
                                      offset: const Offset(0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(top: 10),
                                      height: 100,
                                      width: 100,
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(100),
                                          child: Image.file(
                                            File(state.urlfoto),
                                            errorBuilder: (context, error, stackTrace) {
                                              return Image.asset('assets/images/kuser.png');
                                            },
                                          )),
                                    ),
                                    const Text(
                                      'Selamat Datang',
                                      style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }
              return Container();
            }),
          );
        }),
      ),
    );
    // Image.asset('assets/images/bg.jpg'),
  }

  void _load() {}
}

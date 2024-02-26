import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pos/modul/profil/bloc/profil_user/profil_user_bloc.dart'
    as profil_user;
import 'package:pos/utils/ui/styles/app_theme.dart';

@RoutePage()
class DetailProfilScreen extends StatefulWidget {
  const DetailProfilScreen({
    Key? key,
  }) : super(key: key);

  @override
  DetailProfilScreenState createState() {
    return DetailProfilScreenState();
  }
}

class DetailProfilScreenState extends State<DetailProfilScreen> {
  DetailProfilScreenState();

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
    // final sizeH = MediaQuery.of(context).size.height;
    final sizeW = MediaQuery.of(context).size.width;
    return Scaffold(
      body: LoaderOverlay(
        child: SingleChildScrollView(
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
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Image.asset(
                          'assets/png/opendesa.png',
                          width: sizeW / 3,
                        ),
                      ),
                    ],
                  ),
                  MultiBlocProvider(
                      providers: [
                        BlocProvider(
                          create: (context) => profil_user.ProfilUserBloc()
                            ..add(const profil_user.ProfilUserEvent()),
                        ),
                      ],
                      child: Column(
                        children: [
                          BlocBuilder<profil_user.ProfilUserBloc,
                                  profil_user.ProfilUserState>(
                              builder: (context, state) {
                            if (state.status ==
                                profil_user.PostStatus.loading) {
                              // return const SkeletonHomeWelcome();
                            }
                            if (state.status ==
                                profil_user.PostStatus.success) {
                              final profil = state.profilUser;
                              return Container(
                                margin: const EdgeInsets.only(
                                    top: 50, left: 20, right: 20),
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
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(top: 10),
                                          height: 100,
                                          width: 100,
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              child: Image.file(
                                                File(state.urlfoto),
                                                errorBuilder: (context, error,
                                                        stackTrace) =>
                                                    Image.asset(
                                                        'assets/images/kuser.png'),
                                              )),
                                        ),
                                      ),
                                      const Text(
                                        "Data Dasar",
                                        style: AppTheme.headerStyle,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4),
                                        child: const Text(
                                          "Nama",
                                          style: AppTheme.dataStyleGrey,
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(
                                            top: 4, bottom: 8),
                                        child: Text(
                                          profil!.pamongNama.toString(),
                                          style: AppTheme.dataStyleDark,
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4),
                                        child: const Text(
                                          "Nip",
                                          style: AppTheme.dataStyleGrey,
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(
                                            top: 4, bottom: 8),
                                        child: Text(
                                          profil.pamongNip.toString(),
                                          style: AppTheme.dataStyleDark,
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4),
                                        child: const Text(
                                          "Jabatan",
                                          style: AppTheme.dataStyleGrey,
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(
                                            top: 4, bottom: 8),
                                        child: Text(
                                          profil.pamongJabatan.toString(),
                                          style: AppTheme.dataStyleDark,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                            return Container();
                          }),
                        ],
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _load() {}
}

import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pos/config/route/route.gr.dart';
import 'package:pos/modul/beranda/screen/dashboard_loading_screen.dart';
import 'package:pos/modul/profil/bloc/logout/logout_bloc.dart' as logout;
import 'package:pos/modul/profil/bloc/profil_user/profil_user_bloc.dart'
    as profil_user;

@RoutePage()
class ProfilScreen extends StatefulWidget {
  const ProfilScreen({
    Key? key,
  }) : super(key: key);

  @override
  ProfilScreenState createState() {
    return ProfilScreenState();
  }
}

class ProfilScreenState extends State<ProfilScreen> {
  ProfilScreenState();

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
                      BlocProvider(
                        create: (context) => logout.LogoutBloc(),
                      ),
                    ],
                    child: Column(
                      children: [
                        BlocListener<logout.LogoutBloc, logout.LogoutState>(
                          listener: (context, state) {
                            if (state.status == logout.PostStatus.loading) {
                              context.loaderOverlay.show();
                            }

                            if (state.status == logout.PostStatus.success) {
                              context.loaderOverlay.hide();
                              context.router.replace(const LoginRoute());
                            }

                            if (state.status == logout.PostStatus.failure) {
                              context.loaderOverlay.hide();
                            }
                          },
                          child: Container(),
                        ),
                        BlocBuilder<profil_user.ProfilUserBloc,
                                profil_user.ProfilUserState>(
                            builder: (context, state) {
                          if (state.status == profil_user.PostStatus.loading) {
                            return const SkeletonHomeWelcome();
                          }
                          if (state.status == profil_user.PostStatus.success) {
                            final profil = state.profilUser;
                            return Container(
                              margin: const EdgeInsets.only(
                                  top: 50, left: 20, right: 20),
                              height: 175,
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 10),
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
                                  Text(
                                    '${profil!.pamongJabatan} ${profil.namaDesa}',
                                    style: const TextStyle(
                                        color: Color(0xff141ee3),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    profil.pamongNama.toString(),
                                    style: const TextStyle(
                                        color: Color(0xff141ee3),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                            );
                          }
                          return Container();
                        }),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          padding: const EdgeInsets.only(top: 0, bottom: 5),
                          width: sizeW - 40,
                          decoration: BoxDecoration(
                            color: const Color(0xfffafafa),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            border: Border.all(
                              color: const Color(0xFF49566E),
                              width: 0.1,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(156, 163, 175, 0.651),
                                spreadRadius: 0,
                                blurRadius: 4,
                                offset:
                                    Offset(1, 1), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            //   shrinkWrap: true,
                            // padding: EdgeInsets.symmetric(horizontal: 20),
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Column(
                                children: [
                                  IntrinsicHeight(
                                      child: Ink(
                                    child: Material(
                                      child: InkWell(
                                          onTap: () async {
                                            context.router.push(
                                                const DetailProfilRoute());
                                          },
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              const Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 10)),
                                              SizedBox(
                                                height: 50,
                                                width: 50,
                                                child: Icon(
                                                  FlutterRemix.user_search_line,
                                                  color: Theme.of(context)
                                                      .primaryColorLight,
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: const Text(
                                                    'Lihat Profil Lengkap',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 50,
                                                width: 50,
                                                child: Icon(
                                                  FlutterRemix
                                                      .arrow_right_s_line,
                                                  color: Color(0xff414B5A),
                                                ),
                                              ),
                                              const Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 10)),
                                            ],
                                          )),
                                    ),
                                  )),
                                  const Divider(
                                    height: 0,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  IntrinsicHeight(
                                      child: Ink(
                                    child: Material(
                                      child: InkWell(
                                          splashColor: Colors.grey.shade300,
                                          onTap: () {
                                            context.router.push(
                                                const UpdateProfilRoute());
                                          },
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              const Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 10)),
                                              SizedBox(
                                                height: 50,
                                                width: 50,
                                                child: Icon(
                                                    FlutterRemix.key_2_line,
                                                    color: Theme.of(context)
                                                        .primaryColorLight),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: const Text(
                                                    'Perbarui Profil',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 50,
                                                width: 50,
                                                child: Icon(
                                                  FlutterRemix
                                                      .arrow_right_s_line,
                                                  color: Color(0xff414B5A),
                                                ),
                                              ),
                                              const Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 10)),
                                            ],
                                          )),
                                    ),
                                  )),
                                  const Divider(
                                    height: 0,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  IntrinsicHeight(
                                      child: Ink(
                                    child: Material(
                                      child: InkWell(
                                          splashColor: Colors.grey.shade300,
                                          onTap: () {
                                            context.router.push(
                                                const GantiPasswordRoute());
                                          },
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              const Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 10)),
                                              SizedBox(
                                                height: 50,
                                                width: 50,
                                                child: Icon(
                                                    FlutterRemix.key_2_line,
                                                    color: Theme.of(context)
                                                        .primaryColorLight),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: const Text(
                                                    'Ganti Password',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 50,
                                                width: 50,
                                                child: Icon(
                                                  FlutterRemix
                                                      .arrow_right_s_line,
                                                  color: Color(0xff414B5A),
                                                ),
                                              ),
                                              const Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 10)),
                                            ],
                                          )),
                                    ),
                                  )),
                                  const Divider(
                                    height: 0,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  IntrinsicHeight(
                                    child: Ink(
                                      child: Material(
                                        child: BlocBuilder<logout.LogoutBloc,
                                            logout.LogoutState>(
                                          builder: (context, state) {
                                            return InkWell(
                                                splashColor:
                                                    Colors.grey.shade300,
                                                onTap: () {
                                                  context
                                                      .read<logout.LogoutBloc>()
                                                      .add(const logout
                                                          .LogoutSubmitEvent());
                                                },
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: [
                                                    const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 10)),
                                                    const SizedBox(
                                                      height: 50,
                                                      width: 50,
                                                      child: Icon(
                                                        FlutterRemix
                                                            .logout_circle_line,
                                                        color:
                                                            Color(0xffEF4444),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 10),
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: const Text(
                                                          'Keluar',
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: Color(
                                                                  0xffEF4444)),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 50,
                                                      width: 50,
                                                      child: Icon(
                                                        FlutterRemix
                                                            .arrow_right_s_line,
                                                        color:
                                                            Color(0xff414B5A),
                                                      ),
                                                    ),
                                                    const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right: 10)),
                                                  ],
                                                ));
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
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

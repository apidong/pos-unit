import 'package:auto_route/auto_route.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pos/modul/profil/bloc/ganti_password/ganti_password_bloc.dart';
import 'package:pos/utils/ui/styles/app_theme.dart';
import 'package:pos/utils/ui/widget/form_input_default_screen.dart';
import 'package:shaped_image/shaped_image.dart';

@RoutePage()
class GantiPasswordScreen extends StatefulWidget {
  const GantiPasswordScreen({
    Key? key,
  }) : super(key: key);

  @override
  GantiPasswordScreenState createState() {
    return GantiPasswordScreenState();
  }
}

class GantiPasswordScreenState extends State<GantiPasswordScreen> {
  GantiPasswordScreenState();

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
            ShapedImage(
                imageTye: ImageType.ASSET,
                path: 'assets/images/bg.jpg',
                shape: Shape.SHAPE01,
                height: 290),
            Column(
              children: [
                const SizedBox(
                  height: 64,
                ),
                Container(
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 35),
                    width: (sizeW - 60),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                      border: Border.all(
                          color: const Color.fromARGB(92, 214, 214, 214)),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 226, 226, 226)
                              .withOpacity(0.3),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset:
                              const Offset(1, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: BlocProvider(
                      create: (context) => GantiPasswordBloc(),
                      child:
                          BlocConsumer<GantiPasswordBloc, GantiPasswordState>(
                        builder: (context, state) {
                          return Column(
                            children: [
                              FormInputDefaultScreen(
                                label: 'Password lama',
                                placehoder: 'Password',
                                onChanged: (value) {
                                  context
                                      .read<GantiPasswordBloc>()
                                      .add(PasswordChangeEvent(value));
                                },
                                keyboardType: TextInputType.visiblePassword,
                              ),
                              FormInputDefaultScreen(
                                label: 'Password baru',
                                placehoder: 'Password',
                                onChanged: (value) {
                                  context
                                      .read<GantiPasswordBloc>()
                                      .add(PasswordBaruChangeEvent(value));
                                },
                                keyboardType: TextInputType.visiblePassword,
                              ),
                              FormInputDefaultScreen(
                                label: 'Ulangi',
                                placehoder: 'Password',
                                onChanged: (value) {
                                  context
                                      .read<GantiPasswordBloc>()
                                      .add(VerifPasswordBaruChangeEvent(value));
                                },
                                keyboardType: TextInputType.visiblePassword,
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 20),
                                child: ElevatedButton(
                                  style: AppTheme.raisedButtonStyle,
                                  onPressed: () {
                                    context.loaderOverlay.show();
                                    context
                                        .read<GantiPasswordBloc>()
                                        .add(const GantiPasswordSubmitEvent());
                                  },
                                  child: const Text(
                                    'Kirim',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                        listener:
                            (BuildContext context, GantiPasswordState state) {
                          if (state.status == PostStatus.failure) {
                            context.loaderOverlay.hide();
                            CoolAlert.show(
                              context: context,
                              type: CoolAlertType.success,
                              text: state.message.toString(),
                            );
                          }

                          if (state.status == PostStatus.success) {
                            context.loaderOverlay.hide();
                            CoolAlert.show(
                              context: context,
                              type: CoolAlertType.success,
                              text: 'Link Reset password sudah terkirim ',
                              onConfirmBtnTap: () {
                                context.router.popForced();
                              },
                            );
                          }
                        },
                        listenWhen: (previous, current) {
                          if (previous.status == PostStatus.loading &&
                              (current.status == PostStatus.success ||
                                  current.status == PostStatus.failure)) {
                            return true;
                          }
                          return false;
                        },
                      ),
                    )),
              ],
            )
          ],
        ),
      )),
    );
  }

  void _load() {}
}

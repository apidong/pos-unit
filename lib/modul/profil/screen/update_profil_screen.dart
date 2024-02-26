import 'package:auto_route/auto_route.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pos/modul/profil/bloc/update_profil/update_profil_bloc.dart';
import 'package:pos/utils/ui/styles/app_theme.dart';
import 'package:pos/utils/ui/widget/form_input_default_screen.dart';
import 'package:shaped_image/shaped_image.dart';

@RoutePage()
class UpdateProfilScreen extends StatefulWidget {
  const UpdateProfilScreen({
    Key? key,
  }) : super(key: key);

  @override
  UpdateProfilScreenState createState() {
    return UpdateProfilScreenState();
  }
}

class UpdateProfilScreenState extends State<UpdateProfilScreen> {
  UpdateProfilScreenState();

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
            BlocProvider(
              create: (context) => UpdateProfilBloc()..add(const LoadData()),
              child: Column(
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
                    child: BlocConsumer<UpdateProfilBloc, UpdateProfilState>(
                      builder: (context, state) {
                        if (state.status == PostStatus.success) {
                          return Column(
                            children: [
                              FormInputDefaultScreen(
                                label: 'Nama',
                                placehoder: 'Nama User',
                                onChanged: (value) {
                                  context
                                      .read<UpdateProfilBloc>()
                                      .add(NamaChangeEvent(value));
                                },
                                keyboardType: TextInputType.text,
                                obscureText: false,
                                initialValue: state.nama,
                              ),
                              FormInputDefaultScreen(
                                label: 'Email',
                                placehoder: 'Email',
                                onChanged: (value) {
                                  context
                                      .read<UpdateProfilBloc>()
                                      .add(EmailChangeEvent(value));
                                },
                                initialValue: state.email,
                                keyboardType: TextInputType.text,
                                obscureText: false,
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 20),
                                child: ElevatedButton(
                                  style: AppTheme.raisedButtonStyle,
                                  onPressed: () {
                                    context.loaderOverlay.show();
                                    context
                                        .read<UpdateProfilBloc>()
                                        .add(const UpdateSubmit());
                                  },
                                  child: const Text(
                                    'Kirim',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              )
                            ],
                          );
                        }
                        return Container();
                      },
                      listener:
                          (BuildContext context, UpdateProfilState state) {
                        if (state.submit == PostStatus.failure) {
                          context.loaderOverlay.hide();
                          CoolAlert.show(
                            context: context,
                            type: CoolAlertType.success,
                            text: state.message.toString(),
                          );
                        }

                        if (state.submit == PostStatus.success) {
                          context.loaderOverlay.hide();
                          CoolAlert.show(
                            context: context,
                            type: CoolAlertType.success,
                            text: 'Berhasil diperbarui',
                            onConfirmBtnTap: () {
                              context.router.popForced();
                            },
                          );
                        }
                      },
                      listenWhen: (previous, current) {
                        if (previous.submit == PostStatus.loading &&
                            (current.submit == PostStatus.success ||
                                current.submit == PostStatus.failure)) {
                          return true;
                        }
                        return false;
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }

  void _load() {}
}

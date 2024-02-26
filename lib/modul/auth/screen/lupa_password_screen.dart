import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pos/modul/auth/bloc/lupa_pass/lupa_pass_bloc.dart';
import 'package:pos/utils/ui/styles/app_theme.dart';
import 'package:pos/utils/ui/widget/form_input_default_screen.dart';
import 'package:shaped_image/shaped_image.dart';

@RoutePage()
class LupaPasswordScreen extends StatefulWidget {
  const LupaPasswordScreen({
    Key? key,
  }) : super(key: key);

  @override
  LupaPasswordScreenState createState() {
    return LupaPasswordScreenState();
  }
}

class LupaPasswordScreenState extends State<LupaPasswordScreen> {
  LupaPasswordScreenState();

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
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  padding: const EdgeInsetsDirectional.all(10),
                  width: (sizeW - 60),
                  height: 64,
                  decoration: BoxDecoration(
                    color: Colors.blue,
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
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 20,
                        child: Icon(
                          FlutterRemix.information_line,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10),
                        width: sizeW - 102,
                        child: const AutoSizeText(
                          'Link untuk melakukan reset password akan dikirim ke alamat email pengguna',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                BlocProvider(
                  create: (context) => LupaPassBloc(),
                  child: Container(
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
                    child: BlocConsumer<LupaPassBloc, LupaPassState>(
                      builder: (context, state) {
                        return Column(
                          children: [
                            FormInputDefaultScreen(
                              label: 'Email',
                              placehoder: 'Email',
                              onChanged: (value) {
                                context
                                    .read<LupaPassBloc>()
                                    .add(ChangePassEvent(value));
                              },
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              child: ElevatedButton(
                                style: AppTheme.raisedButtonStyle,
                                onPressed: () {
                                  context.loaderOverlay.show();
                                  context
                                      .read<LupaPassBloc>()
                                      .add(const ChangeSubmitEvent());
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
                      listener: (context, state) {
                        if (state.status == PostStatus.success) {
                          context.loaderOverlay.hide();
                          CoolAlert.show(
                            context: context,
                            type: CoolAlertType.success,
                            text:
                                'Kami sudah mengirim surel yang berisi tautan untuk mereset kata sandi Anda!',
                          );
                        }

                        if (state.status == PostStatus.failure) {
                          context.loaderOverlay.hide();
                          CoolAlert.show(
                            context: context,
                            type: CoolAlertType.error,
                            text: state.message.toString(),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }

  void _load() {}
}

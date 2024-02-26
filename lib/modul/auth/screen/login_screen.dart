import 'package:auto_route/auto_route.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pos/config/route/route.gr.dart';
import 'package:pos/modul/auth/bloc/login/login_bloc.dart';
import 'package:pos/utils/ui/styles/app_theme.dart';
import 'package:pos/utils/ui/styles/colors.dart';
import 'package:shaped_image/shaped_image.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  LoginScreenState createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  LoginScreenState();

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
              MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => LoginBloc(),
                  ),
                ],
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 40),
                        child: Image.asset(
                          'assets/png/opendesa.png',
                          width: sizeW / 1.8,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 30),
                        child: const Text(
                          'Layanan Perangkat',
                          style: AppTheme.titleStyle,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: (290 / 3) + 20),
                        child: const Text(
                          'LOGIN',
                          style: AppTheme.bluebigtitleStyle,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 20),
                        child: const Column(
                          children: [
                            InputUsername(),
                            SizedBox(
                              height: 10,
                            ),
                            InputPassword(),
                            SizedBox(
                              height: 25,
                            ),
                          ],
                        ),
                      ),
                      BlocConsumer<LoginBloc, LoginState>(
                        listenWhen: (context, state) =>
                            state.status == FormzSubmissionStatus.failure ||
                            state.status == FormzSubmissionStatus.success,
                        listener: (context, state) async {
                          if (state.status == FormzSubmissionStatus.success) {
                            context.router.replace(const HomeRoute());
                          }

                          if (state.status == FormzSubmissionStatus.failure) {
                            context.loaderOverlay.hide();
                            CoolAlert.show(
                              context: context,
                              type: CoolAlertType.error,
                              text: state.message.toString(),
                            );
                          }
                        },
                        builder: (context, state) {
                          return Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: ElevatedButton(
                              style: AppTheme.raisedButtonStyle,
                              onPressed: (state.status ==
                                      FormzSubmissionStatus.inProgress)
                                  ? null
                                  : () {
                                      //   context.loaderOverlay.show();
                                      context
                                          .read<LoginBloc>()
                                          .add(LoginSubmitted());
                                    },
                              child: const Text(
                                'Masuk',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _load() {}
}

class InputUsername extends StatelessWidget {
  const InputUsername({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: const Text(
                  'Email',
                  style: AppTheme.labelStyle,
                )),
            TextField(
              onChanged: (username) {
                context.read<LoginBloc>().add(LoginUsernameChanged(username));
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xffF5F9FF),
                prefixIcon: const Icon(
                  Icons.account_circle,
                  color: Color(0xff6e7278),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: mBorderColor),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(6.0),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: mBorderColor),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(6.0),
                  ),
                ),
                contentPadding: const EdgeInsets.all(10),
                hintText: "Email",
                hintStyle:
                    const TextStyle(fontSize: 14, color: Color(0xff6e7278)),
              ),
            ),
          ],
        );
      },
    );
  }
}

class InputPassword extends StatelessWidget {
  const InputPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: const Text(
                  'Password',
                  style: AppTheme.labelStyle,
                )),
            TextField(
              obscureText: true,
              onChanged: (password) {
                context.read<LoginBloc>().add(LoginPasswordChanged(password));
              },
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.lock,
                  color: Color(0xff6e7278),
                ),
                focusColor: mBlueColor,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: mBorderColor),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(6.0),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: mBorderColor),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(6.0),
                  ),
                ),
                contentPadding: const EdgeInsets.all(10),
                hintText: "Password",
                hintStyle:
                    const TextStyle(fontSize: 14, color: Color(0xff6e7278)),
              ),
            ),
          ],
        );
      },
    );
  }
}

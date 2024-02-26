import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/config/route/route.gr.dart';
import 'package:pos/modul/pengajuan/screen/pengajuan_screen.dart';

@RoutePage()
class PeriksaSuksesScreen extends StatefulWidget {
  const PeriksaSuksesScreen({
    Key? key,
  }) : super(key: key);

  @override
  PeriksaSuksesScreenState createState() {
    return PeriksaSuksesScreenState();
  }
}

class PeriksaSuksesScreenState extends State<PeriksaSuksesScreen> {
  PeriksaSuksesScreenState();

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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/success.png'),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'berhasil',
                style: const TextStyle(fontFamily: 'Montserrat', fontSize: 24, color: Color(0xff3A3A3A)),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 2, left: 32, right: 32),
              child: OutlinedButton(
                onPressed: () {
                  context.router.pushAndPopUntil(
                    const PengajuanRoute(),
                    predicate: (route) {
                      if (route.settings.name == 'HomeRoute') {
                        return true;
                      }

                      return false;
                    },
                  );
                },
                child: const Text(
                  'Kembali ke Daftar Pengajuant',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }

  void _load() {}
}

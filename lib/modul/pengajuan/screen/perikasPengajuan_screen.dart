import 'package:auto_route/auto_route.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pos/config/route/route.gr.dart';
import 'package:pos/modul/pengajuan/bloc/periksa_pengajuan/periksa_pengajuan_bloc.dart';
import 'package:pos/modul/pengajuan/bloc/submit_periksa/submit_periksa_bloc.dart' as Submit;
import 'package:pos/utils/ui/styles/app_theme.dart';
import 'package:pos/utils/ui/styles/colors.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

@RoutePage()
class PerikasPengajuanScreen extends StatefulWidget {
  final dynamic id;
  const PerikasPengajuanScreen({
    Key? key,
    @PathParam('id') required this.id,
  }) : super(key: key);

  @override
  PerikasPengajuanScreenState createState() {
    return PerikasPengajuanScreenState();
  }
}

class PerikasPengajuanScreenState extends State<PerikasPengajuanScreen> {
  PerikasPengajuanScreenState();

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
    final id = widget.id;
    final sizeW = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff71b8ff),
        toolbarHeight: 50,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Periksa',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: LoaderOverlay(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              width: sizeW,
              height: 250,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 0, 82, 175),
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
            Container(
              width: double.infinity,
              margin: const EdgeInsetsDirectional.symmetric(horizontal: 15),
              child: MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => PeriksaPengajuanBloc()..add(InitialPeriksaPengajuanEvent(id.toString())),
                  ),
                  BlocProvider(
                    create: (context) => Submit.SubmitPeriksaBloc(),
                  ),
                ],
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Image.asset(
                    'assets/images/logo.png',
                    width: sizeW / 9,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  BlocListener<Submit.SubmitPeriksaBloc, Submit.SubmitPeriksaState>(
                    listener: (context, state) {
                      if (state.status == Submit.PostStatus.success) {
                        context.loaderOverlay.hide();
                        context.replaceRoute(const PeriksaSuksesRoute());
                      }
                      if (state.status == Submit.PostStatus.failure) {
                        context.loaderOverlay.hide();
                      }

                      if (state.status == Submit.PostStatus.loading) {
                        context.loaderOverlay.show();
                      }
                      print('-*---------------state');
                      print(state);
                    },
                    child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: BlocBuilder<PeriksaPengajuanBloc, PeriksaPengajuanState>(
                          builder: (context, state) {
                            // if (state.submit == s.success) {
                            //   context.router.push(const PeriksaSuksesRoute());
                            // }
                            if (state.status == PostStatus.success) {
                              final data = state.periksa!.data;
                              final tanggal = DateTime.parse(data!.createdAt.toString());
                              var outputFormat = DateFormat('dd MMMM yyyy H:mm', "id_ID");
                              var outputTanggal = outputFormat.format(tanggal);
                              final totalsub = double.parse(data.hargaTotal.toString()) + double.parse(data.ongkosKirim.toString());

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: RichText(
                                          text: const TextSpan(children: [
                                            WidgetSpan(
                                                alignment: PlaceholderAlignment.middle,
                                                child: FaIcon(
                                                  FontAwesomeIcons.solidEnvelope,
                                                  color: kPrimaryColor,
                                                  size: 22,
                                                )),
                                            WidgetSpan(
                                                alignment: PlaceholderAlignment.middle,
                                                child: Padding(
                                                  padding: EdgeInsets.only(left: 5),
                                                  child: Text(
                                                    // ignore: prefer_interpolation_to_compose_strings
                                                    'Periksa Pengajuan',
                                                    style: AppTheme.headerStyle,
                                                  ),
                                                ))
                                          ]),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    margin: const EdgeInsetsDirectional.symmetric(vertical: 5),
                                    width: double.infinity,
                                    padding: const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(2),
                                      ),
                                      border: Border.all(color: const Color.fromARGB(158, 255, 255, 255)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color.fromARGB(255, 114, 114, 114).withOpacity(0.3),
                                          spreadRadius: 1,
                                          blurRadius: 10,
                                          offset: const Offset(3, 5), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Tanggal',
                                          style: TextStyle(fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          outputTanggal,
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 10),
                                          color: Colors.lightBlue.shade100,
                                          width: double.infinity,
                                          child: (data.status != 'menunggu')
                                              ? Center(
                                                  child: Text(
                                                    'STATUS : ${data.status!.toUpperCase()}',
                                                    style: TextStyle(fontWeight: FontWeight.bold),
                                                  ),
                                                )
                                              : Container(),
                                        ),
                                      ],
                                    ),
                                  ),
                                  (data.status == 'menunggu')
                                      ? BtnTerima(
                                          id: data.id,
                                        )
                                      : SizedBox(
                                          height: 20,
                                        ),
                                  Container(
                                    margin: const EdgeInsetsDirectional.symmetric(vertical: 5),
                                    width: double.infinity,
                                    padding: const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(2),
                                      ),
                                      border: Border.all(color: const Color.fromARGB(158, 255, 255, 255)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color.fromARGB(255, 114, 114, 114).withOpacity(0.3),
                                          spreadRadius: 1,
                                          blurRadius: 10,
                                          offset: const Offset(3, 5), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Expedisi',
                                          style: TextStyle(fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          data.ekspedisi.toString(),
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Alamat Pengiriman',
                                          style: TextStyle(fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          data.namaPenerima.toString(),
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          '${data.alamatPenerima}Tlp : ${data.pelanggan!.nomorTelepon}',
                                          style: TextStyle(fontWeight: FontWeight.w400),
                                          maxLines: 2,
                                        ),
                                        Text(
                                          'Rincian Produk',
                                          style: TextStyle(fontWeight: FontWeight.w400),
                                          maxLines: 2,
                                        ),
                                        Column(
                                          children: List.generate(data.detail!.length, (index) {
                                            final produk = data.detail![index];
                                            final total = double.parse(produk.jumlah.toString()) * double.parse(produk.hargaProduk.toString());
                                            return Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  produk.namaProduk.toString(),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      '${produk.jumlah}x',
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      'Rp ${produk.hargaProduk}',
                                                    ),
                                                    Expanded(child: Container()),
                                                    Text(
                                                      'Rp $total',
                                                      style: TextStyle(fontWeight: FontWeight.bold),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            );
                                          }),
                                        ),
                                        Divider(),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Container(),
                                            ),
                                            Container(
                                              width: 100,
                                              height: 20,
                                              child: Text('Total'),
                                            ),
                                            Container(
                                              width: 110,
                                              height: 20,
                                              child: Text('Rp ' + data.hargaTotal.toString()),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Container(),
                                            ),
                                            Container(
                                              width: 100,
                                              height: 20,
                                              child: Text('Ongkos Kirim'),
                                            ),
                                            Container(
                                              width: 110,
                                              height: 20,
                                              child: Text('Rp ' + data.ongkosKirim.toString()),
                                            )
                                          ],
                                        ),
                                        Divider(),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Container(),
                                            ),
                                            Container(
                                              width: 100,
                                              height: 20,
                                              child: Text('Sub Total'),
                                            ),
                                            Container(
                                              width: 110,
                                              height: 20,
                                              child: Text('Rp ' + totalsub.toString()),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  (data.status == 'menunggu')
                                      ? Row(
                                          children: [
                                            BtnTolak(
                                              id: data.id,
                                            ),
                                            BtnRevisi(
                                              id: data.id,
                                            )
                                          ],
                                        )
                                      : Container(),
                                ],
                              );
                            }
                            return Container();
                          },
                        )),
                  )
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _load() {}
}

class BtnTerima extends StatelessWidget {
  final dynamic id;
  const BtnTerima({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff077cff),
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
        ),
        onPressed: () async {
          CoolAlert.show(
              context: context,
              type: CoolAlertType.custom,
              text: "Apakah setuju surat ini?",
              cancelBtnText: "Batal",
              confirmBtnText: 'Setuju',
              onConfirmBtnTap: () {
                // Submit.SubmitPeriksaBloc
                // ignore: avoid_single_cascade_in_expression_statements
                context.read<Submit.SubmitPeriksaBloc>()..add(Submit.SetujuPengajuanEvent(id.toString()));
              },
              cancelBtnTextStyle: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 18.0),
              showCancelBtn: true);
        },
        child: const Text.rich(TextSpan(children: [
          WidgetSpan(
              child: Icon(
            Icons.check,
            size: 18,
          )),
          TextSpan(text: ' Terima', style: AppTheme.buttonStyle),
        ])),
      ),
    );
  }
}

class BtnTolak extends StatelessWidget {
  final dynamic id;
  final alasanController = TextEditingController();
  BtnTolak({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeW = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(top: 20, right: 20),
      width: (sizeW / 2) - 50,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 223, 18, 35),
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
        ),
        onPressed: () async {
          Alert(
              context: context,
              title: "Konfirmasi",
              content: Column(
                children: <Widget>[
                  TextField(
                    controller: alasanController,
                    minLines: 3,
                    maxLines: 4,
                    decoration: const InputDecoration(
                      helperMaxLines: 2,
                      labelText: 'Pesan singkat alasan Tolak',
                    ),
                  ),
                ],
              ),
              buttons: [
                DialogButton(
                  color: const Color(0xff7400e9),
                  onPressed: () {
                    context.read<Submit.SubmitPeriksaBloc>().add(Submit.TolakPengajuanEvent(id.toString(), alasanController.text));
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                  child: const Text(
                    "Kirim",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                DialogButton(
                  color: const Color(0xfffe0000),
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                  child: const Text(
                    "Batal",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )
              ]).show();
        },
        child: const Text.rich(TextSpan(children: [
          WidgetSpan(
              child: Icon(
            Icons.check,
            size: 14,
          )),
          TextSpan(text: ' Tolak', style: AppTheme.buttonStyle),
        ])),
      ),
    );
  }
}

class BtnRevisi extends StatelessWidget {
  final alasanController = TextEditingController();
  final dynamic id;
  BtnRevisi({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeW = MediaQuery.of(context).size.width;
    return Container(
      width: (sizeW / 2) - 50,
      margin: const EdgeInsets.only(top: 20),
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 240, 203, 38),
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
        ),
        onPressed: () async {
          Alert(
              context: context,
              title: "Konfirmasi",
              content: Column(
                children: <Widget>[
                  TextField(
                    controller: alasanController,
                    minLines: 3,
                    maxLines: 4,
                    decoration: const InputDecoration(
                      helperMaxLines: 2,
                      labelText: 'Pesan singkat alasan Revisi',
                    ),
                  ),
                ],
              ),
              buttons: [
                DialogButton(
                  color: const Color(0xff7400e9),
                  onPressed: () {
                    context.read<Submit.SubmitPeriksaBloc>().add(Submit.RevisiPengajuanEvent(id.toString(), alasanController.text));
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                  child: const Text(
                    "Kirim",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                DialogButton(
                  color: const Color(0xfffe0000),
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                  child: const Text(
                    "Batal",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )
              ]).show();
        },
        child: const Text.rich(TextSpan(children: [
          WidgetSpan(
              child: Icon(
            Icons.check,
            size: 14,
          )),
          TextSpan(text: ' Revisi', style: AppTheme.buttonStyle),
        ])),
      ),
    );
  }
}

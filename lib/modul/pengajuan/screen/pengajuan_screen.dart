import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pos/config/route/route.gr.dart';
import 'package:pos/modul/pengajuan/bloc/pengajuan/pengajuan_bloc.dart';
import 'package:pos/modul/pengajuan/screen/pengajuan_loading_screen.dart';
import 'package:pos/utils/ui/styles/app_theme.dart';
import 'package:pos/utils/ui/styles/colors.dart';

@RoutePage()
class PengajuanScreen extends StatefulWidget {
  const PengajuanScreen({
    Key? key,
  }) : super(key: key);

  @override
  PengajuanScreenState createState() {
    return PengajuanScreenState();
  }
}

class PengajuanScreenState extends State<PengajuanScreen> {
  PengajuanScreenState();

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
      child: BlocProvider(
        create: (context) => PengajuanBloc()..add(const InitialPengajuanEvent()),
        child: SingleChildScrollView(
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
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
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
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
                                              'Daftar Pengajuan',
                                              style: AppTheme.headerStyle,
                                            ),
                                          ))
                                    ]),
                                  ),
                                ),
                                BlocBuilder<PengajuanBloc, PengajuanState>(
                                  builder: (context, state) {
                                    return InkWell(
                                      onTap: () {
                                        context.read<PengajuanBloc>().add(const ReloadEvent());
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        child: Center(
                                          child: FaIcon(
                                            FontAwesomeIcons.rotate,
                                            color: kPrimaryColor,
                                            size: 25,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                )
                              ],
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    BlocBuilder<PengajuanBloc, PengajuanState>(builder: (context, state) {
                      if (state.status == PostStatus.loading) {
                        return Column(
                          children: List.generate(5, (index) => const ListPengajuanSkeleton()),
                        );
                      }
                      if (state.status == PostStatus.success) {
                        final data = state.pengajuan!.data;
                        if (data!.isEmpty) {
                          return Container(
                            margin: const EdgeInsetsDirectional.symmetric(vertical: 5),
                            height: 60,
                            padding: const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
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
                            child: const Center(
                              child: Text('Data Tidak Ditemukan'),
                            ),
                          );
                        }
                        final hasreachedMax = state.hasreachedMax;
                        final length = hasreachedMax ? data.length : data.length + 1;
                        return Column(
                            children: List.generate(
                          length,
                          (index) {
                            if (index < data.length) {
                              final value = data[index];
                              final tanggal = DateTime.parse(value.createdAt.toString());
                              var outputFormat = DateFormat('dd MMMM yyyy H:mm', "id_ID");
                              var outputTanggal = outputFormat.format(tanggal);
                              final status = value.status;
                              Color coloricon;
                              IconData iconstatus;
                              String textstatus;
                              switch (status) {
                                case 'menunggu':
                                  coloricon = Colors.lightBlue.shade800;
                                  iconstatus = FlutterRemix.time_fill;
                                  textstatus = 'Periksa';
                                  break;
                                case 'tolak':
                                  coloricon = Colors.red.shade800;
                                  iconstatus = FlutterRemix.close_circle_fill;
                                  textstatus = 'Ditolak';
                                  break;
                                case 'revisi':
                                  coloricon = Colors.green.shade800;
                                  iconstatus = FlutterRemix.check_fill;
                                  textstatus = 'Revisi';
                                  break;
                                case 'setuju':
                                  coloricon = Colors.purple.shade700;
                                  iconstatus = FlutterRemix.check_fill;
                                  textstatus = 'Disetujui';
                                  break;
                                default:
                                  coloricon = Colors.yellow.shade800;
                                  iconstatus = FlutterRemix.information_fill;
                                  textstatus = '';
                              }
                              return InkWell(
                                onTap: () {
                                  context.router.push(PerikasPengajuanRoute(id: value.id));
                                },
                                child: Container(
                                    margin: const EdgeInsetsDirectional.symmetric(vertical: 5),
                                    height: 120,
                                    padding: const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(10),
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
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(right: 10),
                                              width: 25,
                                              height: 25,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
                                                color: coloricon, // Set your desired background color
                                              ),
                                              child: Icon(
                                                iconstatus,
                                                size: 17,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Expanded(
                                                child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    AutoSizeText(
                                                      value.namaPenerima.toString(),
                                                      style: AppTheme.bodyStyle,
                                                      maxLines: 1,
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        margin: EdgeInsets.only(left: 5),
                                                        child: AutoSizeText(
                                                          '#' + value.id.toString(),
                                                          style: AppTheme.bodyStyleBold,
                                                          maxLines: 1,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(right: 5),
                                                      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                                                        color: coloricon, // Set your desired background color
                                                      ),
                                                      child: Text(
                                                        textstatus.toString(),
                                                        style: TextStyle(color: Colors.white),
                                                        maxLines: 1,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Text(outputTanggal),
                                                Text(value.alamatPenerima.toString()),
                                                Row(
                                                  children: [
                                                    Text('Ekspedisi : '),
                                                    Text(value.ekspedisi.toString()),
                                                    Text('( ' + value.tipe.toString() + ')'),
                                                  ],
                                                )
                                              ],
                                            )),
                                          ],
                                        ),
                                      ],
                                    )),
                              );
                            } else {
                              return const ListPengajuanSkeleton();
                            }
                          },
                        ));
                      }

                      return Container();
                    })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  void _load() {}
}

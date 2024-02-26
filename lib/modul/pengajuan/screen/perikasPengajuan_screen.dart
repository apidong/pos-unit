import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

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
            )
          ],
        ),
      ),
    );
  }

  void _load() {}
}

import 'package:flutter/material.dart';
import 'package:pos/utils/ui/styles/colors.dart';

class AppTheme {
  static Color activeColor = const Color(0xff0BEEF9);
  static Color inactiveColor = const Color(0xff03838b);
  static const Color white = Color(0xFFFFFFFF);
  static const Color textDefault = Color(0xff394043);

  static ButtonStyle myButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
      foregroundColor: MaterialStateProperty.all<Color>(activeColor),
      backgroundColor: MaterialStateProperty.all<Color>(inactiveColor),
    );
  }

  static ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: const Color(0xff4cb050),
    elevation: 0,
    minimumSize: const Size(88, 44),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );

  static ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    elevation: 0,
    minimumSize: const Size(double.infinity, 50),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
    backgroundColor: const Color(0xff4cb050),
    foregroundColor: Colors.white,
  );

  static const TextStyle labelStyle =
      TextStyle(fontFamily: 'Lato', fontSize: 16, color: Colors.black);
  static const TextStyle titleStyle =
      TextStyle(fontFamily: 'Lato', fontWeight: FontWeight.w700, fontSize: 22);
  static const TextStyle bluebigtitleStyle = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.bold,
      fontSize: 26,
      color: Color(0xff2192f1));
  static const TextStyle headerStyle =
      TextStyle(fontFamily: 'Lato', fontSize: 16, color: kPrimaryColor);
  static const TextStyle bodyStyle = TextStyle(
      fontFamily: 'Lato',
      fontSize: 13,
      color: kPrimaryColor,
      fontWeight: FontWeight.w300);
  static const TextStyle bodyStyleBold = TextStyle(
      fontFamily: 'Lato',
      fontSize: 13,
      color: kPrimaryColor,
      fontWeight: FontWeight.bold);
  static const TextStyle detailStyle =
      TextStyle(fontFamily: 'Lato', fontSize: 12, color: kPrimaryColor);
  static const TextStyle widgetStyle =
      TextStyle(fontFamily: 'Lato', fontSize: 20, color: Color(0xff394043));
  static const TextStyle buttonStyle = TextStyle(
      fontFamily: 'Lato',
      fontSize: 12,
      color: Color.fromARGB(255, 255, 255, 255));
  static const TextStyle dataStyleDark = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: Color(0xff414B5A));
  static const TextStyle dataStyleGrey = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: Color(0xff788190));
  static const TextStyle dataStyleBlue = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: Color(0xff58aef5));

  ThemeData themedata = ThemeData(
      useMaterial3: true,
      textTheme: const TextTheme(
        bodySmall: TextStyle(
          fontFamily: 'Lato',
        ),

        // Setting fontFamily for the bodyText1 text style, that is used by default for the AppBar title and also for TabBar label if you use DefaultTabController.
        titleLarge: TextStyle(
          fontFamily: 'Lato',
        ),

        //Setting fontFamily for the bodyText1 text style, that is used by default for the TabBar label.
        titleMedium: TextStyle(
          fontFamily: 'Lato',
        ),
        // textTheme: TextTheme( defa  )
//   DefaultTextStyle(
//   style: TextStyle(fontSize: 40),
//   child: Text("Hello World"),
// );
        // primarySwatch: Colors.red,
      ));
}

import 'package:flutter/material.dart';

import 'bitcoin/pages/bitcoinpage/bitcoin_dois_page.dart';
import 'bitcoin/pages/bitcoinpage/bitcoin_um_page.dart';
import 'bitcoin/pages/bitcoinpage/home_page.dart';
import 'bitcoin/pages/splash/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: const MaterialColor(
          0xFF000A38,
          <int, Color>{
            50: Color.fromRGBO(0, 10, 56, 1),
            100: Color.fromRGBO(0, 10, 56, 1),
            200: Color.fromRGBO(0, 10, 56, 1),
            300: Color.fromRGBO(0, 10, 56, 1),
            400: Color.fromRGBO(0, 10, 56, 1),
            500: Color.fromRGBO(0, 10, 56, 1),
            600: Color.fromRGBO(0, 10, 56, 1),
            700: Color.fromRGBO(0, 10, 56, 1),
            800: Color.fromRGBO(0, 10, 56, 1),
            900: Color.fromRGBO(0, 10, 56, 1),
          },
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashPage(),
        '/homePage': (context) => const HomePage(),
        '/bitcoinUmPage': (context) => const BitcoinUmPage(),
        '/bitcoinDoisPage': (context) => const BitcoinDoisPage(),
      },
    );
  }
}

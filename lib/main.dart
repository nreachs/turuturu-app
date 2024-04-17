import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:workturuturu/pages/home-page-finance.dart';
import 'package:workturuturu/pages/pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return MaterialApp(
          title: 'TURUTURU',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Colors.white54,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => LoginPage(),
            'homeSite': (context) => HomePageSite(),
            'homeFinance': (context) => HomePageFinance(),
            'homeAdmin': (context) => HomePageAdmin(),
          },
        );
      },
    );
  }
}

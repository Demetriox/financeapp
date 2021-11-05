import 'package:flutter/material.dart';
import 'package:talentscode/ui/view/home_screen.dart';
import 'package:talentscode/ui/view/info_last_ten_screen.dart';
import 'package:talentscode/ui/view/loading_screen.dart';
import 'package:talentscode/ui/view/login_screen.dart';
import 'package:talentscode/ui/view/options_in_stock_screen.dart';
import 'package:talentscode/ui/view/sign_in_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'talentscode',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/', //first screen
      routes: {
        '/': (context) => LoadingScreen(),
        '/login': (context) => LoginScreen(),
        '/home_screen': (context) => const HomeScreen(),
        '/sign_in': (context) => const SignIn(),
        '/options_screen': (context) => const OptionsScreen(),
        '/last_ten_days_screen': (context) => const LastTenDaysScreen(),
      },
    );
  }
}

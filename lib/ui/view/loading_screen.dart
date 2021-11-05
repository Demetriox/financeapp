import 'package:flutter/material.dart';
import 'package:talentscode/secure_storage/session.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  initState() {
    super.initState();
    load();
  }

//Information pre loaded, before app starts.
  Future<void> load() async {
    _getTokenFromSharedPref();
  }

  //Check storage of user auth
  Future<void> _getTokenFromSharedPref() async {
    final token = await Session().get();

    if (token != null) {
      Future.delayed(Duration.zero, () {
        Navigator.of(context).pushNamedAndRemoveUntil(
          '/home_screen',
          (Route<dynamic> route) => true,
        );
      });
    } else {
      Future.delayed(Duration.zero, () {
        Navigator.of(context).pushNamedAndRemoveUntil(
          '/login',
          (Route<dynamic> route) => true,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text("Hola Mundo"),
    ));
  }
}

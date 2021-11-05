import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mdi/mdi.dart';
import 'package:talentscode/secure_storage/session.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _session = Session();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Trading Options'),
          toolbarHeight: 120, // Set this height
          flexibleSpace: Container(
            color: Colors.orange,
            child: Column(
              children: [
                Text('Trading'),
              ],
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/transferencia-de-dinero.png',
                width: 150,
                height: 150,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/options_screen');
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.orange),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                  textStyle: MaterialStateProperty.all(
                    const TextStyle(fontSize: 25),
                  ),
                ),
                child: const Text('Ver Opciones'),
              ),
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Cerrar sesión',
                    ),
                    Icon(
                      Mdi.logout,
                      size: 25,
                    ),
                  ],
                ),
                onTap: () {
                  _deleteToken() async {
                    await _session.clear();
                  }

                  _deleteToken();
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/login', (Route<dynamic> route) => false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

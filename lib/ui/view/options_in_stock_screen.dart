import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:talentscode/constants/responsive_helper.dart';
import 'package:talentscode/secure_storage/session.dart';
import 'package:talentscode/ui/view/info_last_ten_screen.dart';

class OptionsScreen extends StatefulWidget {
  const OptionsScreen({Key? key}) : super(key: key);

  @override
  _OptionsScreenState createState() => _OptionsScreenState();
}

class _OptionsScreenState extends State<OptionsScreen> {
  final _session = Session();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ver Historial"),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: ResponsiveSize(context).widthResp(70),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed('/last_ten_days_screen', arguments: '%5EIXIC');
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.orange),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(40)),
                  textStyle: MaterialStateProperty.all(
                    const TextStyle(fontSize: 20),
                  ),
                ),
                child: const Text('NASDAQ'),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: ResponsiveSize(context).widthResp(70),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed('/last_ten_days_screen', arguments: '%5EN225');
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.orange),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(40)),
                  textStyle: MaterialStateProperty.all(
                    const TextStyle(fontSize: 20),
                  ),
                ),
                child: const Text('Nikkei 225'),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: ResponsiveSize(context).widthResp(70),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/last_ten_days_screen',
                      arguments: '%5EDAX-EU');
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.orange),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(40)),
                  textStyle: MaterialStateProperty.all(
                    const TextStyle(fontSize: 20),
                  ),
                ),
                child: const Text('DAX Index'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

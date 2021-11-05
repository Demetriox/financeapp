import 'package:flutter/material.dart';
import 'package:talentscode/constants/constants_global.dart';
import 'package:talentscode/constants/responsive_helper.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState({Key? key}) => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Controllers of the inputs
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController accountController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rfcController = TextEditingController();
  String message = "";

  //Togle see password on screen
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      bottom: ResponsiveSize(context).widthResp(10)),
                ),
                TextFormField(
                  controller: accountController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(25.0),
                      ),
                    ),
                    filled: true,
                    hintStyle: TextStyle(
                      color: Color(0xffDCDCDC),
                    ),
                    fillColor: Colors.white70,
                    labelText: "Correo Electronico",
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Usuario No Valido';
                    }
                    return null;
                  },
                ),
                SizedBox(height: ResponsiveSize(context).heightResp(3)),
                //rfcController
                TextFormField(
                  controller: rfcController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(25.0),
                      ),
                    ),
                    filled: true,
                    hintStyle: TextStyle(
                      color: Color(0xffDCDCDC),
                    ),
                    fillColor: Colors.white70,
                    labelText: "Escriba su RFC",
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'RFC No Valido';
                    }
                    return null;
                  },
                ),
                SizedBox(height: ResponsiveSize(context).heightResp(3)),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        obscureText: _obscureText,
                        controller: passwordController,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(25.0),
                            ),
                          ),
                          filled: true,
                          suffixIcon: InkWell(
                            onTap: _toggle,
                            child: _obscureText
                                ? const Icon(Icons.remove_red_eye, size: 20)
                                : const Icon(
                                    Icons.block,
                                    size: 20,
                                  ),
                          ),
                          hintStyle: const TextStyle(color: Color(0xffDCDCDC)),
                          fillColor: Colors.white70,
                          labelText: "Contraseña",
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Contraseña es requerida';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                Text(
                  message,
                  style: const TextStyle(
                    color: Color(0xffc21d00),
                  ),
                ),
                SizedBox(height: ResponsiveSize(context).heightResp(1)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      style: raisedButtonStyle,
                      onPressed: () {
                        _submit();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const <Widget>[
                          Text(
                            "Entrar",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _submit() {
    _formKey.currentState!.validate();

    showDialog(
      context: context,
      builder: (_) => const AlertDialog(
        title: Text(
          "Revisando Credenciales",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
        ),
      ),
    );

    _setToken() async {
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/home_screen', (route) => false);
    }

    _setToken();
  }
}

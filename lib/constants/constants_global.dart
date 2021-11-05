// the responsive is manages checking the Layout builder.
// Other option is to check if you can
//change, the screen size and use the ternary operator

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kTableBreakpoint = 768.0;
const kSideMenuWidth = 300.0;

/*Material Button */
final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  minimumSize: Size(70, 35),
  padding: EdgeInsetsDirectional.only(start: 5, end: 5),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(4),
    ),
  ),
);

const TextStyle KNissan = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w500,
  letterSpacing: 1,
  fontFamily: "NimbusSanL",
);

// const TextStyle KBigTitle = TextStyle(
//     fontWeight: FontWeight.normal, letterSpacing: 3, fontFamily: "NimbusSanL");

const API_ROOT = 'http://findableservernissan.azurewebsites.net/api';

//API CALLS

class APIStrings {
  /* Login */
  static String login_url = '$API_ROOT/auth/login';
}

import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
class Utils {

   toastMessage(String mmessage, Color color) {
    Fluttertoast.showToast(
      msg: mmessage,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0
    );
  }

  static void flushbarErrorMessage(String messgae, BuildContext context ,Color color , String title) {
    showFlushbar(context: context,
     flushbar: Flushbar(
        flushbarPosition: FlushbarPosition.BOTTOM,
        flushbarStyle: FlushbarStyle.FLOATING,
        isDismissible: true,
        borderRadius: BorderRadius.circular(15),
        boxShadows: [
          BoxShadow(
            color: Colors.black45,
            offset: Offset(3, 3),
            blurRadius: 3,
          ),
        ],
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      forwardAnimationCurve: Curves.easeOutQuart,
        title: title,
      message: messgae,
      icon: Icon(Icons.info_outline, size: 28, color: Colors.white),
      backgroundColor: color,
      duration: Duration(seconds: 3),
     )..show(context),
     );
  }

}
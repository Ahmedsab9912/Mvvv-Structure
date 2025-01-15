import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

// We are using utils to maanage out Utility functions
class Utils {


// This function is used to change the focus of the TextFormField
  static void filedFocusChange(
    BuildContext context,
     FocusNode currentFocus,
      FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }


// This function is used to show toast message
  static void toastMessage(String mmessage, Color color) {
    Fluttertoast.showToast(
      msg: mmessage,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.sp
    );
  }

// This function is used to show flushbar message
  static void flushbarErrorMessage(String messgae, BuildContext context ) {
    showFlushbar(context: context,
     flushbar: Flushbar(
        flushbarPosition: FlushbarPosition.BOTTOM,
        flushbarStyle: FlushbarStyle.FLOATING,
        isDismissible: true,
        borderRadius: BorderRadius.circular(15.r),
        boxShadows: [
          BoxShadow(
            color: Colors.black45,
            offset: Offset(3.sp, 3.sp),
            blurRadius: 3.r,
          ),
        ],
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      forwardAnimationCurve: Curves.easeOutQuart,
        title: "Info",
      message: messgae,
      icon: Icon(Icons.info_outline, size: 28.sp, color: Colors.white),
      backgroundColor: Colors.green,
      duration: Duration(seconds: 3),
     )..show(context),
     );

  }
  }
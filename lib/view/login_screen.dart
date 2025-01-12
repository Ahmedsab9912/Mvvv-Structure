import 'package:flutter/material.dart';
import 'package:mvvm_arc/utils/routes/routes_name.dart';
import 'package:mvvm_arc/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        // onTap: () => Navigator.pushNamed(context, RoutesName.home),
        onTap: () {
          // myutils.toastMessage('Login Succfully', Colors.green);
          Utils.flushbarErrorMessage('Login Succfully', context
          , Colors.green, 'Success');
          // Navigator.pushNamed(context, RoutesName.home);
        },
        child: Center(child: Text('Click Me'))),
    );
  }
}
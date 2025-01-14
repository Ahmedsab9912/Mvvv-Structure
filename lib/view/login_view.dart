import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvvm_arc/res/components/colors.dart';
import 'package:mvvm_arc/res/components/round_button.dart';
import 'package:mvvm_arc/utils/routes/routes_name.dart';
import 'package:mvvm_arc/utils/utils.dart';
import 'package:mvvm_arc/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final authviewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0.r),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    focusNode: emailFocusNode,
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Email',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    onFieldSubmitted: (value) {
                      Utils.filedFocusChange(
                          context, emailFocusNode, passwordFocusNode);
                    },
                  ),
                  SizedBox(height: 15.h),
                  TextFormField(
                    focusNode: passwordFocusNode,
                    obscureText: !_isPasswordVisible,
                    keyboardType: TextInputType.visiblePassword,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(_isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                      labelText: 'Password',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                    onFieldSubmitted: (value) {
                      passwordFocusNode.unfocus();
                    },
                  ),
                  SizedBox(height: 15.h),
                  RoundButton(
                    color: AppColors.primaryColor,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        // This is the place where we are passing the login keys
                        Map loginKeys = {
                          'email': emailController.text,
                          'password': passwordController.text
                        };
                        // This is the place where we are calling the loginApi function 
                        authviewModel.loginApi(loginKeys, context);
                        // Perform login action
                        Navigator.pushNamed(context, RoutesName.home);
                        Utils.flushbarErrorMessage("Login Successfully", context, AppColors.greenColor, "Success");
                      } else {
                        Utils.flushbarErrorMessage("Login Failed", context, AppColors.redColor, "Error");
                      }
                    },
                    textStyle: GoogleFonts.poppins(
                      color: AppColors.whiteColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    text: "Login",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

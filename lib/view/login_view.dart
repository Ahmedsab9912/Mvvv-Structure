import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvvm_arc/res/components/colors.dart';
import 'package:mvvm_arc/res/components/round_button.dart';
import 'package:mvvm_arc/utils/routes/routes_name.dart';
import 'package:mvvm_arc/utils/utils.dart';

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
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(8.0.r),
            child: Form(
              key: _formKey,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 120.r,
                      backgroundImage: NetworkImage(
                          'https://img.freepik.com/premium-vector/free-vector-beautiful-flying-hummingbird-design-element-banners-posters-leaflets-brochur_1009653-1.jpg'),
                    ),
                    SizedBox(height: 15.h),
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
                          // Perform login action
                        Utils.flushbarErrorMessage("Login Succfully", context, AppColors.greenColor, "Success");
                          Navigator.pushNamed(context, RoutesName.home);
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
      ),
    );
  }
}

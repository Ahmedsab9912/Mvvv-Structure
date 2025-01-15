import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvvm_arc/res/components/colors.dart';
import 'package:mvvm_arc/res/components/round_button.dart';
import 'package:mvvm_arc/utils/routes/routes_name.dart';
import 'package:mvvm_arc/utils/utils.dart';
import 'package:mvvm_arc/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  bool _isPasswordVisible = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authviewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
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
                    onFieldSubmitted: (value) {
                      passwordFocusNode.unfocus();
                    },
                  ),
                  SizedBox(height: 15.h),
                  RoundButton(
                    title: "Sign Up",
                    loading: authviewModel.signUpLoading,
                    onPress: () {
                      if(emailController.text.isEmpty){
                        Utils.flushbarErrorMessage('Please enter email', context);
                      }else if(passwordController.text.isEmpty){
                        Utils.flushbarErrorMessage('Please enter password', context);
                      }else if(passwordController.text.length < 6){
                        Utils.flushbarErrorMessage('Password must be at least 6 characters', context);
                      }else {
                        print('Api hit');
                      }
                      // This is the place where we are passing the login keys
                      Map loginKeys = {
                        'email': emailController.text.toString(),
                        'password': passwordController.text.toString(),
                      };
                      // This is the place where we are calling the loginApi function 
                      authviewModel.signupApi(loginKeys, context);
                      print(loginKeys);
                      // Perform login action
                      // Navigator.pushNamed(context, RoutesName.home);
                    },
                  ),
                  SizedBox(height: 15.h),
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, RoutesName.login);
                    },
                    child: Text('Have Account? Log In'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


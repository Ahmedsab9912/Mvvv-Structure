import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_arc/repository/auth_repository.dart';
import 'package:mvvm_arc/utils/utils.dart';

class AuthViewModel with ChangeNotifier{

  final _myRepo = AuthRepository();

  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

setSignUpLoading(bool value){
  _signUpLoading = value;
  notifyListeners();
}

  Future<void> loginApi(dynamic data , BuildContext context) async {
    setLoading(true);
   _myRepo.loginApi(data).then((value){
    setLoading(false);
    Utils.flushbarErrorMessage('Login Successfully', context,);
    if (kDebugMode) {
      print(value.toString());
    }
   }).onError((error, stackTrace){
    Utils.toastMessage(error.toString(), Colors.red);
    setLoading(false);
    if(kDebugMode){
      print(error.toString());
    }
   });
  }


  Future<void> signupApi(dynamic data , BuildContext context) async {
    setSignUpLoading(true);
   _myRepo.signUpApi(data).then((value){
    setSignUpLoading(false);
    Utils.flushbarErrorMessage('Signup Successfully', context,);
    if (kDebugMode) {
      print(value.toString());
    }
   }).onError((error, stackTrace){
    Utils.toastMessage(error.toString(), Colors.red);
    setSignUpLoading(false);
    if(kDebugMode){
      print(error.toString());
    }
   });
  }

}
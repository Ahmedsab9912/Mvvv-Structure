import 'package:flutter/material.dart';
import 'package:mvvm_arc/utils/routes/routes_name.dart';
import 'package:mvvm_arc/view/home_screen.dart';
import 'package:mvvm_arc/view/login_screen.dart';

// We are creating a class called Routes
class Routes {
  // We are creating a static method called generateRoute
  static Route<dynamic>  generateRoute(RouteSettings myPath) {

// We are using a switch statement to check the route name
    switch (myPath.name) {
      // If the route name is home, we will return the HomeScreen
      case RoutesName.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
// If the route name is login, we will return the LoginScreen
      case RoutesName.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
// If the route name is not defined, we will return a Scaffold with a Text widget        
      default:
        return MaterialPageRoute(builder: (_){
          return Scaffold(
            body:  Center(
            child: Text('No route defined}'),
          ),
          );
    });
    }
  }
}
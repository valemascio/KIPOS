import 'package:flutter/material.dart';
import 'package:kipos/screens/badgePage.dart';
import 'package:kipos/screens/homePage.dart';
import 'package:flutter_login/flutter_login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const route = '/';
  static const routename = 'LoginPage';

  Future<String> _loginUser(LoginData data) async {
    if (data.name == 'bug@expert.com' && data.password == 'gruppo4') {
      return '';
    } else {
      return 'Wrong credentials';
    }
  } // _loginUser

  Future<String> _signUpUser(SignupData data) async {
    return 'To be implemented';
  } // _signUpUser

  Future<String> _recoverPassword(String email) async {
    return 'Recover password functionality needs to be implemented';
  } // _recoverPassword

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'KÌPOS',
      onLogin: _loginUser,
      onSignup: _signUpUser,
      onRecoverPassword: _recoverPassword,
      theme: //LOGIN THEME
          LoginTheme(
        primaryColor: Colors.lightGreen,
        accentColor: Color.fromARGB(255, 122, 164, 94),
        errorColor: Colors.deepOrange,
        titleStyle: const TextStyle(
          color: Colors.white,
        ),
        cardTheme: CardTheme(
          color: Color.fromARGB(255, 255, 255, 255),
          elevation: 5,
          margin: const EdgeInsets.only(top: 15),
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(100.0)),
        ),
        inputTheme: InputDecorationTheme(
          filled: true,
          fillColor: Color.fromARGB(255, 149, 172, 150).withOpacity(.1),
          contentPadding: EdgeInsets.zero,
          errorStyle: const TextStyle(
            color: Color.fromARGB(255, 255, 0, 0),
          ),
        ),
        buttonTheme: const LoginButtonTheme(
          splashColor: Color.fromARGB(255, 122, 164, 94),
          highlightColor: Color.fromARGB(255, 122, 164, 94),
          elevation: 9.0,
          highlightElevation: 6.0,
        ),
      ),
      onSubmitAnimationCompleted: () async {
        Navigator.of(context).pushReplacementNamed(HomePage.route);
      },
    );
  } // build
} // LoginScreen

//
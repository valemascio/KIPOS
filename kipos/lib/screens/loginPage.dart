import 'package:flutter/material.dart';
import 'package:kipos/screens/homePage.dart';
import 'package:kipos/screens/prehomePage.dart';
import 'package:kipos/screens/introPage.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const route = '/';
  static const routename = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    //Check if the user is already logged in before rendering the login page
    _checkLogin();
  } //initState

  void _checkLogin() async {
    //Get the SharedPreference instance and check if the value of the 'username' filed is set or not
    final sp = await SharedPreferences.getInstance();
    if (sp.getString('username') != null) {
      //If 'username is set, push the HomePage
      _toHomePage(context);
    } //if
  } //_checkLogin

  Future<String> _loginUser(LoginData data) async {
    if (data.name == 'kipos@unipd.it' && data.password == 'gruppo4') {
      final sp = await SharedPreferences.getInstance();
      sp.setString('username', data.name);
      return '';
    } else {
      return 'Wrong credentials';
    }
  } // _loginUser

  /*UpUser(SignupData data) async {
    return 'To be implemented';
  } // _signUpUser*/

  Future<String> _recoverPassword(String email) async {
    return 'Recover password functionality needs to be implemented';
  } // _recoverPassword

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'KÌPOS',
      onLogin: _loginUser,
      //onSignup: _signUpUser,
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
        _toIntroPage(context);
      },
    );
  } // build

  void _toHomePage(BuildContext context) async {
    final access = await SharedPreferences.getInstance();
    String? auth = access.getString('pass');
    if (auth != 'stop') {
      Navigator.of(context).pushReplacementNamed(PreHomePage.route);
    } else {
      Navigator.of(context).pushReplacementNamed(HomePage.route);
    }
  } // LoginScreen

  void _toIntroPage(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(IntroPage.route);
  } // LoginScreen
}
//
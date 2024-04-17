import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:workturuturu/pages/pages.dart';
import 'package:workturuturu/widgets/background-image.dart';

import '../paletter.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isLoggIn = false;
  _logIn() async {
    setState(() {
      isLoggIn = true;
    });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      // ignore: unrelated_type_equality_checks
      if (_emailController.text == "turuturuinfo@gmail.com" &&
          _passwordController.text == "123@turuturu") {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomePageAdmin()));
      } else if (_emailController.text == "iraduberth@gmail.com" &&
          _passwordController.text == "berber") {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomePageFinance()));
      } else if (_emailController.text == "kimumaxime@gmail.com" &&
          _passwordController.text == "site@max") {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomePageSite()));
      }
    } on FirebaseAuthException catch (e) {
      var message = '';
      switch (e.code) {
        case 'invalid-email':
          message = 'The Email you entered was invalid';
          break;

        case 'user-disabled':
          message = 'The user you are tried to log into is desabled';
          break;

        case 'user-not-found':
          message = 'The user you are tried to log into was not found';
          break;

        case 'wrong-password':
          message = 'Incorrect password';
          break;
      }
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Center(child: Text('Login is failed')),
              content: Text(message),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          });
    } finally {
      setState(() {
        isLoggIn = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        BackgroundImage(
          image: 'background-turuturu/imagebackground.jpg',
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              SizedBox(height: 15),
              Flexible(
                child: Center(
                  child: Container(
                    height: size.height * .25,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage('background-turuturu/truturu.png'),
                            fit: BoxFit.contain)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Container(
                  height: size.height * .08,
                  width: size.width * .85,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.3),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Icon(
                              FontAwesomeIcons.envelope,
                              size: 20,
                              color: kWhite,
                            ),
                          ),
                          hintText: 'Email',
                          hintStyle: kBodzStyle),
                      style: kBodzStyle,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Container(
                  height: size.height * .08,
                  width: size.width * .85,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.3),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Icon(
                              FontAwesomeIcons.lock,
                              size: 20,
                              color: kWhite,
                            ),
                          ),
                          hintText: 'Password',
                          hintStyle: kBodzStyle),
                      obscureText: true,
                      style: kBodzStyle,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                ),
              ),
              if (!isLoggIn)
                SizedBox(
                  height: 30,
                ),
              GestureDetector(
                onTap: () {
                  _logIn();
                },
                child: Container(
                  height: size.height * .05,
                  width: size.width * .85,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.yellow.withOpacity(.5),
                          style: BorderStyle.solid,
                          width: 2),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          'Login',
                          style: kBodzStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (isLoggIn) ...[
                SizedBox(
                  height: 35,
                ),
                Center(
                  child: CircularProgressIndicator(),
                ),
                SizedBox(
                  height: 30,
                ),
              ]
            ],
          ),
        ),
      ],
    );
  }
}

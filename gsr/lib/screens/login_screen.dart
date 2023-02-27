import 'package:flutter/material.dart';
import 'package:gsr/providers/data_provider.dart';
import 'package:gsr/screens/root_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  bool _validemail = false;
  bool _validpwd = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 50,
                    bottom: 40,
                  ),
                  child: Image.asset(
                    "assets/images/logo.png",
                    width: 190,
                    height: 70,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    autofocus: false,
                    controller: emailcontroller,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      errorText: _validemail ? 'Email is empty!' : null,
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    autofocus: false,
                    obscureText: true,
                    controller: passwordcontroller,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      errorText: _validpwd ? 'Password is empty!' : null,
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  onPressed: () async {
                    setState(() {
                      emailcontroller.text.isEmpty
                          ? _validemail = true
                          : _validemail = false;
                      passwordcontroller.text.isEmpty
                          ? _validpwd = true
                          : _validpwd = false;
                    });
                    if (emailcontroller.text.isNotEmpty &&
                        passwordcontroller.text.isNotEmpty) {
                      final result = await Provider.of<DataProvider>(context,
                              listen: false)
                          .login(emailcontroller.text, passwordcontroller.text);
                      if (result) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => RootScreen(),
                          ),
                        );
                      }
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Sign in",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                Image.asset(
                  "assets/images/image.png",
                  width: 300,
                  height: 220,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

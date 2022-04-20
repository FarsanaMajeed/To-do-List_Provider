
import 'package:flutter/material.dart';
import 'package:toddo_provider/logic/view_models/authentication.dart';
import 'package:toddo_provider/screens/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.login,
                    size: 80,
                  ),
                  const Text(
                    'Login',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Login into your account',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.email),
                      hintText: "enter your email",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter email";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.security),
                        hintText: "enter your password",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your password";
                        }
                        return null;
                      }),
                  ElevatedButton(
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                      child: Text(
                        "SignIn",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    onPressed: () {
                      String email = _emailController.text.trim();
                      String password = _passwordController.text.trim();
                      Authentication().loginWithEmailPassword(email, password);
                    },
                  ),
                  InkWell(
                      onTap: () {Navigator.push(context, MaterialPageRoute(builder:(context)=> const SignupPage()));},
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                        child: const Text('don t have an account? create'),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

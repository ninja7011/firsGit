import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test1/components/text_form.dart';

import '../components/component.dart';

const textStyle = TextStyle(color: Colors.white);

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passController = TextEditingController();
  bool password = true;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Welcome My App',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextForm(
                  prefix: Icons.email,
                  label: 'Enter Email Address',
                  controller: emailController,
                  textType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email Address must be empty ';
                    } else
                      return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextForm(
                  pressed: (){
                    setState(() {
                      password = !password;
                    });
                  },
                  password: password,
                  prefix: Icons.lock,
                  suffix: password ? Icons.visibility : Icons.visibility_off,
                  label: 'Enter Password',
                  controller: passController,
                  textType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password must be empty ';
                    } else
                      return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'Forget The Password ',
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Reset password',
                        ))
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: DefaultButton(
                        color: Colors.red,
                        title: 'SIGN UP ',
                        pressed: () {
                          if (formKey.currentState!.validate()) {}
                        },
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Expanded(
                      child: DefaultButton(
                        color: Colors.green,
                        title: 'LOGIN ',
                        pressed: () {
                          if (formKey.currentState!.validate()) {}
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

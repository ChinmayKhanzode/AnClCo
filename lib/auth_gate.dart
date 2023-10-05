import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

var _firebase = FirebaseAuth.instance;

class AuthGate extends StatefulWidget {
  AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  bool _signupState = false;

  final _form = GlobalKey<FormState>();

  String _email = "";

  String _password = "";

  String _username = "";

  var _isAuthenticating = false;

  void _onLogin() async {
    bool isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    try {
      setState(() {
        _isAuthenticating = true;
      });
      var userCredential = await _firebase.signInWithEmailAndPassword(
          email: _email, password: _password);
      print(userCredential);
    } on FirebaseAuthException catch (error) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.message!)));
    }
    setState(() {
      _isAuthenticating = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Form(
        key: _form,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(label: Text("Email Address")),
              keyboardType: TextInputType.emailAddress,
              textCapitalization: TextCapitalization.none,
              validator: (value) {
                if (value == null ||
                    !value.contains("@") ||
                    value.trim().isEmpty) {
                  return "Invalid Email address";
                }
                return null;
              },
              onSaved: (newValue) => _email = newValue!,
            ),
            TextFormField(
              decoration: InputDecoration(label: Text("Password")),
              autocorrect: false,
              obscureText: true,
              validator: (value) {
                if (value == null || value.length < 6 || value.trim().isEmpty) {
                  return "Wrong Password";
                }
                return null;
              },
              onSaved: (newValue) => _password = newValue!,
            ),
            if (_isAuthenticating) CircularProgressIndicator(),
            if (!_isAuthenticating)
              ElevatedButton(
                  onPressed: () => _onLogin(),
                  child: Text("Login", style: TextStyle(color: Colors.black)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Theme.of(context).colorScheme.primaryContainer,
                  )),
            if (!_isAuthenticating)
              TextButton(
                onPressed: () {
                  setState(() {
                    _signupState = true;
                  });
                },
                child: Text("Create an Acount"),
              )
          ],
        ));

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome to",style: TextStyle(fontSize: 25,),),
            Text("AnClCo",style: TextStyle(fontSize: 25)),
            SizedBox(height: 50,),
            SingleChildScrollView(
              child: Column(children: [
                Card(
                  margin: EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    child:
                        Padding(padding: const EdgeInsets.all(16), child: content),
                  ),
                )
              ]),
            ),
          ],
        ),
      ),
    );
    ;
  }
}

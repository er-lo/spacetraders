import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({
    super.key,
  });

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Sign Up"),
        TextButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, '/sign_in', (route) => false );
            },
            child: Text("already have an account?"))
      ],
    ),
  );
}
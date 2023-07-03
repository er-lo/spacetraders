import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({
    super.key,
  });

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Sign In?"),
        TextButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, '/register_faction', (route) => false );
            },
            child: Text("already have an account?"))
      ],
    ),
  );
}
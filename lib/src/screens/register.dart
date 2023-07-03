import 'package:flutter/material.dart';
import '../api/factions_api.dart';
import '../api/status_api.dart';

import '../api/models/status.dart';
import '../api/models/faction.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    super.key,
  });

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  late Future<Status> futureStatus;
  late Future<List<Faction>> futureFactions;

  @override
  void initState() {
    super.initState();
    futureStatus = fetchStatus();
    futureFactions = fetchAllFactions();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Create your agent"),
          const Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Text("Call Sign"),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  flex: 4,
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Call Sign'
                    ),
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Text("Faction"),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  flex: 4,
                  child: Text("hello"),
                ),
              ],
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false );
              },
              child: Text("Have an Account?"))
        ],
      ),
    ),
  );
}
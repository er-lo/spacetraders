import 'package:flutter/material.dart';
import '../api/models/faction.dart';
import '../api/factions_api.dart';

class SplashPageScreen extends StatefulWidget {
  const SplashPageScreen({
    super.key,
  });

  @override
  State<SplashPageScreen> createState() => _SplashPageScreenState();
}

class _SplashPageScreenState extends State<SplashPageScreen> {


  late Future<List<Faction>> futureFactions;
  late List<Faction> factionsList;

  Future<List<Faction>> callFactions() async {
    factionsList = await fetchAllFactions();
    return fetchAllFactions();
  }

  @override
  void initState()  {
    super.initState();
    futureFactions = fetchAllFactions();
    callFactions();
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(
            flex: 3,
            child: Center(
              child: Text(
                "SPACE TRADERS",
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(width/1.5, 32.0),
                  ),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context, '/sign_in', (route) => false );
                  },
                  child: const Text("Sign In"),
                ),
                const SizedBox(height: 24.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(width/1.5, 32.0),
                  ),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context, '/register_faction', (route) => false, arguments: FactionList(factionsList) );
                  },
                  child: const Text("Register"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
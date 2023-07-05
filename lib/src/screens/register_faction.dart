import 'package:flutter/material.dart';
import '../api/models/faction.dart';

class RegisterFactionScreen extends StatefulWidget {
  const RegisterFactionScreen({
    super.key,
  });

  @override
  State<RegisterFactionScreen> createState() => _RegisterFactionScreenState();
}

class _RegisterFactionScreenState extends State<RegisterFactionScreen> {

  late int selectedListItem;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as FactionList;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 80.0),
          const Text("Choose a starting faction."),
          const SizedBox(height: 16.0),
          Expanded(
            flex: 11,
            child: ListView.builder(
              itemCount: args.factionsList.length,
              itemBuilder: (context, index) {
                Faction faction = args.factionsList[index];
                return factionListItem(faction);
              },
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                const SizedBox(height: 16.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(width/1.5, 32.0),
                  ),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context, '/register', (route) => false );
                  },
                  child: const Text("Next"),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/', (route) => false);
                    },
                    child: const Text("Already have an account? Click here to sign in.")),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget factionListItem(Faction faction) {

    List<String> listStrings = [];
    for (var element in faction.traits) {
      if (element == faction.traits.last) {
        listStrings.add(element.name.toString());
      } else {
        listStrings.add(element.name.toString() + ', ');
      }
    }
    String traitsListString = listStrings.join();

    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 2.0),
      child: GestureDetector(
        child: Card(
          shape: const RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  faction.name,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  traitsListString,
                  style: const TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(faction.description),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    faction.isRecruiting ? const Text("Currently Recruiting", style: TextStyle(color: Colors.green),) : const Text("Currently Not Recruiting", style: TextStyle(color: Colors.red),),
                    const SizedBox(width: 4.0,)
                  ],
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}
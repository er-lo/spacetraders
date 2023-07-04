import 'package:flutter/material.dart';
import '../api/factions_api.dart';
import '../api/models/faction.dart';

class RegisterFactionScreen extends StatefulWidget {
  const RegisterFactionScreen({
    super.key,
  });

  @override
  State<RegisterFactionScreen> createState() => _RegisterFactionScreenState();
}

class _RegisterFactionScreenState extends State<RegisterFactionScreen> {

  late Future<List<Faction>> futureFactions;

  @override
  void initState() {
    super.initState();
    futureFactions = fetchAllFactions();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 11,
          child: FutureBuilder(
            future: futureFactions,
            builder: (context, snapshot) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                Faction faction = snapshot.data![index];
                  return factionListItem(faction);
                },
              );
            },
          ),
        ),
        Expanded(
          flex: 1,
          child: TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false );
              },
              child: const Text("Have an Account?")),
        )
      ],
    ),
  );

  Widget factionListItem(Faction faction) {

    List<String> listStrings = [];
    for (var element in faction.traits) {
      if (element == faction.traits.last) {
        listStrings.add(element.name.toString());
      } else {
        listStrings.add('${element.name.toString()}, ');
      }
    }
    String traitsListString = listStrings.join();

    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 2.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(faction.name),
              const SizedBox(height: 4.0),
              Text(traitsListString),
              const SizedBox(height: 4.0),
              Text(faction.description),
              const SizedBox(height: 4.0),
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
    );
  }
}
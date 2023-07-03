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
              child: Text("Have an Account?")),
        )
      ],
    ),
  );

  Widget factionListItem(Faction faction) {

    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 2.0),
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: ListTile(
                title: Text(faction.name),
                subtitle: Text(faction.description),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  faction.isRecruiting ? const Text("Currently Recruiting") : const Text("Not Currently Recruiting")
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}
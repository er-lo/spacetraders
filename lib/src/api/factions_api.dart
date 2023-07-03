import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'models/faction.dart';

const apiToken = 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZGVudGlmaWVyIjoiRUFSTEdSRVkiLCJ2ZXJzaW9uIjoidjIiLCJyZXNldF9kYXRlIjoiMjAyMy0wNi0yNCIsImlhdCI6MTY4ODIzMjE2NCwic3ViIjoiYWdlbnQtdG9rZW4ifQ.bvxCOtQnyczG7HKK_X3CEB6GuvYLmvc192gTlKVb6gKgXjxvD5VyPsmCIuLGAje5OlO6eAp1__fMKYIaElX-hueS86Rab9kHbN7vQS1MvXvgOf5N0KJ0SRX8vfi6KG5CpyIaQihwfSpo0NLnF2kG-Rv3tE8VbZ9K34oKnCYW-cayscB2DO3KH_bD97QZ_k6rR_H-4HGefCEeZjRd7FKhJ4m4TEwQ4Uu5ghPtWkWpiqbM4xMzO471ZSfI0qhZQiA7Wz3Gk-mPyUBCnGm2mSAZBAB7OPSv1Ckx7YdRRP1BFDHze8wlNnxiAMLNFCkHBsWgIxEi7S2k3aZ8CTUc_F1t3g';

//need token to get factions

Future<List<Faction>> fetchAllFactions() async {
  final response = await http.get(Uri.parse('https://api.spacetraders.io/v2/factions?limit=20'), headers: {HttpHeaders.authorizationHeader: apiToken});

  if (response.statusCode == 200) {

    var json = jsonDecode(response.body);
    var tempFactionsList = json['data'] as List;
    List<Faction> factionsList = tempFactionsList.map((i) => Faction.fromJson(i)).toList();

    return factionsList;

  } else {
    throw Exception("Failed to load status.");
  }
}

Future<Faction> fetchSpecificFaction(String factionSymbol) async {
  final response = await http.get(Uri.parse('https://api.spacetraders.io/v2/factions/$factionSymbol'), headers: {HttpHeaders.authorizationHeader: apiToken});

  if (response.statusCode == 200) {
    return Faction.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Failed to load status.");
  }
}
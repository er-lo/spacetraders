class Faction {
  final String symbol;
  final String name;
  final String description;
  final String headquarters;
  final List<FactionTrait> traits;
  final bool isRecruiting;

  Faction(this.symbol, this.name, this.description, this.headquarters, this.traits, this.isRecruiting);

  factory Faction.fromJson(Map<String, dynamic> json) {
    var tempFactionTraitList = json['traits'] as List;
    List<FactionTrait> factionTraitList = tempFactionTraitList.map((i) => FactionTrait.fromJson(i)).toList();

    return Faction(json['symbol'], json['name'], json['description'], json['headquarters'], factionTraitList, json['isRecruiting']);
  }

  Map<String, dynamic> toJson() => {
    'symbol': symbol,
    'name': name,
    'description': description,
    'headquarters': headquarters,
    'traits': traits,
    'isRecruiting': isRecruiting,
  };
}

class FactionList {

}

class FactionTrait {
  final String symbol;
  final String name;
  final String description;

  FactionTrait(this.symbol, this.name, this.description);

  FactionTrait.fromJson(Map<String, dynamic> json)
      : symbol = json['symbol'],
        name = json['name'],
        description = json['description'];

  Map<String, dynamic> toJson() => {
    'symbol': symbol,
    'name': name,
    'description': description,
  };
}
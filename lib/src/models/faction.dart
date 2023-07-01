import 'faction_trait.dart';

class Faction {
  final String symbol;
  final String name;
  final String description;
  final String headquarters;
  final List<FactionTrait> traits;
  final bool isRecruiting;

  Faction(this.symbol, this.name, this.description, this.headquarters, this.traits, this.isRecruiting);

  Faction.fromJson(Map<String, dynamic> json)
      : symbol = json['symbol'],
        name = json['name'],
        description = json['description'],
        headquarters = json['headquarters'],
        traits = json['traits'],
        isRecruiting = json['isRecruiting'];

  Map<String, dynamic> toJson() => {
    'symbol': symbol,
    'name': name,
    'description': description,
    'headquarters': headquarters,
    'traits': traits,
    'isRecruiting': isRecruiting,
  };
}
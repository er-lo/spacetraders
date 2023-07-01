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
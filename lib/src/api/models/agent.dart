class Agent {
  final String accountId;
  final String symbol;
  final String headquarters;
  final int credits;
  final String startingFaction;

  Agent(this.accountId, this.symbol, this.headquarters, this.credits, this.startingFaction);

  Agent.fromJson(Map<String, dynamic> json)
      : accountId = json['accountId'],
        symbol = json['symbol'],
        headquarters = json['headquarters'],
        credits = json['credits'],
        startingFaction = json['startingFaction'];

  Map<String, dynamic> toJson() => {
    'accountId': accountId,
    'symbol': symbol,
    'headquarters': headquarters,
    'credits': credits,
    'startingFaction': startingFaction,
  };
}
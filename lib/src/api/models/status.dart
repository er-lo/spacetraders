class Status {
  final String status;
  final String version;
  final String resetDate;
  final String description;
  final Stats stats;
  final Leaderboards leaderboards;
  final ServerResets serverResets;
  final List<Announcements> announcements;
  final List<Links> links;

  Status(this.status, this.version, this.resetDate, this.description, this.stats, this.leaderboards, this.serverResets, this.announcements, this.links);

  Status.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        version = json['version'],
        resetDate = json['resetDate'],
        description = json['description'],
        stats = json['stats'],
        leaderboards = json['leaderboards'],
        serverResets = json['serverResets'],
        announcements = json['announcements'],
        links = json['links'];

  Map<String, dynamic> toJson() => {
    'status': status,
    'version': version,
    'resetDate': resetDate,
    'description': description,
    'stats': stats,
    'leaderboards': leaderboards,
    'serverResets': serverResets,
    'announcements': announcements,
    'links': links,
  };
}

class Stats {
  final int agents;
  final int ships;
  final int systems;
  final int waypoints;

  Stats(this.agents, this.ships, this.systems, this.waypoints);

  Stats.fromJson(Map<String, dynamic> json)
      : agents = json['agents'],
        ships = json['ships'],
        systems = json['systems'],
        waypoints = json['waypoints'];

  Map<String, dynamic> toJson() => {
    'agents': agents,
    'ships': ships,
    'systems': systems,
    'waypoints': waypoints,
  };
}

class Leaderboards {
  final List<MostCreditAgents> mostCredits ;
  final List<MostSubmittedCharts> mostSubmittedCharts;

  Leaderboards(this.mostCredits, this.mostSubmittedCharts);

  Leaderboards.fromJson(Map<String, dynamic> json)
      : mostCredits = json['mostCredits'],
        mostSubmittedCharts = json['mostSubmittedCharts'];

  Map<String, dynamic> toJson() => {
    'mostCredits': mostCredits,
    'mostSubmittedCharts': mostSubmittedCharts,
  };
}

class MostCreditAgents {
  final String agentSymbol;
  final int credits;

  MostCreditAgents(this.agentSymbol, this.credits);

  MostCreditAgents.fromJson(Map<String, dynamic> json)
      : agentSymbol = json['agentSymbol'],
        credits = json['credits'];

  Map<String, dynamic> toJson() => {
    'agentSymbol': agentSymbol,
    'credits': credits,
  };
}

class MostSubmittedCharts {
  final String agentSymbol;
  final int chartCount;

  MostSubmittedCharts(this.agentSymbol, this.chartCount);

  MostSubmittedCharts.fromJson(Map<String, dynamic> json)
      : agentSymbol = json['agentSymbol'],
        chartCount = json['chartCount'];

  Map<String, dynamic> toJson() => {
    'agentSymbol': agentSymbol,
    'chartCount': chartCount,
  };
}

class ServerResets {
  final String next;
  final String frequency;

  ServerResets(this.next, this.frequency);

  ServerResets.fromJson(Map<String, dynamic> json)
      : next = json['next'],
        frequency = json['frequency'];

  Map<String, dynamic> toJson() => {
    'next': next,
    'frequency': frequency,
  };
}

class Announcements {
  final String title;
  final String body;

  Announcements(this.title, this.body);

  Announcements.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        body = json['body'];

  Map<String, dynamic> toJson() => {
    'title': title,
    'body': body,
  };
}

class Links {
  final String name;
  final String url;

  Links(this.name, this.url);

  Links.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        url = json['url'];

  Map<String, dynamic> toJson() => {
    'name': name,
    'url': url,
  };
}
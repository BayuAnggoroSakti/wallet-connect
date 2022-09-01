class SessionData {
  String topic;
  String name;
  String icons;
  List<dynamic> accounts;

  SessionData({
    required this.topic,
    required this.name,
    required this.icons,
    required this.accounts,
  });
}

class Session {
  List<SessionData> data;

  Session({
    required this.data,
  });
}

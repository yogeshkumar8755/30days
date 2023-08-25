class GetUserData {
  int? userId;
  int? id;
  String? title;
  String? body;

  GetUserData({this.userId, this.id, this.title, this.body});

  factory GetUserData.from(Map<String, dynamic> json) {
    final userId = json['userId'] as int;
    final id = json['id'] as int;
    final title = json['title'] as String;
    final body = json['body'] as String;

    return GetUserData(userId: userId, id: id, title: title, body: body);
  }
}

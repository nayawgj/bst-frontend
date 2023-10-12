class DebateModel {
  final String title, author, topic, category;
  final int type;

  //fromJson
  DebateModel.fromJson(Map<String, dynamic> json)
      : title = json["bookTitle"],
        author = json["bookAuthor"],
        topic = json["debateTopic"] ?? "토론 제목 없음",
        type = json["debateType"],
        category = json["categoryName"];
}

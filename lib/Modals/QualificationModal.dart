class QualificationItem {
  String qid;
  String category;
  String qualification;

  QualificationItem({this.qid, this.category, this.qualification});

  factory QualificationItem.fromJson(Map<String, dynamic> json) {
    return QualificationItem(
        qid: json["_id"] as String,
        category: json["category"] as String,
        qualification: json["qualification"] as String);
  }
}

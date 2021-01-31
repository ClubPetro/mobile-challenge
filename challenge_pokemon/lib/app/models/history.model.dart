class HistoryModel {
  String history;

  HistoryModel({
    this.history,
  });

  Map<String, dynamic> toMap() => {
        "history": history,
      };

  factory HistoryModel.fromMap(Map<String, dynamic> json) => HistoryModel(
        history: json["history"],
      );
}

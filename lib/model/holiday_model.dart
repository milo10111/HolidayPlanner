class HolidayModel {
  String name;
  DateTime startDate;
  DateTime endDate;
  String photoURL;

  HolidayModel({
    required this.name,
    required this.startDate,
    required this.endDate,
    this.photoURL = "https://picsum.photos/seed/picsum/200/300",
  });

  static HolidayModel example() {
    return HolidayModel(
      name: "Holiday in Paris",
      startDate: DateTime.parse("2022-12-24"),
      endDate: DateTime.parse("2022-12-27"),
    );
  }

  factory HolidayModel.fromJson(Map<String, dynamic> json) {
    return HolidayModel(
      name: json['name'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      photoURL: json['photoURL'] ?? "https://picsum.photos/seed/picsum/200/300",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'photoURL': photoURL,
    };
  }
}

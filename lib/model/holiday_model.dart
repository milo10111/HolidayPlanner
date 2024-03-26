class HolidayModel {
  String id;
  String name;
  DateTime startDate;
  DateTime endDate;

  HolidayModel({
    required this.id,
    required this.name,
    required this.startDate,
    required this.endDate,
  });

  static HolidayModel example() {
    return HolidayModel(
      id: "1",
      name: "Holiday in Paris",
      startDate: DateTime.parse("2022-12-24"),
      endDate: DateTime.parse("2022-12-27"),
    );
  }
}

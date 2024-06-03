class HolidayModel {
  String name;
  DateTime startDate;
  DateTime endDate;
  String imageURL;

  HolidayModel({
    required this.name,
    required this.startDate,
    required this.endDate,
    this.imageURL = "https://picsum.photos/200",
  });

  static HolidayModel example() {
    return HolidayModel(
      name: "Holiday in Paris",
      startDate: DateTime.parse("2022-12-24"),
      endDate: DateTime.parse("2022-12-27"),
    );
  }

  static List<HolidayModel> exampleList() {
    return [
      HolidayModel(
        name: "Holiday in Paris",
        startDate: DateTime.parse("2022-12-24"),
        endDate: DateTime.parse("2022-12-27"),
      ),
      HolidayModel(
        name: "Holiday in London",
        startDate: DateTime.parse("2022-12-24"),
        endDate: DateTime.parse("2022-12-27"),
      ),
      HolidayModel(
        name: "Holiday in New York",
        startDate: DateTime.parse("2022-12-24"),
        endDate: DateTime.parse("2022-12-27"),
      ),
    ];
  }
}

class EventModel {
  final String title;
  final String description;
  final DateTime date;
  final String location;
  final String image;

  EventModel({
    required this.title,
    required this.description,
    required this.date,
    required this.location,
    required this.image,
  });

  static List<EventModel> exampleList() {
    return [
      EventModel(
        title: "Visit the Eiffel Tower",
        description: "Visit the Eiffel Tower and enjoy the view of Paris.",
        date: DateTime.parse("2022-12-25 20:00"),
        location: "Eiffel Tower, Paris",
        image: "assets/eiffel_tower.jpg",
      ),
      EventModel(
        title: "Visit the Louvre Museum",
        description: "Visit the Louvre Museum and see the Mona Lisa.",
        date: DateTime.parse("2022-12-26 15:00"),
        location: "Louvre Museum, Paris",
        image: "assets/louvre_museum.jpg",
      ),
      EventModel(
        title: "Visit Notre-Dame Cathedral",
        description:
            "Visit Notre-Dame Cathedral and see the beautiful architecture.",
        date: DateTime.parse("2022-12-27 11:00"),
        location: "Notre-Dame Cathedral, Paris",
        image: "assets/notre_dame_cathedral.jpg",
      ),
    ];
  }
}

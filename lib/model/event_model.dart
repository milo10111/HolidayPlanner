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
    this.image = "https://picsum.photos/200",
  });

  static toJson(EventModel event) {
    return {
      "title": event.title,
      "description": event.description,
      "date": event.date.toString(),
      "location": event.location,
      "image": event.image,
    };
  }

  static fromJson(event) {
    return EventModel(
      title: event["title"],
      description: event["description"],
      date: DateTime.parse(event["date"]),
      location: event["location"],
      image: event["image"],
    );
  }

  static List<EventModel> exampleList() {
    return [
      EventModel(
        title: "Eiffel Tower Visit",
        description:
            "Visit the iconic Eiffel Tower and enjoy the breathtaking view of Paris.",
        date: DateTime(2024, 10, 24, 10, 0),
        location: "Eiffel Tower, Paris",
        image: "https://example.com/eiffel_tower.jpg",
      ),
      EventModel(
        title: "Louvre Museum Tour",
        description:
            "Explore the world-renowned Louvre Museum and admire its vast collection of art.",
        date: DateTime(2024, 10, 24, 14, 0),
        location: "Louvre Museum, Paris",
        image: "https://example.com/louvre_museum.jpg",
      ),
      EventModel(
        title: "Seine River Cruise",
        description:
            "Take a relaxing cruise along the Seine River and enjoy the scenic views of Paris.",
        date: DateTime(2024, 10, 25, 10, 0),
        location: "Seine River, Paris",
        image: "https://example.com/seine_river.jpg",
      ),
      EventModel(
        title: "Notre-Dame Cathedral Visit",
        description:
            "Visit the famous Notre-Dame Cathedral and admire its stunning architecture.",
        date: DateTime(2024, 10, 25, 14, 0),
        location: "Notre-Dame Cathedral, Paris",
        image: "https://example.com/notre_dame_cathedral.jpg",
      ),
      EventModel(
        title: "Montmartre Art Walk",
        description:
            "Take a stroll through the artistic neighborhood of Montmartre and discover its charming streets.",
        date: DateTime(2024, 10, 26, 10, 0),
        location: "Montmartre, Paris",
        image: "https://example.com/montmartre_art_walk.jpg",
      ),
    ];
  }
}

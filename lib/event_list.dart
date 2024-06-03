import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';
import 'model/event_model.dart';

class EventList extends StatelessWidget {
  final List<EventModel> events;
  const EventList({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Timeline.tileBuilder(
        theme: TimelineThemeData(
          nodePosition: 0.25,
        ),
        builder: TimelineTileBuilder.connected(
          connectionDirection: ConnectionDirection.before,
          itemCount: events.length,
          oppositeContentsBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  events[index].date.toString().substring(0, 16),
                ));
          },
          contentsBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: ListTile(
                  title: Text(events[index].title),
                  subtitle: Text(events[index].description),
                ),
              ),
            );
          },
          indicatorBuilder: (context, index) {
            return DotIndicator(
              color: theme.colorScheme.primary,
            );
          },
          connectorBuilder: (context, index, type) {
            return SolidLineConnector(color: theme.colorScheme.primary);
          },
        ));
  }
}

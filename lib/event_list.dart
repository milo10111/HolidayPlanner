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
        builder: TimelineTileBuilder.connected(
      connectionDirection: ConnectionDirection.before,
      itemCount: events.length,
      oppositeContentsBuilder: (context, index) {
        return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              events[index].date.toString().substring(10, 16),
            ));
      },
      contentsBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: ListTile(
              title: Text(events[index].title),
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

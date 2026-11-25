import 'package:flutter/material.dart';
import '../models/event.dart';
import '../widgets/event_card.dart';

class MyEventsScreen extends StatelessWidget {
  final List<Event> events;
  final void Function(Event) onToggleRsvp;
  final void Function(Event) onOpenEvent;

  const MyEventsScreen({
    super.key,
    required this.events,
    required this.onToggleRsvp,
    required this.onOpenEvent,
  });

  @override
  Widget build(BuildContext context) {
    final myEvents = events.where((e) => e.isRsvped).toList();

    if (myEvents.isEmpty) {
      return const Center(
        child: Text("You haven't RSVP'd to any events yet."),
      );
    }

    return ListView.builder(
      itemCount: myEvents.length,
      itemBuilder: (context, index) {
        final event = myEvents[index];
        return EventCard(
          event: event,
          onTap: () => onOpenEvent(event),
          onRsvp: () => onToggleRsvp(event),
        );
      },
    );
  }
}
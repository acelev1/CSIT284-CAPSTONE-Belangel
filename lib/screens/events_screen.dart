import 'package:flutter/material.dart';
import '../models/event.dart';
import '../widgets/event_card.dart';

class EventsScreen extends StatelessWidget {
  final List<Event> events;
  final void Function(Event) onToggleRsvp;
  final void Function(Event) onOpenEvent;

  const EventsScreen({
    super.key,
    required this.events,
    required this.onToggleRsvp,
    required this.onOpenEvent,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        final event = events[index];
        return EventCard(
          event: event,
          onTap: () => onOpenEvent(event),
          onRsvp: () => onToggleRsvp(event),
        );
      },
    );
  }
}
import 'package:flutter/material.dart';
import '../models/event.dart';
import '../widgets/rsvp_button.dart';

class EventDetailScreen extends StatefulWidget {
  final Event event;
  final void Function(Event) onToggleRsvp;

  const EventDetailScreen({
    super.key,
    required this.event,
    required this.onToggleRsvp,
  });

  @override
  State<EventDetailScreen> createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final event = widget.event;
    return Scaffold(
      appBar: AppBar(title: const Text('Event Details')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Chip(label: Text(event.category)),
            const SizedBox(height: 12),
            Text(event.title, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
            Row(children: [
              const Icon(Icons.calendar_today, size: 18),
              const SizedBox(width: 8),
              Text(event.formattedDate),
            ]),
            const SizedBox(height: 8),
            Row(children: [
              const Icon(Icons.location_on, size: 18),
              const SizedBox(width: 8),
              Text(event.location),
            ]),
            const SizedBox(height: 8),
            Row(children: [
              const Icon(Icons.people, size: 18),
              const SizedBox(width: 8),
              Text('${event.attendeeCount} attending'),
            ]),
            const SizedBox(height: 20),
            Text(event.description),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: RsvpButton(
                isRsvped: event.isRsvped,
                onPressed: () {
                  widget.onToggleRsvp(event);
                  setState(() {});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
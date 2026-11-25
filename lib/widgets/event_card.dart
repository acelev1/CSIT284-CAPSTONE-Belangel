import 'package:flutter/material.dart';
import '../models/event.dart';
import 'rsvp_button.dart';

class EventCard extends StatelessWidget {
  final Event event;
  final VoidCallback onTap;
  final VoidCallback onRsvp;

  const EventCard({
    super.key,
    required this.event,
    required this.onTap,
    required this.onRsvp,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(event.category,
                  style: Theme.of(context).textTheme.labelMedium),
              const SizedBox(height: 4),
              Text(event.title,
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              Row(children: [
                const Icon(Icons.calendar_today, size: 16),
                const SizedBox(width: 6),
                Expanded(child: Text(event.formattedDate)),
              ]),
              const SizedBox(height: 4),
              Row(children: [
                const Icon(Icons.location_on, size: 16),
                const SizedBox(width: 6),
                Expanded(child: Text(event.location)),
              ]),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${event.attendeeCount} attending'),
                  RsvpButton(isRsvped: event.isRsvped, onPressed: onRsvp),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
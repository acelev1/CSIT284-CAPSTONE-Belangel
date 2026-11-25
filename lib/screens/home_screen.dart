import 'package:flutter/material.dart';
import '../models/dummy_events.dart';
import '../models/event.dart';
import 'event_detail_screen.dart';
import 'events_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Event> _events = dummyEvents;

  void _toggleRsvp(Event event) {
    setState(() {
      event.isRsvped = !event.isRsvped;
      event.attendeeCount += event.isRsvped ? 1 : -1;
    });
  }

  void _openEvent(Event event) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => EventDetailScreen(
          event: event,
          onToggleRsvp: _toggleRsvp,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('School Events')),
      body: EventsScreen(
        events: _events,
        onToggleRsvp: _toggleRsvp,
        onOpenEvent: _openEvent,
      ),
    );
  }
}
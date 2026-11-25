import 'package:flutter/material.dart';
import '../models/dummy_events.dart';
import '../models/event.dart';
import 'event_detail_screen.dart';
import 'events_screen.dart';
import 'my_events_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Event> _events = dummyEvents;
  int _currentIndex = 0;

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
  final screens = [
    EventsScreen(
      events: _events,
      onToggleRsvp: _toggleRsvp,
      onOpenEvent: _openEvent,
    ),
    MyEventsScreen(
      events: _events,
      onToggleRsvp: _toggleRsvp,
      onOpenEvent: _openEvent,
    ),
  ];

  return Scaffold(
    appBar: AppBar(
      title: Text(_currentIndex == 0 ? 'School Events' : 'My Events'),
    ),
    body: screens[_currentIndex],
    bottomNavigationBar: NavigationBar(
      selectedIndex: _currentIndex,
      onDestinationSelected: (i) => setState(() => _currentIndex = i),
      destinations: const [
        NavigationDestination(icon: Icon(Icons.event), label: 'Events'),
        NavigationDestination(icon: Icon(Icons.bookmark), label: 'My Events'),
      ],
    ),
  );
}
}
import 'package:flutter/material.dart';
import 'models/dummy_events.dart';
import 'screens/events_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'School Event RSVP',
      theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(title: const Text('School Events')),
        body: EventsScreen(
          events: dummyEvents,
          onToggleRsvp: (_) {},
          onOpenEvent: (_) {},
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class RsvpButton extends StatelessWidget {
  final bool isRsvped;
  final VoidCallback onPressed;

  const RsvpButton({super.key, required this.isRsvped, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return isRsvped
        ? OutlinedButton.icon(
            onPressed: onPressed,
            icon: const Icon(Icons.check),
            label: const Text('Going'),
          )
        : FilledButton(onPressed: onPressed, child: const Text('RSVP'));
  }
}
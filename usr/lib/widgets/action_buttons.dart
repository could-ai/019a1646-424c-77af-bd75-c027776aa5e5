import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.black.withOpacity(0.5),
          child: const Icon(Icons.arrow_upward, color: Colors.white),
        ),
        const SizedBox(height: 10),
        FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.black.withOpacity(0.5),
          child: const Icon(Icons.handyman, color: Colors.white),
        ),
      ],
    );
  }
}

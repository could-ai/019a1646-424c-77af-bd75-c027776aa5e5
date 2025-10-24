import 'package:couldai_user_app/widgets/action_buttons.dart';
import 'package:couldai_user_app/widgets/joystick.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200], // Sky color
      body: Stack(
        children: [
          // Game world
          Container(
            color: Colors.green[400], // Ground color
          ),
          // UI Controls
          const Positioned(
            left: 50,
            bottom: 50,
            child: Joystick(),
          ),
          const Positioned(
            right: 50,
            bottom: 50,
            child: ActionButtons(),
          ),
        ],
      ),
    );
  }
}

import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _controller = ConfettiController();
  bool isPlaying = false;
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Scaffold(
            // body: Center(
            //   child: MaterialButton(
            //     onPressed: () {
            //       if (isPlaying) {
            //         _controller.stop();
            //       } else {
            //         _controller.play();
            //       }
            //       isPlaying = !isPlaying;
            //     },
            //     child: Text('Confetti'),
            //     color: Colors.deepPurple[200],
            //   ),
            // ),
            ),
        ConfettiWidget(
            blastDirection: -pi / 2,
            emissionFrequency: 0.1,
            numberOfParticles: 100,
            maxBlastForce: 1000,
            minBlastForce: 80,
            gravity: 1,
            confettiController: _controller),
      ],
    );
  }
}

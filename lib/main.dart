import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  Future<void> playSound(int noteNum) async {
    final player = AudioPlayer();
    await player.play(AssetSource('note$noteNum.wav'));
  }

  Expanded buildKey(int num, colour) {
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith((states) => colour),
        ),
        onPressed: () async {
          playSound(num);
        },
        child: Container(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(1, Colors.teal),
              buildKey(2, Colors.amber),
              buildKey(3, Colors.deepOrange),
              buildKey(4, Colors.blue),
              buildKey(5, Colors.deepPurple),
              buildKey(6, Colors.red),
              buildKey(7, Colors.brown),
            ],
          ),
        ),
      ),
    );
  }
}

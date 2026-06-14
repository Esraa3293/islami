import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami_new/models/RadioResponse.dart';

class RadioItem extends StatelessWidget {
  final Radios radio;
  final AudioPlayer audioPlayer;

  const RadioItem({required this.radio, required this.audioPlayer, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          radio.name?.trim().replaceAll("-", " ") ?? "",
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () async {
                await audioPlayer.play(UrlSource(radio.radioUrl ?? ""));
              },
              icon: const Icon(Icons.play_arrow),
              color: Theme.of(context).colorScheme.primary,
              iconSize: 30,
            ),
            const SizedBox(
              width: 7,
            ),
            IconButton(
              onPressed: () async {
                await audioPlayer.pause();
              },
              icon: const Icon(Icons.pause),
              color: Theme.of(context).colorScheme.primary,
              iconSize: 30,
            )
          ],
        )
      ],
    );
  }
}

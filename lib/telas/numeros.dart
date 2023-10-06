import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Numeros extends StatefulWidget {
  @override
  _NumerosState createState() => _NumerosState();
}

class _NumerosState extends State<Numeros> {
  final audioPlayer = AudioPlayer();

  void _executar(String nomeAudio) {
    audioPlayer.play(AssetSource("audios/${nomeAudio}.mp3"));
  }

  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.height;

    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: MediaQuery.of(context).size.aspectRatio * 2,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            _executar("1");
          },
          child: Image.asset("assets/imagens/1.png"),
        ),
        GestureDetector(
          onTap: () {
            _executar("2");
          },
          child: Image.asset("assets/imagens/2.png"),
        ),
        GestureDetector(
          onTap: () {
            _executar("3");
          },
          child: Image.asset("assets/imagens/3.png"),
        ),
        GestureDetector(
          onTap: () {
            _executar("4");
          },
          child: Image.asset("assets/imagens/4.png"),
        ),
        GestureDetector(
          onTap: () {
            _executar("5");
          },
          child: Image.asset("assets/imagens/5.png"),
        ),
        GestureDetector(
          onTap: () {
            _executar("6");
          },
          child: Image.asset("assets/imagens/6.png"),
        )
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:video_player/video_player.dart';

class Videos extends StatefulWidget {
  @override
  _VideosState createState() => _VideosState();
}

class _VideosState extends State<Videos> {
  final audioPlayer = AudioPlayer();
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://r13---sn-pmcg-bg0k.googlevideo.com/videoplayback?expire=1696651974&ei=ZoYgZaTpI8bU8wTJ2aygCA&ip=2607%3A5300%3A60%3A612d%3A9786%3Aa7ed%3A92cc%3A54d1&id=o-ABKOwUgGdW8A0AIo9hEKywNgGlAbwHU84Ax8EY68OYFF&itag=22&source=youtube&requiressl=yes&spc=UWF9f48f1DIsDcGGVhjKLQNJGwl79hY&vprv=1&svpuc=1&mime=video%2Fmp4&cnr=14&ratebypass=yes&dur=846.460&lmt=1673402599515943&fexp=24007246,24350018&beids=24350018&c=ANDROID&txp=4432434&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cspc%2Cvprv%2Csvpuc%2Cmime%2Ccnr%2Cratebypass%2Cdur%2Clmt&sig=AGM4YrMwRQIgHbHYKQNLnc1stXwH67i3zfTcH2wPvH40HpRdmgCoJIsCIQCBcxT5Q4yrYE9nj3HbWI7YkBETr9ommREInHtXK84hpA%3D%3D&redirect_counter=1&cm2rm=sn-jv2xauxaxjvh-jfcl7k&req_id=abc201d01322a3ee&cms_redirect=yes&cmsv=e&mh=II&mip=177.92.14.43&mm=29&mn=sn-pmcg-bg0k&ms=rdu&mt=1696630143&mv=m&mvi=13&pl=21&lsparams=mh,mip,mm,mn,ms,mv,mvi,pl&lsig=AG3C_xAwRgIhAJNNuR7YfgWug_iuqqHErOYMbMJejFNm4LcqaEUSv_HdAiEArPpQeVM6ko9tNbmLRbmtMdhVDrFDc6HFH1gq5-CYm7k%3D'))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  void _executar(String nomeAudio) {
    audioPlayer.play(AssetSource("audios/${nomeAudio}.mp3"));
  }

  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.height;

    return GridView.count(
      crossAxisCount: 1,
      childAspectRatio: MediaQuery.of(context).size.aspectRatio * 2,
      children: <Widget>[
        VideoPlayer(_controller),
        FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ],
    );
  }
}
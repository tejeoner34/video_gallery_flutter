import 'package:flutter/material.dart';
import 'package:video_gallery_flutter/presentations/widgets/video/video_background.dart';
import 'package:video_player/video_player.dart';

class FullScreenPlayer extends StatefulWidget {
  final String videoUrl;
  final String caption;
  const FullScreenPlayer(
      {super.key, required this.videoUrl, required this.caption});

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  late VideoPlayerController videoController;
  @override
  void initState() {
    videoController = VideoPlayerController.asset(widget.videoUrl)
      ..setVolume(0)
      ..setLooping(true);
      // ..play();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: videoController.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(strokeWidth: 2),
          );
        }

        return GestureDetector(// Widget que nos permite recibir diferentes gestos por parte del usuario
          onTap: () {
            videoController.value.isPlaying
                ? videoController.pause()
                : videoController.play();
          },
          child: AspectRatio(
            aspectRatio: videoController.value.aspectRatio,
            child: Stack(
              children: [
                VideoPlayer(videoController),
                VideoBackground(stops: [0.8, 1.0]),
                Positioned(
                  bottom: 50,
                  left: 10,
                  child: _VideoCaption(caption: widget.caption),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class _VideoCaption extends StatelessWidget {
  final String caption;
  const _VideoCaption({required this.caption});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return SizedBox(
      width: deviceSize.width * 0.7,
      child: Text(caption, maxLines: 2, style: titleStyle),
    );
  }
}

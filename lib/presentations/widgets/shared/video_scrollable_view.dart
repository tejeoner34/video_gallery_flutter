import 'package:flutter/material.dart';
import 'package:video_gallery_flutter/domain/entities/video_post.dart';

class VideoScrollableView extends StatelessWidget {
  const VideoScrollableView({super.key, required this.videos});

  final List<VideoPost> videos;

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const BouncingScrollPhysics(), // esto es para el efecto de rebote cuando llega al final
      children: [
        Container(color: Colors.red,),
        Container(color: Colors.green,),
        Container(color: Colors.blue,),
      ],
    );
  }
}
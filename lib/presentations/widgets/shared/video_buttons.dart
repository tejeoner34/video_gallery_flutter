import 'package:flutter/material.dart';
import 'package:video_gallery_flutter/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost videoPost;
  const VideoButtons({super.key, required this.videoPost});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _CustomIconButton(
          icon: Icons.favorite,
          iconColor: Colors.red,
          text: 'Likes',
        ),
        _CustomIconButton(
          icon: Icons.view_agenda,
          text: 'Views',
        ),
      ],
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? color;
  const _CustomIconButton({required this.icon, required this.text, iconColor})
      : color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon, color: color),
          onPressed: () {},
        ),
        Text(text)
      ],
    );
  }
}

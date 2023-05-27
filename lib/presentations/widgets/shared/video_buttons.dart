import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:video_gallery_flutter/config/helpers/human_formats.dart';
import 'package:video_gallery_flutter/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost videoPost;
  const VideoButtons({super.key, required this.videoPost});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _CustomIconButton(
          icon: Icons.favorite,
          iconColor: Colors.red,
          value: 1600,
        ),
        const SizedBox(
          height: 20,
        ),
        const _CustomIconButton(
          icon: Icons.view_agenda,
          value: 10000,
        ),
        const SizedBox(
          height: 20,
        ),
        SpinPerfect(
          infinite: true,
          duration: const Duration(seconds: 5),
          child: const _CustomIconButton(
            icon: Icons.play_circle_outlined,
          ),
        ),
      ],
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  final IconData icon;
  final int? value;
  final Color color;
  const _CustomIconButton({required this.icon, this.value, Color? iconColor})
      : color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon, color: color),
          onPressed: () {},
        ),
        if (value != null) Text(HumanFormats.toHumanReadableNumber(value!))
      ],
    );
  }
}

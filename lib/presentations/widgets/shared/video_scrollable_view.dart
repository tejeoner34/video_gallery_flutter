import 'package:flutter/material.dart';
import 'package:video_gallery_flutter/domain/entities/video_post.dart';
import 'package:video_gallery_flutter/presentations/widgets/shared/video_buttons.dart';

class VideoScrollableView extends StatelessWidget {
  const VideoScrollableView({super.key, required this.videos});

  final List<VideoPost> videos;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      // al querer renderizar un listado, no queremos que todo se encuentre ya renderizado
      // es importante que se vaya construyendo a medida que hacemos scroll, por eso usamos el .builder
      scrollDirection: Axis.vertical,
      physics:
          const BouncingScrollPhysics(), // esto es para el efecto de rebote cuando llega al final
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final VideoPost videoPost = videos[index];
        return Stack(// el stack se usa cuando tenemos una vista en la que vamos a tener varios elementos unos encima de otros
                      // por ejemplo, un video de fondo, por encima una capa para oscurecer y unos botones
          children: [
            Positioned(
                bottom: 40,
                right: 30,
                child: VideoButtons(videoPost: videoPost))
          ],
        );
      },
    );
  }
}

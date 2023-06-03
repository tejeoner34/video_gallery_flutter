import 'package:flutter/material.dart';
import 'package:video_gallery_flutter/domain/entities/video_post.dart';
import 'package:video_gallery_flutter/domain/repository/video_post_repository.dart';

class DiscoverProvider extends ChangeNotifier {
  // El objetivo de la creación de datasources y repositories es principalmente hacer que los providers sean 
  // agnosticos del lugar del que están recibiendo los datos.
  // En este caso vemos que declaramos un repositorio del cual obtenemos un método para obtener datos.
  // El lugar del que vienen los datos da igual.
  final VideoPostRepository videoRepository;
  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({required this.videoRepository});

  Future<void> loadNextPage() async {
    List<VideoPost> newVideos = await videoRepository.getTrendingVideosByPage(1);
    
    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}

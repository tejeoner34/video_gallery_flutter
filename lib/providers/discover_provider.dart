import 'package:flutter/material.dart';
import 'package:video_gallery_flutter/domain/entities/video_post.dart';

class DiscoverProvider extends ChangeNotifier {
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {
    //todo: cargar los videos

    notifyListeners();
  }
}
import 'package:flutter/material.dart';
import 'package:video_gallery_flutter/domain/entities/video_post.dart';
import 'package:video_gallery_flutter/infrastructure/models/local_video_model.dart';
import 'package:video_gallery_flutter/shared/data/local_video_posts.dart';

class DiscoverProvider extends ChangeNotifier {
  bool initialLoading = true;
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {
    await Future.delayed(const Duration(seconds: 2));

    List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJsonMap(video).toVideoEntity())
        .toList();
    
    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}

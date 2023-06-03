import 'package:video_gallery_flutter/domain/datasource/video_posts_datasource.dart';
import 'package:video_gallery_flutter/domain/entities/video_post.dart';
import '../../shared/data/local_video_posts.dart';
import '../models/local_video_model.dart';

class LocalVideoDataSource implements VideoPostsDatasource {
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    await Future.delayed(const Duration(seconds: 2));

    List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJsonMap(video).toVideoEntity())
        .toList();

    return newVideos;
  }
}

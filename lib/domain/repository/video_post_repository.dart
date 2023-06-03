import 'package:video_gallery_flutter/domain/entities/video_post.dart';

abstract class VideoPostRepository {
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId);
  Future<List<VideoPost>> getTrendingVideosByPage(int page);
}
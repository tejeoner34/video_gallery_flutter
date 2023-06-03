import 'package:video_gallery_flutter/domain/datasource/video_posts_datasource.dart';
import 'package:video_gallery_flutter/domain/entities/video_post.dart';

import '../../domain/repository/video_post_repository.dart';

class VideoPostsRepositoryImpl implements VideoPostRepository {
  final VideoPostsDatasource videosDataSource;

  VideoPostsRepositoryImpl({required this.videosDataSource});
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    return videosDataSource.getTrendingVideosByPage(page);
  }
}

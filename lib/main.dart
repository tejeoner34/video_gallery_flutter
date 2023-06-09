import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_gallery_flutter/config/theme/app_theme.dart';
import 'package:video_gallery_flutter/infrastructure/datasources/local_video_datasource_impl.dart';
import 'package:video_gallery_flutter/infrastructure/repositories/video_respository_impl.dart';
import 'package:video_gallery_flutter/presentations/screens/discover/discover_screen.dart';
import 'package:video_gallery_flutter/providers/discover_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostRepository =
        VideoPostsRepositoryImpl(videosDataSource: LocalVideoDataSource());
        
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => DiscoverProvider(videoRepository: videoPostRepository)
            ..loadNextPage(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Video Gallery',
        theme: AppTheme().theme(),
        home: const DiscoverScreen(),
      ),
    );
  }
}

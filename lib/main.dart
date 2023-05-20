import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_gallery_flutter/config/theme/app_theme.dart';
import 'package:video_gallery_flutter/presentations/screens/discover/discover_screen.dart';
import 'package:video_gallery_flutter/providers/discover_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DiscoverProvider(),)
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

import 'package:flutter/material.dart';
import 'package:youtube_api/view/youtube_api_view.dart';

import 'package:device_preview/device_preview.dart';

void main() => runApp(
  DevicePreview(
    // enabled: !kReleaseMode,
    builder: (context) => MyApp(), // Wrap your app
  ),
);


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      
      home: YoutubeApiScreen(),
    );
  }
}


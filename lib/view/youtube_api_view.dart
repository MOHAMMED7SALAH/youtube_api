import 'package:flutter/material.dart';
import 'package:youtube_api/controller/youtube_api_controller.dart';
import 'package:youtube_api/model/youtube_model.dart';


class YoutubeApiScreen extends StatefulWidget {
  const YoutubeApiScreen({Key? key}) : super(key: key);

  @override
  _YoutubeApiScreenState createState() => _YoutubeApiScreenState();
}

class _YoutubeApiScreenState extends State<YoutubeApiScreen> {
  late Future<Welcome> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Welcome>(
            future: futureData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  height: 300,
                  width: 200,
                  child: Column(
                    children: [
                      Text(snapshot.data!.data.link[0].title, style: TextStyle(fontSize: 30,),),
                      Text(snapshot.data!.data.link[0].id.toString(), style: TextStyle(fontSize: 30,),),
                      Text(snapshot.data!.data.link[0].createdAt.toString(), style: TextStyle(fontSize: 30,),),
                      Text(snapshot.data!.data.link[0].updatedAt.toString(), style: TextStyle(fontSize: 30,),),
                      Text(snapshot.data!.data.link[1].link),


                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      );
    
  }
}
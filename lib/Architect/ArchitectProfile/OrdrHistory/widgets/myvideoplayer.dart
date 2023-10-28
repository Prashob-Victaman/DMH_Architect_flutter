import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../../Constants/constants.dart';
import 'myimageviewer.dart';

class ChewieVideoPlayer extends StatefulWidget {
  final String videoUrl;

  ChewieVideoPlayer({required this.videoUrl});

  @override
  _ChewieVideoPlayerState createState() => _ChewieVideoPlayerState();
}

class _ChewieVideoPlayerState extends State<ChewieVideoPlayer> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();

    // Initialize the VideoPlayerController with the network video URL
    _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));

    _chewieController = ChewieController(
      fullScreenByDefault: true,
      videoPlayerController: _videoPlayerController,
      autoInitialize: true,
      looping: true, // Set to true if you want the video to loop
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Video Play',
          style: TextStyle(color: Colors.black),
        ),
        leading: const BackButton(
          color: Colors.black,
        ),
        actions: [
          GestureDetector(
            onTap: ()async{
              String? filetype = await getFileTypeFromUrl(widget.videoUrl);
              // print(filetype);
              downloadFile(DateTime.now().millisecondsSinceEpoch, widget.videoUrl,
                  DateTime.now().millisecondsSinceEpoch.toString() + '.$filetype');

            },
            child: const Icon(Icons.download_for_offline_sharp,color: Colors.black,size: 30,),
          ),
          const SizedBox(
            width: 10,
          )
        ],
        backgroundColor: kwhitecolor,
      ),
        body: Chewie(controller: _chewieController),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
    _chewieController.dispose();
  }
}

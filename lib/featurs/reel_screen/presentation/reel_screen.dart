import 'package:flutter/material.dart';
import 'package:investa4/featurs/reel_screen/manager/manage_reels_screen.dart';
import 'package:investa4/featurs/reel_screen/presentation/widgets/comment_section/presentation/comment_screen.dart';
import 'package:investa4/featurs/reel_screen/presentation/widgets/side_button.dart';
import 'package:investa4/featurs/reel_screen/presentation/widgets/top_section.dart';

import 'package:video_player/video_player.dart';

class ReelScreen extends StatefulWidget {
  const ReelScreen({super.key});

  @override
  State<ReelScreen> createState() => _ReelScreenState();
}

class _ReelScreenState extends State<ReelScreen> {
  late ManageReelsScreen manageCommentAnimation;
  bool initFinished = false;

  @override
  void initState() {
    super.initState();
    manageCommentAnimation = ManageReelsScreen();
    manageCommentAnimation.init().then((_) {
      setState(() => initFinished = true);
    });
  }

  @override
  void dispose() {
    manageCommentAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:
          !initFinished
              ? const Center(child: CircularProgressIndicator())
              : SafeArea(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child:
                          manageCommentAnimation.reels.isEmpty
                              ? const Center(
                                child: Text(
                                  'No Reels Available',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              )
                              : PageView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: manageCommentAnimation.reels.length,
                                itemBuilder: (context, index) {
                                  final reel =
                                      manageCommentAnimation.reels[index];
                                  final videoUrl = reel.videoUrls.first;

                                  return VideoPlayerItem(videoUrl: videoUrl);
                                },
                              ),
                    ),
                    const TopSection(),
                    SideBottonsBar(
                      manageCommentAnimation: manageCommentAnimation,
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: CommentScreen(
                        manageCommentAnimation: manageCommentAnimation,
                      ),
                    ),
                  ],
                ),
              ),
    );
  }
}

class VideoPlayerItem extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerItem({super.key, required this.videoUrl});

  @override
  State<VideoPlayerItem> createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  late VideoPlayerController _controller;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        setState(() {
          _initialized = true;
          _controller.play();
          _controller.setLooping(true);
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _initialized
        ? FittedBox(
          fit: BoxFit.cover,
          child: SizedBox(
            width: _controller.value.size.width,
            height: _controller.value.size.height,
            child: VideoPlayer(_controller),
          ),
        )
        : const Center(child: CircularProgressIndicator());
  }
}

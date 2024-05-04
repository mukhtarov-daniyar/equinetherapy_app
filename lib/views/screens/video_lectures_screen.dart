import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../models/course_videos.dart';
import '../../models/course_videos.dart'; // Ensure the correct path

class VideoLecturesScreen extends StatefulWidget {
  const VideoLecturesScreen({super.key});

  @override
  State<VideoLecturesScreen> createState() => _VideoLecturesScreenState();
}

class _VideoLecturesScreenState extends State<VideoLecturesScreen> {
  bool _isSubscribed = false; // Subscription state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text('Video Lectures'),
          ),
      body: _isSubscribed ? _buildVideoList() : _buildSubscriptionScreen(),
    );
  }

  Widget _buildSubscriptionScreen() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Подпишитесь, чтобы получить доступ к видеолекциям.',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isSubscribed = true; // Change state to subscribed
                });
              },
              child: Text('Подписаться'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoList() {
    return ListView.builder(
      itemCount: courses.length,
      itemBuilder: (context, index) {
        return ExpansionTile(
          title: Text(courses[index].courseName),
          children: courses[index]
              .videoIds
              .map((videoId) => ListTile(
                    title: YoutubePlayer(
                      controller: YoutubePlayerController(
                        initialVideoId: videoId,
                        flags: YoutubePlayerFlags(autoPlay: false),
                      ),
                      showVideoProgressIndicator: true,
                    ),
                  ))
              .toList(),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:video_player/video_player.dart';

class AssetsMediaPage extends StatefulWidget {
  const AssetsMediaPage({super.key});

  @override
  State<AssetsMediaPage> createState() => _AssetsMediaPageState();
}

class _AssetsMediaPageState extends State<AssetsMediaPage> {
  final AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;

  late VideoPlayerController videoController;

  @override
  void initState() {
    super.initState();

    videoController = VideoPlayerController.asset(
      'assets/videos/video.mp4',
    )..initialize().then((_) {
        if (mounted) {
          setState(() {});
        }
      });
  }

  Future<void> playAudio() async {
    if (isPlaying) {
      await audioPlayer.pause();

      setState(() {
        isPlaying = false;
      });
    } else {
      await audioPlayer.play(
        AssetSource('audios/music.mp3.mpeg'),
      );

      setState(() {
        isPlaying = true;
      });
    }
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assets & Media'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(
                    'assets/images/profile.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  'Fitria Rahmadani',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                const Text(
                  '2477051012',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 35),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(),
                  ),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.music_note,
                        size: 50,
                      ),

                      const SizedBox(height: 10),

                      const Text(
                        'My Favorite Music',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 15),

                      IconButton(
                        iconSize: 50,
                        onPressed: playAudio,
                        icon: Icon(
                          isPlaying
                              ? Icons.pause_circle
                              : Icons.play_circle,
                        ),
                      ),

                      Text(
                        isPlaying ? 'Playing' : 'Play Music',
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                const Text(
                  'My Video',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                if (videoController.value.isInitialized)
                  AspectRatio(
                    aspectRatio: videoController.value.aspectRatio,
                    child: VideoPlayer(videoController),
                  )
                else
                  const CircularProgressIndicator(),

                const SizedBox(height: 10),

                IconButton(
                  iconSize: 50,
                  onPressed: () {
                    setState(() {
                      if (videoController.value.isPlaying) {
                        videoController.pause();
                      } else {
                        videoController.play();
                      }
                    });
                  },
                  icon: Icon(
                    videoController.value.isPlaying
                        ? Icons.pause_circle
                        : Icons.play_circle,
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
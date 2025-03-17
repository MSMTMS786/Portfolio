import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../models/media_item.dart';

class MediaGrid extends StatelessWidget {
  final List<MediaItem> mediaItems;
  final String category;

  const MediaGrid({
    Key? key,
    required this.mediaItems,
    required this.category,
  }) : super(key: key);

  List<MediaItem> _getFilteredItems() {
    if (category == 'All') {
      return mediaItems;
    }
    return mediaItems.where((item) {
      if (category == 'Photos' && item.type.toLowerCase() == 'photo') return true;
      if (category == 'Videos' && item.type.toLowerCase() == 'video') return true;
      if (category == 'Music' && item.type.toLowerCase() == 'music') return true;
      return false;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredItems = _getFilteredItems();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1,
        ),
        itemCount: filteredItems.length,
        itemBuilder: (context, index) {
          final item = filteredItems[index];

          return GestureDetector(
            onTap: () {
              if (item.type.toLowerCase() == 'photo') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FullScreenImage(imageUrl: item.imageUrl)),
                );
              } else if (item.type.toLowerCase() == 'video') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FullScreenVideo(videoUrl: item.imageUrl)),
                );
              } else if (item.type.toLowerCase() == 'music') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FullScreenMusic(musicUrl: item.imageUrl)),
                );
              }
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: item.type.toLowerCase() == 'photo'
                  ? Image.asset(
                      item.imageUrl,
                      fit: BoxFit.cover,
                    )
                  : item.type.toLowerCase() == 'video'
                      ? Container(
                          color: Colors.black,
                          child: const Center(
                            child: Icon(Icons.play_circle_fill, color: Colors.white, size: 50),
                          ),
                        )
                      : Container(
                          color: Colors.blueAccent.withOpacity(0.1),
                          child: const Center(
                            child: Icon(Icons.music_note, color: Colors.blue, size: 40),
                          ),
                        ),
            ),
          );
        },
      ),
    );
  }
}

// Full-Screen Image Viewer
class FullScreenImage extends StatelessWidget {
  final String imageUrl;
  const FullScreenImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black),
      body: Center(
        child: Image.asset(imageUrl, fit: BoxFit.contain),
      ),
    );
  }
}

class FullScreenVideo extends StatefulWidget {
  final String videoUrl;
  const FullScreenVideo({Key? key, required this.videoUrl}) : super(key: key);

  @override
  _FullScreenVideoState createState() => _FullScreenVideoState();
}

class _FullScreenVideoState extends State<FullScreenVideo> {
  late VideoPlayerController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  void _initializeVideo() async {
    try {
      _controller = VideoPlayerController.asset(widget.videoUrl);
      await _controller.initialize();
      setState(() {
        _isLoading = false;
      });
      _controller.play();
      _controller.setLooping(true);
    } catch (e) {
      print("Video Player Error: $e");
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator(color: Colors.white)
            : Stack(
                alignment: Alignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ),
                  IconButton(
                    icon: Icon(
                      _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                      color: Colors.white,
                      size: 50,
                    ),
                    onPressed: () {
                      setState(() {
                        _controller.value.isPlaying ? _controller.pause() : _controller.play();
                      });
                    },
                  ),
                ],
              ),
      ),
    );
  }
}
class FullScreenMusic extends StatelessWidget {
  final String musicUrl;

  const FullScreenMusic({Key? key, required this.musicUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.music_note, color: Colors.white, size: 100),
            SizedBox(height: 20),
            Text(
              "Playing Music...",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Close"),
            ),
          ],
        ),
      ),
    );
  }
}


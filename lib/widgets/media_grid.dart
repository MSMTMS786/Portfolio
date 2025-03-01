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
    return mediaItems
        .where((item) => item.type.toLowerCase() == category.toLowerCase())
        .toList();
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

          if (item.type == 'photo') {
            return ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                item.imageUrl,
                fit: BoxFit.cover,
              ),
            );
          } else if (item.type == 'video') {
            return VideoItem(videoUrl: item.imageUrl);
          } else if (item.type == 'music') {
            return MusicItem(musicUrl: item.imageUrl);
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class VideoItem extends StatefulWidget {
  final String videoUrl;
  const VideoItem({Key? key, required this.videoUrl}) : super(key: key);

  @override
  _VideoItemState createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          ),
        ),
        IconButton(
          icon: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow, color: Colors.white, size: 40),
          onPressed: () {
            setState(() {
              _controller.value.isPlaying ? _controller.pause() : _controller.play();
            });
          },
        ),
      ],
    );
  }
}

class MusicItem extends StatelessWidget {
  final String musicUrl;
  const MusicItem({Key? key, required this.musicUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueAccent.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Icon(Icons.music_note, color: Colors.blue, size: 40),
      ),
    );
  }
}

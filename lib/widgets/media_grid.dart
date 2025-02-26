import 'package:flutter/material.dart';
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
          return ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              filteredItems[index].imageUrl,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
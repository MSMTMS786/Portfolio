class User {
  final String name;
  final String username;
  final String profileImage;
  final Map<String, int> socialStats;
  final Map<String, String> profileUrls;

  User({
    required this.name,
    required this.username,
    required this.profileImage,
    required this.socialStats,
    this.profileUrls = const {}, // Default empty map
  });
}
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialStats extends StatelessWidget {
  final Map<String, int> stats;
  final Map<String, String> profileUrls;
  final String whatsappNumber; // Add WhatsApp number here

  const SocialStats({
    super.key,
    required this.stats,
    required this.profileUrls,
    required this.whatsappNumber, // Require WhatsApp number
  });

  String _formatNumber(int number) {
    if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}k';
    }
    return number.toString();
  }

  IconData _getIconForPlatform(String platform) {
    switch (platform.toLowerCase()) {
      case 'facebook':
        return FontAwesomeIcons.facebookF;
      case 'github':
        return FontAwesomeIcons.github;
      case 'linkedin':
        return FontAwesomeIcons.linkedinIn;
      case 'WhatsApp': // Change contact icon to WhatsApp
        return FontAwesomeIcons.whatsapp;
      default:
        return FontAwesomeIcons.whatsapp;
    }
  }

  Color _getColorForPlatform(String platform) {
    switch (platform.toLowerCase()) {
      case 'facebook':
        return Colors.blue;
      case 'github':
        return Colors.white;
      case 'linkedin':
        return Colors.blue.shade700;
      case 'WhatsApp': // Change contact color to WhatsApp green
        return Colors.green;
      default:
        return Colors.green;
    }
  }

  Future<void> _launchUrl(String platform) async {
    debugPrint("Attempting to launch platform: $platform");
    final platformLower = platform.toLowerCase();

    if (platformLower == 'WhatsApp') {
      // Handle WhatsApp separately
      String whatsappUrl = "https://wa.me/$whatsappNumber?text=${Uri.encodeComponent('Hey')}";
      debugPrint("Launching WhatsApp: $whatsappUrl");

      if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
        await launchUrl(Uri.parse(whatsappUrl), mode: LaunchMode.externalApplication);
      } else {
        debugPrint('Cannot launch WhatsApp chat.');
      }
      return;
    }

    // Handle other platforms
    String? url;
    for (var entry in profileUrls.entries) {
      if (entry.key.toLowerCase() == platformLower) {
        url = entry.value;
        break;
      }
    }

    debugPrint("URL for platform: $url");
    if (url == null || url.isEmpty) {
      debugPrint("No URL found for platform: $platform");
      return;
    }

    try {
      final uri = Uri.parse(url);
      debugPrint("Launching URL: $uri");

      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
        debugPrint("URL launched successfully");
      } else {
        debugPrint('Cannot launch URL: $url');
      }
    } catch (e) {
      debugPrint('Error launching URL: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: stats.entries.map((entry) {
        return GestureDetector(
          onTap: () {
            debugPrint("Icon tapped: ${entry.key}");
            _launchUrl(entry.key);
          },
          child: Column(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: _getColorForPlatform(entry.key).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  _getIconForPlatform(entry.key),
                  color: _getColorForPlatform(entry.key),
                  size: 24,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                _formatNumber(entry.value),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

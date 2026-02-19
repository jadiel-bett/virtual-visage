import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class Method extends ConsumerWidget {
  const Method({super.key});

  Future<void> downloadResume(BuildContext context) async {
    try {
      final url = Uri.parse('/assets/resume/Jadiel_Bett_Resume.pdf');
      
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.platformDefault);
        
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Resume download started'),
              backgroundColor: Color(0xff64FFDA),
              duration: Duration(seconds: 2),
            ),
          );
        }
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to download resume: $e'),
            backgroundColor: Colors.red,
            action: SnackBarAction(
              label: 'Retry',
              textColor: Colors.white,
              onPressed: () => downloadResume(context),
            ),
            duration: const Duration(seconds: 4),
          ),
        );
      }
    }
  }

  Future<void> sharePortfolio() async {
    try {
      await Share.share(
        'Check out Jadiel Bett\'s portfolio: https://jadielbett.dev',
        subject: 'Jadiel Bett - Software & Mechatronics Engineer',
      );
    } catch (e) {
      // Silent failure for user cancellation
    }
  }

  Future<void> launchEmail(BuildContext context) async {
    try {
      final url = Uri.parse('mailto:jadielbett@gmail.com');
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch email';
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to open email: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Get In Touch Button
          ElevatedButton(
            onPressed: () => launchEmail(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff64FFDA),
              foregroundColor: const Color(0xff0A192F),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            ),
            child: const Text(
              'Get In Touch',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Download Resume Button
          Semantics(
            label: 'Download resume',
            button: true,
            hint: 'Opens resume in new tab',
            child: ElevatedButton.icon(
              onPressed: () => downloadResume(context),
              icon: const Icon(Icons.download),
              label: const Text('Download Resume'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff0A192F),
                foregroundColor: const Color(0xff64FFDA),
                side: const BorderSide(color: Color(0xff64FFDA)),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              ),
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Share Portfolio Button
          Semantics(
            label: 'Share portfolio',
            button: true,
            child: IconButton(
              onPressed: sharePortfolio,
              icon: const Icon(Icons.share),
              color: const Color(0xff64FFDA),
              iconSize: 28,
              tooltip: 'Share Portfolio',
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:url_launcher/url_launcher.dart';

class Method {
  launchURL(String link) async {
    var url = Uri.parse(link);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launchUrl $url';
    }
  }

  launchCaller() async {
    var url = Uri.parse("tel:9595242507");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launchUrl $url';
    }
  }

  launchEmail() async {
    if (await canLaunchUrl(Uri.parse("mailto:jadielbett@gmail.com"))) {
      await launchUrl(Uri.parse("mailto:jadielbett@gmail.com"));
    } else {
      throw 'Could not launchUrl';
    }
  }
}

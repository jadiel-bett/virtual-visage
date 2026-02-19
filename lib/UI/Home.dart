import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/UI/HomePage.dart';
import '/UI/MobileHome.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Desktop layout for screens >= 1200px
        if (constraints.maxWidth >= 1200) {
          return const HomePage();
        }
        // Tablet and mobile layouts use MobileHome (600-1200px and <600px)
        // The MobileHome component already handles responsive sizing internally
        else {
          return const MobileHome();
        }
      },
    );
  }
}

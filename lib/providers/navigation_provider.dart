import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationState {
  final int currentIndex;
  final String currentRoute;

  NavigationState({
    required this.currentIndex,
    required this.currentRoute,
  });

  NavigationState copyWith({
    int? currentIndex,
    String? currentRoute,
  }) {
    return NavigationState(
      currentIndex: currentIndex ?? this.currentIndex,
      currentRoute: currentRoute ?? this.currentRoute,
    );
  }
}

class NavigationNotifier extends StateNotifier<NavigationState> {
  NavigationNotifier()
      : super(NavigationState(
          currentIndex: 0,
          currentRoute: '/',
        ));

  void navigateTo(int index, String route) {
    state = NavigationState(
      currentIndex: index,
      currentRoute: route,
    );
  }
}

final navigationProvider =
    StateNotifierProvider<NavigationNotifier, NavigationState>((ref) {
  return NavigationNotifier();
});

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeState {
  final bool isDarkMode;
  final Color primaryColor;
  final Color accentColor;

  ThemeState({
    required this.isDarkMode,
    required this.primaryColor,
    required this.accentColor,
  });

  ThemeState copyWith({
    bool? isDarkMode,
    Color? primaryColor,
    Color? accentColor,
  }) {
    return ThemeState(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      primaryColor: primaryColor ?? this.primaryColor,
      accentColor: accentColor ?? this.accentColor,
    );
  }
}

class ThemeNotifier extends StateNotifier<ThemeState> {
  ThemeNotifier()
      : super(ThemeState(
          isDarkMode: true,
          primaryColor: const Color(0xff0A192F),
          accentColor: const Color(0xff64FFDA),
        ));

  void toggleTheme() {
    state = ThemeState(
      isDarkMode: !state.isDarkMode,
      primaryColor: state.isDarkMode ? Colors.white : const Color(0xff0A192F),
      accentColor: state.accentColor,
    );
  }
}

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeState>((ref) {
  return ThemeNotifier();
});

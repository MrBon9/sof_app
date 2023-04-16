part of app_layer;

ThemeData themeManager({
  required ThemeMode mode,
}) {
  final isDark = mode == ThemeMode.dark;
  ThemeData baseTheme = isDark
      ? ThemeData(
          colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: Colors.orange,
          onPrimary: Colors.black,
          secondary: Colors.cyan.shade600,
          onSecondary: Colors.black54,
          surface: Colors.grey,
          onSurface: Colors.white,
          background: Color.fromARGB(255, 22, 19, 19),
          onBackground: Colors.white,
          error: Colors.red,
          onError: Colors.red,
        ))
      : ThemeData(
          colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Colors.orange,
          onPrimary: Colors.white,
          secondary: Colors.orange,
          onSecondary: Colors.black54,
          surface: Colors.grey.shade200,
          onSurface: Colors.white,
          background: Colors.white,
          onBackground: Colors.black,
          error: Colors.red,
          onError: Colors.red,
        ));

  return baseTheme;
}

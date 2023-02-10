import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'common/configs/routes/route_paths.dart';
import 'common/configs/styles/app_theme.dart';
import 'common/configs/styles/theme/app_theme_provider.dart';

/// Main App Widget
class CyberPayApp extends ConsumerStatefulWidget {
  /// Creates instance of [CyberPayApp]
  const CyberPayApp({Key? key}): super(key: key);

  @override
  CyberPayAppState createState() => CyberPayAppState();
}

/// Main App CyberPayAppState Widget
class CyberPayAppState extends ConsumerState<CyberPayApp> {
  /// private reference to the theme status
  DarkThemeProvider darkThemeProvider = DarkThemeProvider();

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  void getCurrentAppTheme() async {
    darkThemeProvider.darkTheme =
    await darkThemeProvider.darkThemePref.getTheme();
  }
  @override
  Widget build(BuildContext context) {
    final goRouter = ref.watch(goRouterProvider);

    return MaterialApp.router(
      title: 'CyberPay Mobile',
      debugShowCheckedModeBanner: false,
      themeMode: darkThemeProvider.darkTheme==true ? ThemeMode.dark:ThemeMode.light,
      theme: lightTheme,
      darkTheme: darkTheme,
      routeInformationProvider: goRouter.routeInformationProvider,
      routeInformationParser: goRouter.routeInformationParser,
      routerDelegate: goRouter.routerDelegate,
    );
  }
}

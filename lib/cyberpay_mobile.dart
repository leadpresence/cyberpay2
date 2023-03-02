import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'common/configs/routes/route_paths.dart';
import 'common/configs/styles/app_theme.dart';
import 'common/configs/styles/theme/app_theme_provider.dart';

/// Key for showing snack bars
final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

/// Global [NavigatorState] Key
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

/// Main App Widget
class CyberPayApp extends ConsumerWidget {
  /// Creates instance of [CyberPayApp]
    CyberPayApp({Key? key}): super(key: key);

//   @override
//   CyberPayAppState createState() => CyberPayAppState();
// }
//
// /// Main App CyberPayAppState Widget
// class CyberPayAppState extends ConsumerState<CyberPayApp> {
  /// private reference to the theme status
  final darkThemeProvider = DarkThemeProvider();
//
//   @override
//   void initState() {
//     getCurrentAppTheme();
//     super.initState();
//   }

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);


    return MaterialApp.router(
      title: 'CyberPay Mobile',
      onGenerateTitle: (BuildContext context)=>'CyberPay Mobile',
      debugShowCheckedModeBanner: false,
      themeMode: darkThemeProvider.darkTheme ? ThemeMode.dark:ThemeMode.light,
      theme: lightTheme,
      darkTheme: darkTheme,
      restorationScopeId: 'app',
      scaffoldMessengerKey:rootScaffoldMessengerKey,
      routeInformationProvider: goRouter.routeInformationProvider,
      routeInformationParser: goRouter.routeInformationParser,
      routerDelegate: goRouter.routerDelegate,

    );

  }
  /// Get saved ThemeState
  Future<void> getCurrentAppTheme() async {
    darkThemeProvider.darkTheme =
    await darkThemeProvider.darkThemePref.getTheme();
  }
}






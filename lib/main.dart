import 'package:flutter/material.dart';
import 'package:news_app/core/config/application_theme_manager.dart';
import 'package:provider/provider.dart';

import 'core/config/page_route_names.dart';
import 'core/config/routes_generator.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'core/config/settings_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => SettingsProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      theme: ApplicationThemeManager.themeData,
      initialRoute: PageRouteNames.initial,
      onGenerateRoute: RouteGenerator.onGenerateRoute,
      locale: Locale(provider.currentLanguage),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}



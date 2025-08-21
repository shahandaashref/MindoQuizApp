import 'package:flutter/material.dart';
import 'package:mindo/congrats_screen.dart';
import 'package:mindo/localprovider.dart';
import 'package:mindo/oops_screen.dart';
import 'package:mindo/provider/questionprovider.dart';
import 'package:provider/provider.dart';
import 'package:device_preview/device_preview.dart';
import 'generated/l10n.dart';
import 'theme_provider.dart'; 
import 'app_themes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'Splash.dart';
import 'Higuys1.dart';
import 'Higuys2.dart';
import 'HomeScreen.dart';
import 'Quizpage.dart' hide QuestionProvider;

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => QuestionProvider()),
        ChangeNotifierProvider(create: (context) => LocaleProvider()), // إضافة LocaleProvider
      ],
      child: DevicePreview(
        enabled: true,
        builder: (context) => MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {

    final themeProvider = Provider.of<ThemeProvider>(context);
    final localeProvider = Provider.of<LocaleProvider>(context); // إضافة LocaleProvider

    return MaterialApp(
      
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English
        Locale('ar', ''), // Arabic
      ],
      
      // هنا المفتاح - استخدام اللغة من الـ provider
      locale: localeProvider.locale,
      
      builder: DevicePreview.appBuilder,
      title: 'Mindo Quizzes',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: themeProvider.themeMode,
      debugShowCheckedModeBanner: false,

      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),       
        '/quiz': (context) => const QuizScreen(),     
        '/higuys2': (context) => const Higuys2(),  
        '/quizPage':(context) => QuizPage(),  
        '/oops':(context)=>OopsScreen(),
        '/congrats':(context)=>CongratsScreen(),
      },
    );
  }
}


import 'package:flutter/material.dart';
import 'package:mindo/provider/questionprovider.dart';
import 'package:provider/provider.dart';
import 'package:device_preview/device_preview.dart';
import 'theme_provider.dart';
import 'app_themes.dart';

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
      ],
      child: DevicePreview(
        enabled: true,
        builder: (context) => MyApp(), // Wrap your app
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
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {

    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      //useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Mindo Quizzes',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: themeProvider.themeMode,//_themeMode,//
      debugShowCheckedModeBanner: false,


      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),       
        '/quiz': (context) => const QuizScreen(),     
        '/higuys2': (context) => const Higuys2(),  
        '/quizPage':(context) => QuizPage(),  
      },
    );
  }
}

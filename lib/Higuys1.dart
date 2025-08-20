import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:test/Higuys2.dart';
import 'Higuys2.dart';
import 'theme_provider.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 7), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Higuys2()), 
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
    
          SizedBox.expand(
            child: Image.asset(
              isDark
                  ? 'assets/images/dark/background.png'
                  : 'assets/images/light/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: IconButton(
              icon: Icon(
                isDark ? Icons.light_mode : Icons.dark_mode,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                final provider =
                    Provider.of<ThemeProvider>(context, listen: false);
                provider.toggleTheme(provider.themeMode != ThemeMode.dark);
              },
            ),
          ),

     
          Positioned(
            top: screenHeight * 0.18,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Test yourself with Mindo quizzes",
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        color: isDark ? Colors.white : Colors.black,
                        fontSize: 28,
                      ),
                ),
                const SizedBox(height: 15),
                Text(
                  "Hi, I'm Mindo! Choose from various categories and challenge yourself with multiple quizzes.",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: isDark ? Colors.white70 : Colors.black87,
                        fontSize: 18,
                      ),
                ),
              ],
            ),
          ),

          Positioned(
            bottom: screenHeight * 0.05,
            right: 10, 
            child: Image.asset(
              isDark
                  ? 'assets/images/dark/mind.png'
                  : 'assets/images/light/mind.png',
              height: screenHeight * 0.4,
            ),
          ),
        ],
      ),
    );
  }
}

class NextScreen extends StatelessWidget {
  const NextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Next Screen")),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mindo/generated/l10n.dart';
import 'package:mindo/widgets/langbuttom.dart';
import 'wellcome.dart';

class Higuys2 extends StatefulWidget {
  const Higuys2({super.key});

  @override
  State<Higuys2> createState() => _Higuys2State();
}

class _Higuys2State extends State<Higuys2> {
  bool isDark = false;

  void toggleTheme() {
    setState(() {
      isDark = !isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: SimpleLanguageToggle(),
      // ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              isDark
                  ? 'assets/images/dark/background.png'
                  : 'assets/images/light/background.png',
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 16, top: 150, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).beTheTop,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  S.of(context).earnPointsDescription,
                  style: TextStyle(
                    color: isDark ? Colors.white70 : Colors.black87,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 100,
            right: 10,
            child: Image.asset(
              isDark
                  ? 'assets/images/dark/mind2.png'
                  : 'assets/images/light/mind2.png',
              height: 280,
            ),
          ),

          Positioned(
            bottom: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WelcomePage(
                      isDark: isDark,
                      toggleTheme: toggleTheme,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              child: Text(
                S.of(context).start,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),

          Positioned(
            top: 40,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
              children: [
                SimpleLanguageToggle(),
                
                IconButton(
                  icon: Icon(
                    isDark ? Icons.dark_mode : Icons.light_mode,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  onPressed: toggleTheme,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

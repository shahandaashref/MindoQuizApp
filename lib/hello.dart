
import 'package:flutter/material.dart';
import 'HomeScreen.dart';

class HelloPage extends StatelessWidget {
  final bool isDark;
  final VoidCallback toggleTheme;

  HelloPage({super.key, required this.isDark, required this.toggleTheme});

  final TextEditingController passController = TextEditingController();
  final TextEditingController repeatPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Color bgColor = isDark ? Colors.black : Colors.white;
    Color textColor = isDark ? Colors.white : Colors.black;
    Color subTextColor = isDark ? Colors.white70 : Colors.grey[600]!;
    Color fieldBg = isDark ? Colors.grey[900]! : Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: Color(0xFF6366F1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(Icons.psychology_outlined, color: Colors.white, size: 35),
              ),
              SizedBox(height: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hello!", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: textColor)),
                  SizedBox(height: 4),
                  Text("Serhii Ivanov", style: TextStyle(fontSize: 16, color: subTextColor)),
                ],
              ),
              SizedBox(height: 24),
              buildPassField(passController, "Create password", fieldBg, textColor),
              SizedBox(height: 12),
              buildPassField(repeatPassController, "Repeat your password", fieldBg, textColor),
              SizedBox(height: 24),
              Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      height: 56,
                      width: 56,
                      decoration: BoxDecoration(
                        color: isDark ? Colors.grey[800] : Colors.grey[300],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(Icons.arrow_back, color: isDark ? Colors.white : Colors.black),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF6366F1),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        shadowColor: Color(0xFF6366F1).withOpacity(0.3),
                      ),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => HomeScreen(isDark: isDark, toggleTheme: toggleTheme)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Next", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward, color: Colors.white),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPassField(TextEditingController controller, String hint, Color bg, Color textColor) {
    return Container(
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[700]!),
      ),
      child: TextField(
        controller: controller,
        obscureText: true,
        style: TextStyle(color: textColor),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock_outline, color: textColor),
          hintText: hint,
          hintStyle: TextStyle(color: textColor),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        ),
      ),
    );
  }
}

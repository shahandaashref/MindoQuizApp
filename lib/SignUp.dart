
import 'package:flutter/material.dart';
import 'Hello.dart';

class SignUpPage extends StatelessWidget {
  final bool isDark;
  final VoidCallback toggleTheme;
  SignUpPage({super.key, required this.isDark, required this.toggleTheme});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Color(0xFF6366F1);
    Color bgColor = isDark ? Colors.black : Colors.white;
    Color textColor = isDark ? Colors.white : Color(0xFF1F2937);
    Color hintColor = isDark ? Colors.white54 : Color(0xFFD1D5DB);
    Color subTextColor = isDark ? Colors.white70 : Color(0xFF6B7280);
    return Scaffold(
      backgroundColor: bgColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(18), boxShadow: [BoxShadow(color: primaryColor.withOpacity(0.3), blurRadius: 15, offset: Offset(0, 8))]),
                      child: Center(child: Icon(Icons.psychology_outlined, size: 35, color: Colors.white)),
                    ),
                    SizedBox(height: 20),
                    Text("Sign up", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: textColor)),
                    SizedBox(height: 5),
                    Text("to start working", style: TextStyle(fontSize: 16, color: subTextColor)),
                  ],
                ),
                SizedBox(height: 40),
                buildTextField(nameController, Icons.person_outline, "Enter your name", hintColor, isDark),
                SizedBox(height: 20),
                buildTextField(emailController, Icons.email_outlined, "Enter your email", hintColor, isDark),
                SizedBox(height: 40),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 56,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isDark ? Colors.grey[800] : Color(0xFFF3F4F6),
                            foregroundColor: isDark ? Colors.white : Color(0xFF6B7280),
                            elevation: 0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back, color: isDark ? Colors.white : Color(0xFF6B7280), size: 20),
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 56,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            shadowColor: primaryColor.withOpacity(0.3),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HelloPage(isDark: isDark, toggleTheme: toggleTheme)));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Next", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white)),
                              SizedBox(width: 8),
                              Icon(Icons.arrow_forward, color: Colors.white, size: 18),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(TextEditingController controller, IconData icon, String hint, Color hintColor, bool isDark) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[900] : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isDark ? Colors.grey[700]! : Color(0xFFE5E7EB)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4, offset: Offset(0, 2))],
      ),
      child: TextField(
        controller: controller,
        style: TextStyle(color: isDark ? Colors.white : Colors.black),
        decoration: InputDecoration(
          prefixIcon: Padding(padding: EdgeInsets.all(16.0), child: Icon(icon, color: isDark ? Colors.white70 : Color(0xFF6B7280), size: 20)),
          hintText: hint,
          hintStyle: TextStyle(color: hintColor, fontSize: 16),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        ),
      ),
    );
  }
}

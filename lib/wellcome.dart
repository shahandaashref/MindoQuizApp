
import 'package:flutter/material.dart';
import 'package:mindo/generated/l10n.dart';
import 'SignUp.dart';

class WelcomePage extends StatelessWidget {
  final bool isDark;
  final VoidCallback toggleTheme;
  WelcomePage({super.key, required this.isDark, required this.toggleTheme});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [BoxShadow(color: primaryColor.withOpacity(0.3), blurRadius: 15, offset: Offset(0, 8))],
                      ),
                      child: Center(child: Icon(Icons.psychology_outlined, size: 35, color: Colors.white)),
                    ),
                    SizedBox(height: 20),
                    Text("Welcome!", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: textColor)),
                    SizedBox(height: 5),
                    Text("Sign in to continue", style: TextStyle(fontSize: 16, color: subTextColor)),
                  ],
                ),
                SizedBox(height: 40),
                buildTextField(emailController, Icons.person_outline, "malak@gmail.com", hintColor, isDark),
                SizedBox(height: 16),
                buildTextField(passwordController, Icons.lock_outline, "••••••", hintColor, isDark, obscure: true),
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text("Forgot password?", style: TextStyle(color: Color(0xFFEF4444), fontSize: 14, fontWeight: FontWeight.w500)),
                  ),
                ),
                SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(isDark: isDark, toggleTheme: toggleTheme)));
                    },
                    child: Text(S.of(context).quiz, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  ),
                ),
                SizedBox(height: 32),
                Row(
                  children: [
                    Expanded(child: Divider(color: subTextColor, thickness: 1)),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: Text("OR", style: TextStyle(color: subTextColor))),
                    Expanded(child: Divider(color: subTextColor, thickness: 1)),
                  ],
                ),
                SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: primaryColor,
                      side: BorderSide(color: primaryColor, width: 2),
                      backgroundColor: bgColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {},
                    child: Text("Create an account", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: primaryColor)),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(TextEditingController controller, IconData icon, String hint, Color hintColor, bool isDark, {bool obscure = false}) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[900] : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isDark ? Colors.grey[700]! : Color(0xFFE5E7EB)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4, offset: Offset(0, 2))],
      ),
      child: TextField(
        controller: controller,
        obscureText: obscure,
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

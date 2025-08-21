
import 'package:flutter/material.dart';
import 'package:mindo/generated/l10n.dart';
import 'Profile.dart';

class HomeScreen extends StatelessWidget {
  final bool isDark;
  final VoidCallback toggleTheme;


  const HomeScreen({super.key, required this.isDark, required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    List <String>categoryId=[];
    Color bgColor = isDark ? Colors.black : Color(0xFFF5F5F5);
    Color textColor = isDark ? Colors.white : Colors.black;
    Color subTextColor = isDark ? Colors.white70 : Color(0xFF737373);
    Color cardColor = isDark ? Color(0xFF1C1C1C) : Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(S.of(context).hi, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25, color: textColor)),
              SizedBox(height: 8),
              Text(S.of(context).letsPlay, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 11, color: subTextColor)),
              SizedBox(height: 16),

              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha:  0.05),
                      offset: Offset(4, 4),
                      blurRadius: 12,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.star, size: 20, color: Color(0xFF4555A4)),
                            SizedBox(width: 4),
                            Text(S.of(context).ranking, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10, color: textColor)),
                          ],
                        ),
                        Text('348', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15, color: Color(0xFF4555A4))),
                      ],
                    ),
                    VerticalDivider(color: isDark ? Colors.grey[800] : Color(0xFFF1F1F1), thickness: 1),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/light/coin.png', width: 20, height: 20),
                            SizedBox(width: 4),
                            Text(S.of(context).points, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10, color: textColor)),
                          ],
                        ),
                        Text('1209', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15, color: Color(0xFF4555A4))),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),

              Text(S.of(context).letsPlay, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17, color: textColor)),
              SizedBox(height: 16),

              
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  _buildCategoryCard(S.of(context).sports, 'assets/images/light/basket.png', '50 questions', cardColor, isDark, (){
          Navigator.pushNamed(context,'/quizPage',arguments: '21');
        },),
                  _buildCategoryCard(S.of(context).chemistry, 'assets/images/light/test_tube.png', '30 questions', cardColor, isDark,(){
          Navigator.pushNamed(context,'/quizPage',arguments: '17' );},),
                  _buildCategoryCard(S.of(context).math, 'assets/images/light/content.png', '95 questions', cardColor, isDark,(){
          Navigator.pushNamed(context,'/quizPage',arguments: '19' );},),
                  _buildCategoryCard(S.of(context).history, 'assets/images/light/calender.png', '128 questions', cardColor, isDark,(){
          Navigator.pushNamed(context,'/quizPage' ,arguments: '23');},),
                  _buildCategoryCard('Biological', 'assets/images/light/dna.png', '30 questions', cardColor, isDark,(){
          Navigator.pushNamed(context,'/quizPage',arguments: '17' );},),
                  _buildCategoryCard('Geography', 'assets/images/light/map.png', '24 questions', cardColor, isDark,(){
          Navigator.pushNamed(context,'/quizPage',arguments: '22' );},),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Color(0xFF91A1ED),
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {}, 
              child: Icon(Icons.star, color: Colors.white, size: 30),
            ),
            InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProfileScreen(isDark: isDark))),
              child: Icon(Icons.person, color: Colors.white, size: 30),
            ),
            Icon(Icons.home, color: Colors.white, size: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(String title, String imagePath, String questions, Color bg, bool isDark,dynamic onTap) {
    
    return Container(
      width: 120,
      height: 150,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.black.withValues(alpha: 0.3) : Colors.grey.withValues(alpha: 0.3),
            offset: Offset(4, 4),
            blurRadius: 12,
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, width: 60, height: 60),
            SizedBox(height: 8),
            Text(title, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13, color: isDark ? Colors.white : Colors.black)),
            SizedBox(height: 4),
            Text(questions, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 8, color: isDark ? Colors.white70 : Colors.grey[800])),
          ],
        ),
      ),
    );
  }
}

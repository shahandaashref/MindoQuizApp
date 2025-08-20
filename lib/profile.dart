
import 'package:flutter/material.dart';
import 'quizpage.dart'; 


class ProfileScreen extends StatelessWidget {
  final bool isDark;
  const ProfileScreen({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    Color bgColor = isDark ? Colors.black : Colors.white;
    Color textColor = isDark ? Colors.white : Colors.black;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/light/user.png'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Itunuoluwa Abidoye',
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold, color: textColor),
                  ),
                  Text(
                    'itunuoluwa@petrafrica',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star, color: Color(0xFF4555A4)),
                          SizedBox(width: 5),
                          Text('Ranking 348', style: TextStyle(color: textColor)),
                        ],
                      ),
                      SizedBox(width: 20),
                      Row(
                        children: [
                          Image.asset('assets/images/light/coin.png', height: 24),
                          SizedBox(width: 5),
                          Text('Points 1209', style: TextStyle(color: textColor)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Quizzes Grades',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textColor),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(16.0),
                children: [
                  QuizCard(subject: 'Sports', score: '5/10', isDark: isDark),
                  QuizCard(subject: 'Chemistry', score: '5/10', isDark: isDark),
                  QuizCard(subject: 'Sports', score: '5/10', isDark: isDark),
                  QuizCard(subject: 'Chemistry', score: '5/10', isDark: isDark),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuizCard extends StatelessWidget {
  final String subject;
  final String score;
  final bool isDark;

  QuizCard({required this.subject, required this.score, required this.isDark});

  @override
  Widget build(BuildContext context) {
    
    Color textColor;
    Color refreshColor = Colors.grey; 

    bool isSports = subject == 'Sports';

    if (isSports) {
      textColor = Color(0xFF6366F1); 
      refreshColor = Color(0xFF6366F1); 
    } else if (subject == 'Chemistry') {
      textColor = Colors.grey; // رمادي
      refreshColor = Colors.grey;
    } else {
      textColor = isDark ? Colors.white : Colors.black; 
      refreshColor = Colors.grey;
    }

    return Card(
      color: isDark ? Colors.grey[900] : Colors.grey[200],
      child: ListTile(
        title: Text(subject, style: TextStyle(color: textColor)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(score, style: TextStyle(color: isDark ? Colors.white70 : Colors.black)),
            GestureDetector(
              onTap: () {
                
                if (isSports) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const QuizPage()),
                  );
                }
              },
              child: Icon(Icons.refresh, color: refreshColor),
            ),
          ],
        ),
      ),
    );
  }
}

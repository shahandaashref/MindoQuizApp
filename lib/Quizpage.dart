// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'package:mindo/provider/questionprovider.dart';
// import '../model/question_model.dart';
// import '../widgets/option_tile.dart';
// import '../widgets/question_header.dart';
// import '../widgets/next_button.dart';

// class QuizPage extends StatefulWidget {
//   // final bool isDark;
//   // final VoidCallback toggleTheme;
//   const QuizPage({super.key,});

//   @override
//   State<QuizPage> createState() => _QuizPageState();
// }

// class _QuizPageState extends State<QuizPage> {

//   int currentIndex = 0;
//   int selectedIndex = -1;
//   bool answered = false;

//   int timeLeft = 30;
//   Timer? timer;

//   final List<Question> questions = [
//     Question(
//       text: "What is the most popular sport throughout the world?",
//       options: ["Volleyball", "Football", "Basketball", "Badminton"],
//       correctIndex: 1,
//     ),
//     Question(
//       text: "Which country has won the most FIFA World Cup titles in men's football?",
//       options: ["Argentina", "Brazil", "Germany", "Italy"],
//       correctIndex: 1,
//     ),
//   ];

//   @override
//   void initState() {
//     super.initState();
//     startTimer();
//     _loadInitialData();
//   }
//   void _loadInitialData() {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       final provider = context.read<QuestionProvider>();
//       provider.getQuestion;
//     });
//   }

//   void startTimer() {
//     timer?.cancel();
//     timeLeft = 30;
//     timer = Timer.periodic(const Duration(seconds: 1), (t) {
//       if (timeLeft > 0) {
//         setState(() {
//           timeLeft--;
//         });
//       } else {
//         t.cancel();

//         if (!answered) {
//           setState(() {
//             answered = true;
//             selectedIndex = questions[currentIndex].correctIndex;
//           });

//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text(
//                 " Time over ! ",
//               ),
//               duration: const Duration(seconds: 3),
//             ),
//           );

//           Future.delayed(const Duration(seconds: 3), () {
//             goToNextQuestion();
//           });
//         } else {
//           goToNextQuestion();
//         }
//       }
//     });
//   }

//   void goToNextQuestion() {
//     if (currentIndex < questions.length - 1) {
//       setState(() {
//         currentIndex++;
//         selectedIndex = -1;
//         answered = false;
//       });
//       startTimer();
//     } else {
//       timer?.cancel();
//     }
//   }

//   @override
//   void dispose() {
//     timer?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//    return Consumer<QuestionProvider>(
//   builder: (context, provider, child) {
//     final questions = provider.questions; // من QuestionProvider
//     if (questions.isEmpty) {
//       return const Center(child: CircularProgressIndicator());
//     }

//     Question currentQ = questions[currentIndex];

//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               QuestionHeader(
//                 current: currentIndex + 1,
//                 total: questions.length,
//                 timeLeft: timeLeft,
//               ),
//               const SizedBox(height: 20),

//               Container(
//                 width: double.infinity,
//                 padding: const EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: const Color.fromARGB(255, 100, 63, 163),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Text(
//                   currentQ.text,
//                   style: const TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//               const SizedBox(height: 20),

//               Expanded(
//                 child: ListView.builder(
//                   itemCount: currentQ.options.length,
//                   itemBuilder: (context, index) {
//                     bool isCorrect = answered && index == currentQ.correctIndex;
//                     bool isWrong = answered &&
//                         index == selectedIndex &&
//                         selectedIndex != currentQ.correctIndex;

//                     return OptionTile(
//                       text: currentQ.options[index],
//                       isCorrect: isCorrect,
//                       isWrong: isWrong,
//                       onTap: () {
//                         if (!answered) {
//                           setState(() {
//                             selectedIndex = index;
//                             answered = true;
//                           });
//                         }
//                       },
//                     );
//                   },
//                 ),
//               ),

//               NextButton(
//                 isLast: currentIndex == questions.length - 1,
//                 onPressed: () {
//                   if (currentIndex == questions.length - 1) {
//                     // روح لصفحة النتيجة
//                   } else {
//                     goToNextQuestion();
//                   }
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   },
// );

//   }
// }


import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mindo/provider/questionprovider.dart';
import '../model/question_model.dart';
import '../widgets/option_tile.dart';
import '../widgets/question_header.dart';
import '../widgets/next_button.dart';

class QuizPage extends StatefulWidget {
  final String category;
  final int numberOfQuestions;
  
  const QuizPage({
    super.key,
    this.category = '9',           
    this.numberOfQuestions = 10,
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int timeLeft = 30;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    _loadInitialData();  
  }

  void _loadInitialData() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<QuestionProvider>();
      provider.loadQuestions(widget.category, widget.numberOfQuestions);
    });
  }

  void startTimer() {
    timer?.cancel();
    timeLeft = 30;
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (timeLeft > 0) {
        setState(() {
          timeLeft--;
        });
      } else {
        t.cancel();

        final provider = context.read<QuestionProvider>();
        if (!provider.isAnswered) {
          provider.selectAnswer(provider.correctAnswerIndex);

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Time's up!"),
              duration: Duration(seconds: 2),
            ),
          );

          Future.delayed(const Duration(seconds: 2), () {
            goToNextQuestion();
          });
        }
      }
    });
  }

  void goToNextQuestion() {
    final provider = context.read<QuestionProvider>();
    
    if (provider.currentQuestionIndex < provider.questions.length - 1) {
      provider.nextQuestion();
      startTimer();
    } else {
      timer?.cancel();
      _showResultDialog(provider);
    }
  }

  void _showResultDialog(QuestionProvider provider) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Quiz Complete!'),
        content: Text(
          'Your Score: ${provider.score}/${provider.questions.length}\n'
          'Percentage: ${((provider.score / provider.questions.length) * 100).toStringAsFixed(1)}%'
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              provider.resetQuiz();
              provider.loadQuestions(widget.category, widget.numberOfQuestions);
            },
            child: const Text('Play Again'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: const Text('Exit'),
          ),
        ],
      ),
    );
  }

  Question convertToQuestion(QuestionProvider provider) {
    final apiQuestion = provider.currentQuestion!;
    final options = provider.currentQuestionOptions;
    final correctIndex = provider.correctAnswerIndex;

    return Question(
      text: apiQuestion.question,
      options: options,
      correctIndex: correctIndex,
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
        backgroundColor: const Color.fromARGB(255, 100, 63, 163),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<QuestionProvider>(
            builder: (context, provider, child) {
              if (provider.isLoading) {
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 16),
                      Text('Loading questions...'),
                    ],
                  ),
                );
              }

              if (provider.errorMessage.isNotEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        size: 64,
                        color: Colors.red,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Error: ${provider.errorMessage}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          provider.loadQuestions(
                            widget.category, 
                            widget.numberOfQuestions
                          );
                        },
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                );
              }

              if (provider.questions.isEmpty) {
                return const Center(
                  child: Text('No questions available'),
                );
              }


              final currentQ = convertToQuestion(provider);

              if (timeLeft == 30 && timer == null) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  startTimer();
                });
              }

              return Column(
                children: [
                  QuestionHeader(
                    current: provider.currentQuestionIndex + 1,
                    total: provider.questions.length,
                    timeLeft: timeLeft,
                  ),
                  const SizedBox(height: 20),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 100, 63, 163),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      currentQ.text,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),

                  Expanded(
                    child: ListView.builder(
                      itemCount: currentQ.options.length,
                      itemBuilder: (context, index) {
                        bool isCorrect = provider.isAnswered && 
                            index == provider.correctAnswerIndex;
                        bool isWrong = provider.isAnswered &&
                            index == provider.selectedAnswerIndex &&
                            !provider.isSelectedAnswerCorrect();

                        return OptionTile(
                          text: currentQ.options[index],
                          isCorrect: isCorrect,
                          isWrong: isWrong,
                          onTap: () {
                            if (!provider.isAnswered) {
                              provider.selectAnswer(index);
                              timer?.cancel();
                            }
                          },
                        );
                      },
                    ),
                  ),

                  NextButton(
                    isLast: provider.currentQuestionIndex == 
                        provider.questions.length - 1,
                    onPressed: () {
                      if (provider.currentQuestionIndex == 
                        provider.questions.length - 1) {
                       // Navigator.pushNamed(context, routeName)
                      }
                      if (provider.currentQuestionIndex == 
                          provider.questions.length - 1) {
                        timer?.cancel();
                        _showResultDialog(provider);
                      } else {
                        goToNextQuestion();
                      }

                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
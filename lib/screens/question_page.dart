import 'package:bravo_french_book/models/answers_model.dart';
import 'package:bravo_french_book/widgets/main_drawer.dart';
import 'package:bravo_french_book/widgets/wave_background.dart';
import 'package:flutter/material.dart';
import 'package:bravo_french_book/widgets/app_bar.dart';
import '../models/questions.dart';

class QuestionPage extends StatefulWidget {
  static const routeName = '/question-page';
  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  int questionIndex = 0;
  int totalScore = 0;
  int falseScore = 0;
  bool answerWasSelected = false;
  bool correctAnswerSelected = false;
  bool endQuiz = false;

  void questionAnswered(bool answerScore) {
    setState(() {
      answerWasSelected = true;

      if (answerScore) {
        totalScore++;
        correctAnswerSelected = true;
      } else {
        falseScore++;
      }
    });
  }

  void nextQuestion() {
    setState(() {
      questionIndex++;
      answerWasSelected = false;
      correctAnswerSelected = false;
      endQuiz = false;
    });
  }

  void restartQuiz() {
    setState(() {
      questionIndex = 0;
      totalScore = 0;
      falseScore = 0;
      answerWasSelected = false;
      correctAnswerSelected = false;
      endQuiz = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBravo(context) as PreferredSizeWidget?,
      drawer: MainDrawer(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                height: 130.0,
                margin: const EdgeInsets.only(
                    bottom: 10.0, left: 30.0, right: 30.0),
                padding: const EdgeInsets.symmetric(
                    horizontal: 50.0, vertical: 20.0),
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    questions[questionIndex]['question'] as String,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ...(questions[questionIndex]['answers']
                      as List<Map<String, Object>>)
                  .map(
                (answer) => AnswersModel(
                  answerText: answer['answerText'] as String,
                  answerColor: answerWasSelected
                      ? answer['score'] as bool
                          ? Colors.green
                          : Colors.red
                      : null,
                  answerFunction: () {
                    if (answerWasSelected) {
                      return;
                    }

                    questionAnswered(answer['score'] as bool);
                  },
                ),
              ),
              (questionIndex + 1 < questions.length)
                  ? ElevatedButton(
                      onPressed: () {
                        if (!answerWasSelected) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'Take answer before going to next question'),
                            ),
                          );
                          return;
                        }
                        nextQuestion();
                      },
                      child: const Text('Next Question'),
                    )
                  : ElevatedButton(
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                          const Size(100, 40),
                        ),
                      ),
                      onPressed: () {
                        if (!answerWasSelected) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'Take answer before going to next question'),
                            ),
                          );
                          return;
                        }
                        setState(() {
                          endQuiz = true;
                        });
                      },
                      child: const Text('Finish!'),
                    ),
              (endQuiz == true)
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 80,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(
                              const Size(100, 40),
                            ),
                          ),
                          onPressed: () {
                            if (!answerWasSelected) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Take answer before going to next question'),
                                ),
                              );
                              return;
                            }
                            restartQuiz();
                          },
                          child: const Text('restart quiz'),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(
                              const Size(100, 40),
                            ),
                          ),
                          onPressed: () {
                            if (!answerWasSelected) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Take answer before going to next question'),
                                ),
                              );
                              return;
                            }
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) => WaveBackground()),
                                ),
                                (Route<dynamic> route) => false);
                          },
                          child: const Text('next quiz'),
                        ),
                      ],
                    )
                  : const SizedBox(
                      height: 2,
                    ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      maxRadius: 40,
                      backgroundColor: Colors.green,
                      child: Text(
                        totalScore.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CircleAvatar(
                      maxRadius: 50,
                      child: Text(
                        '${(questionIndex + 1).toString()}/${questions.length}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CircleAvatar(
                      maxRadius: 40,
                      backgroundColor: Colors.red,
                      child: Text(
                        falseScore.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:quizapp/quiz_brain.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: QuizPage(),
        backgroundColor: Colors.grey.shade900,
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];
  QuizBrain quizBrain = QuizBrain();

  // TODO: Tarea 1 -> random dados
  // TODO: Tarea 2 -> piano
  // TODO: Tarea 3 -> screen app 3

  void checkAnswer(bool answer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();

    if (answer == correctAnswer) {
      scoreKeeper.add(
        Icon(
          Icons.check,
          color: Colors.green,
        ),
      );
    } else {
      scoreKeeper.add(
        Icon(
          Icons.close,
          color: Colors.red,
        ),
      );
    }

    setState(() {
      quizBrain.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                quizBrain.getQuestionText(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: RaisedButton(
              onPressed: () {
                checkAnswer(true);
              },
              child: Text(
                'True',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.green,
            ),
          ),
        ),
        Expanded(
          child: Padding(
              padding: EdgeInsets.all(16),
              child: RaisedButton(
                onPressed: () {
                  checkAnswer(false);
                },
                child: Text(
                  'False',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.red,
              )),
        ),
        Text('Acá irán los marcadores'),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}

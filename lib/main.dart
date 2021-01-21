import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:quiz/QuizData/Quiz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Take A Quiz",
      home: ChangeNotifierProvider(
        create: (context) => Pro(),
        child: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<Pro>(context, listen: true);
    return pro.ansersleft1 > Quiz.allQuiz.length
        ? Result(
            sax: pro.sax,
            qalad: pro.qalad,
          )
        : Scaffold(
            appBar: AppBar(
              title: Text("Quiz-ka"),
              centerTitle: true,
            ),
            body: QuizBody(),
          );
  }
}

//Quiz screen
class QuizBody extends StatefulWidget {
  @override
  _QuizBodyState createState() => _QuizBodyState();
}

class _QuizBodyState extends State<QuizBody> {
  List<Quiz> quiz = [];
  @override
  void initState() {
    quiz = Quiz.allQuiz;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<Pro>(context, listen: true);
    var size = MediaQuery.of(context).size;
    return Container(
      height: MediaQuery.of(context).size.height * 1,
      width: double.infinity,
      color: Colors.deepOrangeAccent[100].withOpacity(0.3),
      child: Column(
        children: [
          SizedBox(
            height: size.height * .06,
          ),
          QuizStatus(size: size),
          SizedBox(
            height: size.height * .02,
          ),
          Text(
            "Q:" + " ${Quiz.allQuiz[pro.current].question}",
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(
            height: size.height * .01,
          ),
          QuizQuestionBody(size: size, quiz: Quiz.allQuiz),
          SizedBox(
            height: size.height * .07,
          ),
          Text(
            "developed and designed by abdirazak hashi ali  Semester Seven IT",
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(
            height: size.height * .01,
          ),
          Text(
            "phone no: 615592834",
            style: TextStyle(fontSize: 20.0),
          )
        ],
      ),
    );
  }
}

//Question Body
class QuizQuestionBody extends StatelessWidget {
  final Size size;
  final List<Quiz> quiz;
  const QuizQuestionBody({Key key, this.size, this.quiz}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * .4,
      width: double.infinity,
      color: Colors.blueGrey[100].withOpacity(0.6),
      child: ListView.builder(
        itemCount: quiz[0].answer.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          var pro = Provider.of<Pro>(context, listen: true);
          return Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(30.0),
              onTap: () {
                pro.getTapped(quiz[pro.current].answer[index]);

                if (pro.correct == quiz[pro.current].correctAnswer) {
                  pro.getAnswer(1);
                } else {
                  pro.getAnswer(0);
                }
                pro.next();
              },
              splashColor: Colors.green,
              child: Container(
                alignment: Alignment.center,
                height: size.height * .08,
                width: size.width * .9,
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                margin: EdgeInsets.symmetric(vertical: 13.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.white),
                child: Text(
                  "${quiz[pro.current].answer[index]}",
                  style: TextStyle(fontSize: 17.9),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

//Status Screen
class QuizStatus extends StatelessWidget {
  const QuizStatus({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<Pro>(context, listen: true);
    return Container(
      height: size.height * .13,
      width: size.width * .9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.purpleAccent[100].withOpacity(0.2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: size.height * .01,
                  ),
                  Text("SU\'AAL " +
                      " ${pro.answersLeft}/${Quiz.allQuiz.length}"),
                  SizedBox(
                    height: size.height * .015,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    height: size.height * .04,
                    width: size.width * .34,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.grey,
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: LinearProgressIndicator(
                          backgroundColor: Colors.white,
                        )),
                  )
                ],
              )
            ],
          ),
          VerticalDivider(
            color: Colors.grey,
            width: 2.0,
            thickness: 1.3,
          ),
          Row(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: size.height * .01,
                  ),
                  Text("Score-kaaga"),
                  SizedBox(
                    height: size.height * .008,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    height: size.height * .05,
                    width: size.width * .4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.grey,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: size.height * .04,
                              width: size.width * .12,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.green),
                              child: Icon(
                                Icons.done,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 1.0,
                            ),
                            Text("${pro.sax}", style: TextStyle(fontSize: 25.0))
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: size.height * .04,
                              width: size.width * .12,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.black),
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 1.0,
                            ),
                            Text("${pro.qalad}",
                                style: TextStyle(fontSize: 25.0))
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

//Result Screen
class Result extends StatelessWidget {
  final int sax, qalad;

  const Result({Key key, this.sax, this.qalad}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Natiijo"),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ThankYou()));
          },
          icon: Icon(Icons.close),
        ),
      ),
      body: ResultBody(
        sax: sax,
        qalad: qalad,
      ),
    );
  }
}

//Resiult Body
class ResultBody extends StatelessWidget {
  final int sax, qalad;

  const ResultBody({Key key, this.sax, this.qalad}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: MediaQuery.of(context).size.height * 1,
      width: double.infinity,
      color: Colors.blueAccent[100],
      child: Center(
        child: Container(
          height: size.height * .3,
          width: size.width * .4,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30.0)),
          child: Column(
            children: [
              Text("Mahad sanid"),
              SizedBox(
                height: size.height * .008,
              ),
              Text("Inta aa saxday   " + "$sax"),
              SizedBox(
                height: size.height * .008,
              ),
              Text("Inta aa Qaladay  " + "$qalad"),
              SizedBox(
                height: size.height * .008,
              ),
              qalad > sax
                  ? Icon(
                      Icons.thumb_down,
                      size: 40.0,
                    )
                  : Icon(
                      Icons.thumb_up,
                      size: 40.0,
                    )
            ],
          ),
        ),
      ),
    );
  }
}

//Thank You Screen
class ThankYou extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Is arag dambe"),
      ),
      body: Center(
        child: Text(
          "Waa ku mahadsantahay\n kaqeyb qaadashada",
          style: TextStyle(fontSize: 25.0),
        ),
      ),
    );
  }
}

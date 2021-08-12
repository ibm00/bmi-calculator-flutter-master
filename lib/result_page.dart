import 'package:flutter/material.dart';

import 'constant.dart';

class ResultPage extends StatelessWidget {
  ResultPage({this.bmi, this.result, this.note});
  final String bmi;
  final String result;
  final String note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Your Result',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                decoration: (BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kCardActiveColorHex,
                )),
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      result,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.greenAccent[700]),
                    ),
                    Text(
                      bmi,
                      style: kNumberStyle.copyWith(fontSize: 100),
                    ),
                    Text(
                      note,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.only(bottom: 13),
                  child: Center(
                    child: Text(
                      "RE-CALCULATE",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  width: double.infinity,
                  height: kConsHieght,
                  margin: EdgeInsets.only(top: 16),
                  color: kContainerColorHex,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

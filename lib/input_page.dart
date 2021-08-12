import 'package:bmi_calculator/clculato_brain.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'card_content.dart';
import 'constant.dart';
import 'reusable_card.dart';
import 'weight_and_age.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleColor = kCardDeactiveColorHex;
  Color femaleColor = kCardDeactiveColorHex;
  Gender gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    pressed: () {
                      setState(() {
                        gender = Gender.male;
                      });
                    },
                    coulor: gender == Gender.male
                        ? kCardActiveColorHex
                        : kCardDeactiveColorHex,
                    cardChild: CardContent(
                      iconType: FontAwesomeIcons.mars,
                      caption: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    pressed: () {
                      setState(() {
                        gender = Gender.female;
                      });
                    },
                    coulor: gender == Gender.female
                        ? kCardActiveColorHex
                        : kCardDeactiveColorHex,
                    cardChild: CardContent(
                      iconType: FontAwesomeIcons.venus,
                      caption: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Hieght',
                    style: kTxtStyle,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        kHeight.toString(),
                        style: kNumberStyle,
                      ),
                      Text(
                        "cm",
                        style: kTxtStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: kContainerColorHex,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 25),
                      overlayColor: Color(0x29EB1555),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xff7C7D88),
                    ),
                    child: Slider(
                        min: 120,
                        max: 220,
                        value: kHeight.toDouble(),
                        onChanged: (newValue) {
                          setState(() {
                            kHeight = newValue.round();
                          });
                        }),
                  )
                ],
              ),
              coulor: kCardActiveColorHex,
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ReusableCard(
                    cardChild: WeightAndAge(
                      minusPressed: () {
                        setState(() {
                          kWeight--;
                        });
                      },
                      plusPressed: () {
                        setState(() {
                          kWeight++;
                        });
                      },
                      cardCaption: "Weight",
                      startingValue: kWeight,
                    ),
                    coulor: kCardActiveColorHex,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardChild: WeightAndAge(
                      minusPressed: () {
                        setState(() {
                          kAge--;
                        });
                      },
                      plusPressed: () {
                        setState(() {
                          kAge++;
                        });
                      },
                      cardCaption: 'Age',
                      startingValue: kAge,
                    ),
                    coulor: kCardActiveColorHex,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              BMI calc = BMI(height: kHeight, weight: kWeight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                            bmi: calc.find(),
                            result: calc.result(),
                            note: calc.note(),
                          )));
            },
            child: Container(
              padding: EdgeInsets.only(bottom: 13),
              child: Center(
                child: Text(
                  "CALCULATE",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              width: double.infinity,
              height: kConsHieght,
              margin: EdgeInsets.only(top: 16),
              color: kContainerColorHex,
            ),
          )
        ],
      ),
    );
  }
}

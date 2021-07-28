import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../classes/drawer.dart';
import '../classes/MyTextfield.dart';
import '../classes/mydropdown.dart';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'package:store_redirect/store_redirect.dart';

class GeneralSecondary extends StatefulWidget {
  @override
  _GeneralSecondaryState createState() => _GeneralSecondaryState();
}

class _GeneralSecondaryState extends State<GeneralSecondary> {
  double score;
  double percentageScore;
  int scientificDivision = 1, literatureDivision = 2;
  int group = 1;
  String sciOrLit;
  List<String> years = ["2019", "2018", '2017', "2016", "2015"];
  List<String> governorates = [
    "كل المحافظات","الاسكندرية", "اسوان", "اسيوط", "البحيرة", "بني سويف", "القاهرة", "الدقهلية", "دمياط", "الفيوم", "الغربية",
    "الجيزة", "الاسماعيلية", "كفر الشيخ", "مطروح", "المنيا", "المنوفية", "الوادي الجديد", "شمال سيناء",
    "جنوب سيناء", "بورسعيد", "القليوبية", "قنا", "البحر الاحمر", "الشرقية", "سوهاج", "السويس", "الاقصر",
  ];
  String selectedYear = "2019";
  String selectedGovernorate = "كل المحافظات";
  String dropDownHintTextForYear = "اختر السنة";
  String dropDownHintTextForGovernorate = "اختر المحافظة";
  var textControllerDegrees = new TextEditingController();
  var textControllerPercentage = new TextEditingController();

  RateMyApp rateMyApp = RateMyApp (
    preferencesPrefix: 'rateMyApp_pro',
    minDays: 3,
    minLaunches: 13,
    remindDays: 2,
    remindLaunches: 8,
    googlePlayIdentifier: 'com.example.high_school',
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    rateMyApp.init().then((_) {
      if (rateMyApp.shouldOpenDialog) {
        rateMyApp.showStarRateDialog(
          context,
          title: 'Rate this app', // The dialog title.
          message: 'Do you like this app? \n Then take a little bit of your time to leave a rating', // The dialog message.
          // contentBuilder: (context, defaultContent) => content, // This one allows you to change the default dialog content.
          actionsBuilder: (context, stars) { // Triggered when the user updates the star rating.
            return [ // Return a list of actions (that will be shown at the bottom of the dialog).
              FlatButton(
                child: Text('OK'),
                onPressed: () async {
                  print('Thanks for the ' + (stars == null ? '0' : stars.round().toString()) + ' star(s) !');
                  StoreRedirect.redirect();

                  await rateMyApp.callEvent(RateMyAppEventType.rateButtonPressed);
                  Navigator.pop<RateMyAppDialogButton>(context, RateMyAppDialogButton.rate);
                },
              ),
            ];
          },
          ignoreIOS: false, // Set to false if you want to show the native Apple app rating dialog on iOS.
          dialogStyle: DialogStyle( // Custom dialog styles.
            titleAlign: TextAlign.center,
            messageAlign: TextAlign.center,
            messagePadding: EdgeInsets.only(bottom: 20),
          ),
          starRatingOptions: StarRatingOptions(), // Custom star bar rating options.
          onDismissed: () => rateMyApp.callEvent(RateMyAppEventType.laterButtonPressed), // Called when the user dismissed the dialog (either by taping outside or by pressing the "back" button).
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("تنسيق الثانوية العامة")),
        ),
        body: SingleChildScrollView(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "ادخل مجموعك بالدرجات: ",
                  style: TextStyle(fontSize: 25),
                ),
                MyTextField(
                  control: textControllerDegrees,
                  hintText: (score == null) ? "" : "$score",
                  onChange: (value) {
                    setState(() {
                      score = double.parse(value);
                      percentageScore = double.parse((score / 410 * 100).toStringAsFixed(2));
                      textControllerPercentage.text = (score / 410 * 100).toStringAsFixed(2);
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "ادخل مجموعك بالنسبة المئوية: ",
                  style: TextStyle(fontSize: 25),
                ),
                MyTextField(
                  control: textControllerPercentage,
                  hintText: (percentageScore == null) ? "" : "$percentageScore",
                  onChange: (value) {
                    setState(() {
                      percentageScore = double.parse(value);
                      score = double.parse((percentageScore * 410 / 100).toStringAsFixed(2));
                      textControllerDegrees.text = (percentageScore * 410 / 100).toStringAsFixed(2);
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(width: 30),
                    Text(
                      "علمي",
                      style: TextStyle(fontSize: 25),
                    ),
                    Radio(
                      value: 1,
                      groupValue: group,
                      onChanged: (value) {
                        setState(() {
                          group = value;
                          sciOrLit = "علمي";
                        });
                      },
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      "ادبي",
                      style: TextStyle(fontSize: 25),
                    ),
                    Radio(
                      value: 2,
                      groupValue: group,
                      onChanged: (value) {
                        setState(() {
                          group = value;
                          sciOrLit = "ادبي";
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10),
                MyDropDown(
                    hintText: dropDownHintTextForYear,
                    listItems: years,
                    onChange: (value) {
                      setState(() {
                        selectedYear = value;
                        dropDownHintTextForYear = selectedYear;
                      });
                    }),
                SizedBox(height: 10),
                MyDropDown(
                    hintText: dropDownHintTextForGovernorate,
                    listItems: governorates,
                    onChange: (value) {
                      setState(() {
                        selectedGovernorate = value;
                        dropDownHintTextForGovernorate = selectedGovernorate;
                      });
                    }),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Container(
                    width: 200,
                    child: FlatButton(
                      child: Text(
                        "اظهر التنسيق",
                        style: TextStyle(fontSize: 23, color: Colors.white),
                      ),
                      color: Colors.blueAccent,
                      onPressed: () {
                        Navigator.pushNamed(
                            context,
                            '/resultScreen',
                          arguments: {
                              "type": "عام",
                              "year": int.parse(selectedYear) ?? 2019,
                              "governorate": selectedGovernorate ?? "كل المحافظات",
                              "score": score ?? 410,
                              "division": sciOrLit ?? "علمي",
                          }
                        );
                      },

                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Center(
                  child: AdmobBanner (
                    adUnitId: "ca-app-pub-3173563832146472/9037720021",
                    adSize: AdmobBannerSize.LARGE_BANNER,
                  ),
                ),
              ],
            )),
          ),
        ),
        drawer: MyDrawer(),
    );
  }
}


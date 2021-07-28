import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:high_school/classes/drawer.dart';
import 'package:high_school/classes/mydropdown.dart';
import 'package:high_school/classes/MyTextfield.dart';
import 'package:admob_flutter/admob_flutter.dart';

class AzharSecondary extends StatefulWidget {
  @override
  _AzharSecondaryState createState() => _AzharSecondaryState();
}

class _AzharSecondaryState extends State<AzharSecondary> {
  double score;
  int  islamic = 1, lit = 2, sci = 3, boys = 4, girls = 5;
  int group = 1;
  int secondGroup = 2;
  String boysOrGirls;
  String litOrSciOrIslamic;
  List<String> years = ['2019','2018', '2017'];
  List<String> division = ['ادبي', 'علمي', 'شعبة اسلامية'];
  String selectedYear = "2017";
  String dropDownHintText = "اختر السنة";
  String dropDownHintTextForDivision = "اختر الشعبة";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("تنسيق ثانوي ازهري")),
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
                    hintText: (score == null) ? "" : "$score",
                    onChange: (value) {
                      setState(() {
                        score = double.parse(value);
                      });
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 30),
                      Text(
                        "اولاد",
                        style: TextStyle(fontSize: 25),
                      ),
                      Radio(
                        value: 4,
                        groupValue: group,
                        onChanged: (value) {
                          setState(() {
                            group = value;
                            boysOrGirls = "اولاد";
                          });
                        },
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Text(
                        "بنات",
                        style: TextStyle(fontSize: 25),
                      ),
                      Radio(
                        value: 5,
                        groupValue: group,
                        onChanged: (value) {
                          setState(() {
                            group = value;
                            boysOrGirls = "بنات";
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  MyDropDown(
                      hintText: dropDownHintText,
                      listItems: years,
                      onChange: (value) {
                        setState(() {
                          selectedYear = value;
                          dropDownHintText = selectedYear;
                        });
                      }),
                  SizedBox(height: 20,),
                  MyDropDown(
                      hintText: dropDownHintTextForDivision,
                      listItems: division,
                      onChange: (value) {
                        setState(() {
                          litOrSciOrIslamic = value;
                          dropDownHintTextForDivision = litOrSciOrIslamic;
                        });
                      }),
                  SizedBox(
                    height: 25,
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
                                "type": "ازهر",
                                "year": int.parse(selectedYear) ?? 2017,
                                "score": score ?? 700,
                                "boysOrGirls": boysOrGirls ?? "اولاد",
                                "litOrSciOrIslamic": litOrSciOrIslamic ?? "ادبي",
                              }
                          );

                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 35,),
                  Center(
                    child: AdmobBanner (
                      adUnitId: "ca-app-pub-3173563832146472/4240688917",
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

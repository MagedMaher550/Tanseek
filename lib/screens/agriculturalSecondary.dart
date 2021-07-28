import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:high_school/classes/drawer.dart';
import 'package:high_school/classes/mydropdown.dart';
import 'package:high_school/classes/MyTextfield.dart';
import 'package:admob_flutter/admob_flutter.dart';

class AgriculturalSecondary extends StatefulWidget {
  @override
  _AgriculturalSecondaryState createState() => _AgriculturalSecondaryState();
}

class _AgriculturalSecondaryState extends State<AgriculturalSecondary> {
  double score;
  int threeYears = 1, fiveYears = 2;
  int group = 1;
  String threeOrFive;
  List<String> years = ["2019", "2018", '2017', "2016", "2015"];
  String selectedYear = "2019";
  String dropDownHintTextForYear = "اختر السنة";
  List<String> governorates = [
    "كل المحافظات","الاسكندرية", "اسوان", "اسيوط", "البحيرة", "بني سويف", "القاهرة", "الدقهلية", "دمياط", "الفيوم", "الغربية",
    "الجيزة", "الاسماعيلية", "كفر الشيخ", "مطروح", "المنيا", "المنوفية", "الوادي الجديد", "شمال سيناء",
    "جنوب سيناء", "بورسعيد", "القليوبية", "قنا", "البحر الاحمر", "الشرقية", "سوهاج", "السويس", "الاقصر",
  ];
  String selectedGovernorate = "كل المحافظات";
  String dropDownHintTextForGovernorate = "اختر المحافظة";


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("تنسيق ثانوي زراعي")),
      ),
      body: SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20,),
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
                      Expanded(
                        child: Row (
                          children: [
                            Text(
                              "ثلاث سنوات",
                              style: TextStyle(fontSize: 25),
                            ),
                            Radio(
                              value: 1,
                              groupValue: group,
                              onChanged: (value) {
                                setState(() {
                                  group = value;
                                  threeOrFive = "ثلاث سنوات";
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row (
                          children: [
                            Text(
                              "خمس سنوات",
                              style: TextStyle(fontSize: 25),
                            ),
                            Radio(
                              value: 2,
                              groupValue: group,
                              onChanged: (value) {
                                setState(() {
                                  group = value;
                                  threeOrFive = "خمس سنوات";
                                });
                              },
                            ),
                          ],
                        ),
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
                  SizedBox(
                    height: 25,
                  ),
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
                  SizedBox(height: 10),
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
                                "type": "زراعي",
                                "year": int.parse(selectedYear) ?? 2019,
                                "score": score ?? 200,
                                "division": threeOrFive ?? "ثلاث سنوات",
                                "governorate": selectedGovernorate ?? "كل المحافظات"
                              }
                          );

                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 35,),
                  Center(
                    child: AdmobBanner (
                      adUnitId: "ca-app-pub-3173563832146472/2273001122",
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

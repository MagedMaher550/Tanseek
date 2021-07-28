import 'package:flutter/material.dart';
import 'package:high_school/classes/drawer.dart';
import 'package:admob_flutter/admob_flutter.dart';
import '../classes/data_input.dart';
import'../data/general_secondary/general_secondary_data_2015.dart';
import'../data/general_secondary/general_secondary_data_2016.dart';
import'../data/general_secondary/general_secondary_data_2017.dart';
import'../data/general_secondary/general_secondary_data_2018.dart';
import'../data/general_secondary/general_secondary_data_2019.dart';
import '../data/industrial_secondary/industrial_secondary_data_2015.dart';
import '../data/industrial_secondary/industrial_secondary_data_2016.dart';
import '../data/industrial_secondary/industrial_secondary_data_2017.dart';
import '../data/industrial_secondary/industrial_secondary_data_2018.dart';
import '../data/industrial_secondary/industrial_secondary_data_2019.dart';
import '../data/commercial_secondary/commercial_secondary_data_2015.dart';
import '../data/commercial_secondary/commercial_secondary_data_2016.dart';
import '../data/commercial_secondary/commercial_secondary_data_2017.dart';
import '../data/commercial_secondary/commercial_secondary_data_2018.dart';
import '../data/commercial_secondary/commercial_secondary_data_2019.dart';
import '../data/agricultural_secondary/agricultural_secondary_data_2015.dart';
import '../data/agricultural_secondary/agricultural_secondary_data_2016.dart';
import '../data/agricultural_secondary/agricultural_secondary_data_2017.dart';
import '../data/agricultural_secondary/agricultural_secondary_data_2018.dart';
import '../data/agricultural_secondary/agricultural_secondary_data_2019.dart';
import '../data/alazhar_secondary/alazhar_secondary_data_2017.dart';

bool showPercentage = false;


class Result extends StatefulWidget {
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {

    void fillList(List<Widget> yearImages, int limit, String path) {
      for (var i=1; i<limit; i++){
        yearImages.add(
            Column (
              children: [
                SizedBox(height: 30,),
                Center(
                  child: Image.asset(path + "$i.jpg"),
                )],
            )
        );
      }
    }
    bool isIn(String value, List<String> list){
      bool check = false;
      for(var i in list){
        if(i == value)
          check = true;
      }
      return check;
    }


    Map data = ModalRoute.of(context).settings.arguments;
    String type = data["type"];
    int year = data["year"];
    double score = data["score"];
    String division = data["division"];
    String selectedGovernorate = data["governorate"];
    String appTitle = "تنسيق الثانوية العامة";
    List<MyData> selectedYear;


    if(type == "عام") {

      if(year == 2019 && division == "ادبي")
        selectedYear = data_2019Literature;
      else if (year == 2019 && division == "علمي")
        selectedYear = data_2019Scientific;

      else if(year == 2018 && division == "ادبي")
        selectedYear = data_2018Literature;
      else if (year == 2018 && division == "علمي")
        selectedYear = data_2018Scientific;

      else if(year == 2017 && division == "ادبي")
        selectedYear = data_2017Literature;
      else if (year == 2017 && division == "علمي")
        selectedYear = data_2017Scientific;

      else if(year == 2016 && division == "ادبي")
        selectedYear = data_2016Literature;

      else if (year == 2016 && division == "علمي")
        selectedYear = data_2016Scientific;

      else if(year == 2015 && division == "ادبي")
        selectedYear = data_2015Literature;

      else if (year == 2015 && division == "علمي")
        selectedYear = data_2015Scientific;
    }
    if(type == "صناعي") {
      appTitle = "تنسيق الثانوي الصناعي";

      if(year == 2019 && division == "ثلاث سنوات")
        selectedYear = data_industrial_three_years_2019;

      else if (year == 2019 && division == "خمس سنوات")
        selectedYear = data_industrial_five_years_2019;

      else if(year == 2018 && division == "ثلاث سنوات")
        selectedYear = data_industrial_three_years_2018;

      else if (year == 2018 && division == "خمس سنوات")
        selectedYear = data_industrial_five_years_2018;

      else if(year == 2017 && division == "ثلاث سنوات")
        selectedYear = data_industrial_three_years_2017;

      else if (year == 2017 && division == "خمس سنوات")
        selectedYear = data_industrial_five_years_2017;

      else if(year == 2016 && division == "ثلاث سنوات")
        selectedYear = data_industrial_three_years_2016;

      else if (year == 2016 && division == "خمس سنوات")
        selectedYear = data_industrial_five_years_2016;

      else if(year == 2015 && division == "ثلاث سنوات")
        selectedYear = data_industrial_three_years_2015;

      else if (year == 2015 && division == "خمس سنوات")
        selectedYear = data_industrial_five_years_2015;
    }
    if(type == "تجاري") {
      appTitle = "تنسيق الثانوي التجاري";

      if(year == 2019 && division == "ثلاث سنوات")
        selectedYear = data_commercial_three_years_2019;

      else if (year == 2019 && division == "خمس سنوات")
        selectedYear = data_commercial_five_years_2019;

      else if(year == 2018 && division == "ثلاث سنوات")
        selectedYear = data_commercial_three_years_2018;

      else if (year == 2018 && division == "خمس سنوات")
        selectedYear = data_commercial_five_years_2018;

      else if(year == 2017 && division == "ثلاث سنوات")
        selectedYear = data_commercial_three_years_2017;

      else if (year == 2016 && division == "خمس سنوات")
        selectedYear = data_commercial_five_years_2016;

      else if(year == 2016 && division == "ثلاث سنوات")
        selectedYear = data_commercial_three_years_2016;

      else if (year == 2015 && division == "خمس سنوات")
        selectedYear = data_commercial_five_years_2015;

      else if (year == 2015 && division == "ثلاث سنوات")
        selectedYear = data_commercial_three_years_2015;

    }
    if(type == "زراعي") {
      appTitle = "تنسيق الثانوي الزراعي";

      if(year == 2019 && division == "ثلاث سنوات")
        selectedYear = data_agricultural_three_years_2019;

      else if (year == 2019 && division == "خمس سنوات")
        selectedYear = data_agricultural_five_years_2019;

      if(year == 2018 && division == "ثلاث سنوات")
        selectedYear = data_agricultural_three_years_2018;

      else if (year == 2018 && division == "خمس سنوات")
        selectedYear = data_agricultural_five_years_2018;

      if(year == 2017 && division == "ثلاث سنوات")
        selectedYear = data_agricultural_three_years_2017;

      else if (year == 2017 && division == "خمس سنوات")
        selectedYear = data_agricultural_five_years_2017;

      if(year == 2016 && division == "ثلاث سنوات")
        selectedYear = data_agricultural_three_years_2016;

      else if (year == 2016 && division == "خمس سنوات")
        selectedYear = data_agricultural_five_years_2016;

      if(year == 2015 && division == "ثلاث سنوات")
        selectedYear = data_agricultural_three_years_2015;

      else if (year == 2015 && division == "خمس سنوات")
        selectedYear = data_agricultural_five_years_2015;


    }
    if(type == "ازهر" && year == 2017) {
      appTitle = "تنسيق الثانوية الازهرية";
      String boysOrGirls = data["boysOrGirls"];
      String litOrSciOrIslamic = data["litOrSciOrIslamic"];

      if (boysOrGirls == "اولاد" && litOrSciOrIslamic == "ادبي"){
        selectedYear = data_azhar_2017_literature_boys;
      }  else if (boysOrGirls == "اولاد" && litOrSciOrIslamic == "علمي"){
        selectedYear = data_azhar_2017_scientific_boys;
      }  else if (boysOrGirls == "بنات" && litOrSciOrIslamic == "ادبي"){
        selectedYear = data_azhar_2017_literature_girls;
      } else if (boysOrGirls == "بنات" && litOrSciOrIslamic == "علمي"){
        selectedYear = data_azhar_2017_scientific_girls;
      } else if(litOrSciOrIslamic == "شعبة اسلامية"){
        selectedYear = data_azhar_2017_islamic;
      }

    }
    if (type == "ازهر" && year != 2017) {
      String boysOrGirls = data["boysOrGirls"];
      List<Widget> yearImages = [];

      if(year == 2019) {
        if(boysOrGirls == "اولاد")
          fillList(yearImages, 10, "assets/dataAzhar2019/boys/");
        else if (boysOrGirls == "بنات")
          fillList(yearImages, 12, "assets/dataAzhar2019/girls/");
      }
      if(year == 2018){
        String boysOrGirls = data["boysOrGirls"] ?? "اولاد";
        String litOrSciOrIslamic = data["litOrSciOrIslamic"] ?? "ادبي";

        if(litOrSciOrIslamic == "ادبي") {
          if(boysOrGirls == "اولاد")
            fillList(yearImages, 10, "assets/dataAzhar2018/literature/boys/");

          else if(boysOrGirls == "بنات")
            fillList(yearImages, 13, "assets/dataAzhar2018/literature/girls/");

        }
        else if(litOrSciOrIslamic == "علمي") {
          if(boysOrGirls == "اولاد")
            fillList(yearImages, 10, "assets/dataAzhar2018/scientific/boys/");
          else if(boysOrGirls == "بنات")
            fillList(yearImages, 12, "assets/dataAzhar2018/scientific/girls/");

        }
        else {
          fillList(yearImages, 10, "assets/dataAzhar2018/islamic/");
        }
      }

      return Scaffold (
        backgroundColor: Colors.white,
        appBar: AppBar (title: Center (child: Text("تنسيق ثانوية ازهرية"),),),
        body: SingleChildScrollView (
          child: Column (
              children: yearImages
          ),
        ),
      );
    }
    if(type != "ازهر" || (type == "ازهر" && year == 2017)) {
      final List<Column> faculties = [];
      void show() {

        List<String> acceptedRegions = [];

        if(selectedGovernorate != "كل المحافظات"){
          if(selectedGovernorate == "القاهرة"){
            acceptedRegions.add("القاهرة");
            acceptedRegions.add("عين شمس");
            acceptedRegions.add("مدينة السلام");
            acceptedRegions.add("مدينة نصر");
            acceptedRegions.add("حلوان");
          }
          else if(selectedGovernorate == "الشرقية"){
            acceptedRegions.add("الشرقية");
            acceptedRegions.add("الزقازيق");
          }
          else if(selectedGovernorate == "المنوفية"){
            acceptedRegions.add("المنوفية");
            acceptedRegions.add("مدينة السادات");
          }
          else if(selectedGovernorate == "البحر الاحمر"){
            acceptedRegions.add("البحر الاحمر");
            acceptedRegions.add("الغردقة");
          }
          else if(selectedGovernorate == "الجيزة"){
            acceptedRegions.add("الجيزة");
            acceptedRegions.add("6 اكتوبر");
          }
          else if(selectedGovernorate == "القليوبية"){
            acceptedRegions.add("القليوبية");
            acceptedRegions.add("بنها");
            acceptedRegions.add("شبرا الخيمة");
          }
          else if(selectedGovernorate == "الدقهلية") {
            acceptedRegions.add("الدقهلية");
            acceptedRegions.add("المنصورة");
          }
          else if(selectedGovernorate == "البحيرة"){
            acceptedRegions.add("البحيرة");
            acceptedRegions.add("دمنهور");
          }
          else if(selectedGovernorate == "الغربية"){
            acceptedRegions.add("الغربية");
            acceptedRegions.add("طنطا");
            acceptedRegions.add("المحلة الكبري");
          }
          else if(selectedGovernorate == "شمال سيناء"){
            acceptedRegions.add("شمال سيناء");
            acceptedRegions.add("العريش");
          }
          else {
            acceptedRegions.add(selectedGovernorate);
          }
        }

        if(type == "عام"){
          faculties.add(
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: FlatButton(
                          onPressed: (){
                            setState(() {
                              showPercentage = false;
                            });
                          },
                          child: Text("اظهر المجموع بالدرجات",  style: TextStyle(fontSize: 17),),
                        ),
                      ),
                      Expanded(
                        child: FlatButton(
                          onPressed: (){
                            setState(() {
                              showPercentage = true;
                            });
                          },
                          child: Text(" اظهر المجموع بالنسبة", style: TextStyle(fontSize: 17),),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 0.6,
                  )
                ],
              )
          );
        }

        for (var data in selectedYear) {
          if((data.res <= score && type == "ازهر") || (data.res <= score && (isIn(data.region, acceptedRegions) || selectedGovernorate == "كل المحافظات"))) {
            faculties.add(Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text("${data.college} ${data.region}",
                        style: TextStyle(fontSize: 20),),
                      flex: 4,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: (showPercentage && type == "عام") ? Text("${((data.res)/410 * 100).toStringAsFixed(2)}%", style: TextStyle(fontSize: 19),) :
                      Text("${data.res}",style: TextStyle(fontSize: 19),),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
                Divider(
                  color: Colors.black,
                  thickness: 0.6,
                )
              ],
            ));
          }
        }
      }
      show();
      return Scaffold(
        appBar: AppBar (
          title: Center(
            child: Text ("$appTitle"),
          ),
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            child: ListView (
              children: faculties,
            ),
          ),
        ),
        drawer: MyDrawer(),
      );
    }

    else
      return Container();

  }

}



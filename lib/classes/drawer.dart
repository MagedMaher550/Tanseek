import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final Function onTap;
  MyDrawer ({this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox (
      width: MediaQuery.of(context).size.width * 0.8,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Drawer(
          child: SingleChildScrollView(
            child: Column (
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(color: Colors.blue),
                  child: Padding(
                    padding: EdgeInsets.all(6),
                    child: Column (
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container (
                          child: Center(
                            child: Expanded(
                              child: Text (
                                "تنسيق المرحلة الثانوية",
                                style: TextStyle (fontSize: 30),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                      ],
                    ),
                  ),
                ),
                ListTile (
                  title: Text("ثانوية عامة", style: TextStyle(fontSize: 21),),
                  onTap: () {
                    Navigator.pop(context);
                   Navigator.pushNamed(context, '/');
                  },

                ),
                SizedBox(height: 10,),
                ListTile (
                  title: Text("ثانوية ازهرية", style: TextStyle(fontSize: 21),),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "/azharSecondary");
                  },
                ),
                SizedBox(height: 10,),
                ListTile (
                  title: Text("ثانوي صناعي", style: TextStyle(fontSize: 21),),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "/industrialSecondary");
                  },
                ),
                SizedBox(height: 10,),
                ListTile (
                  title: Text("ثانوي تجاري", style: TextStyle(fontSize: 21),),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "/commercialSecondary");
                  },
                ),
                SizedBox(height: 10,),
                ListTile (
                  title: Text("ثانوي زراعي", style: TextStyle(fontSize: 21),),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "/agriculturalSecondary");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

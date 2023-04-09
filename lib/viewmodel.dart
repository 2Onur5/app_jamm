
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckBoxUse extends StatefulWidget {
  const CheckBoxUse({Key? key}) : super(key: key);

  @override
  State<CheckBoxUse> createState() => CheckBoxUseState();
}

class CheckBoxUseState extends State<CheckBoxUse> {
  bool check1 = false;
  bool check2 = false;
  bool check3 = false;
  bool check4 = false;

  //Shared prefin çlışması
  @override
  void initState() {
    super.initState();
    load();
  }

//Shared pref için gerekli save ve load fonksiyonalrı
  load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      check1 = (prefs.getBool("Flutter")) ?? false;
      check2 = (prefs.getBool("Unity")) ?? false;
      check3 = (prefs.getBool("English")) ?? false;
      check4 = (prefs.getBool("Proje")) ?? false;
    });
  }

  save() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setBool("Flutter", check1);
      prefs.setBool("Unity", check2);
      prefs.setBool("English", check3);
      prefs.setBool("Proje", check4);
    });
  }

//Kalan gün sayısı için tarih belirleme
  DateTimeRange dateRange =
      DateTimeRange(start: DateTime.now(), end: DateTime(2023, 04, 30));

  @override
  Widget build(BuildContext context) {
    //kalan tarihi ekraan yazdırcaak değişken

    final difference = dateRange.duration;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Image(
              image: AssetImage("assets/resim.png"),
            ),
            const Text(
              "Akademi Nisan ayının görevlerinin bitmesine",
              style: TextStyle(fontSize: 17),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "son ",
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(5)),
                    height: 80,
                    width: 80,
                    child: Text(
                      "${difference.inDays}",
                      style: const TextStyle(fontSize: 50, color: Colors.white),
                    )),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "gün ",
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                )
              ],
            ),
            // ignore: avoid_unnecessary_containers
            Container(
              child: Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80),
                    ),
                    color: Colors.blue,
                    child: CheckboxListTile(
                        title: Text(
                          "Flutter Dersleri",
                          style: TextStyle(
                              color: Colors.white,
                              decoration:
                                  check1 ? TextDecoration.lineThrough : null),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: check1,
                        onChanged: (bool? value) {
                          setState(() {
                            check1 = value!;
                            save();
                          });
                        }),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80),
                    ),
                    color: Colors.blue,
                    child: CheckboxListTile(
                        title: Text(
                          "Unity Dersleri",
                          style: TextStyle(
                              color: Colors.white,
                              decoration:
                                  check2 ? TextDecoration.lineThrough : null),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: check2,
                        onChanged: (bool? value) {
                          setState(() {
                            check2 = value!;
                            save();
                          });
                        }),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80),
                    ),
                    color: Colors.green,
                    child: CheckboxListTile(
                        title: Text(
                          "İngilizce Dersleri",
                          style: TextStyle(
                              color: Colors.white,
                              decoration:
                                  check3 ? TextDecoration.lineThrough : null),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: check3,
                        onChanged: (bool? value) {
                          setState(() {
                            check3 = value!;
                            save();
                          });
                        }),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80),
                    ),
                    color: Colors.red,
                    child: CheckboxListTile(
                        title: Text(
                          "Proje Dersleri",
                          style: TextStyle(
                              color: Colors.white,
                              decoration:
                                  check4 ? TextDecoration.lineThrough : null),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: check4,
                        onChanged: (bool? value) {
                          setState(() {
                            check4 = value!;
                            save();
                          });
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

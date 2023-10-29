// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: Counterdown(),
    );
  }
}

class Counterdown extends StatefulWidget {
  const Counterdown({super.key});

  @override
  State<Counterdown> createState() => _CounterdownState();
}

//  هنا نكتب الكلاس
class _CounterdownState extends State<Counterdown> {
//  هنا نعرف المتغيرات ونضع الليست ونكتب الفونكشون
  Timer? stoptimer;
  // عمل متغير وقت ووضع قيمه له بصفر ثانية
  Duration duration = Duration(seconds: 0);
  // عمل متغير من نوع بولين تكون قيمته فولس
  bool isruning = false;
//  فونكشون بداخلها تايمة مربوط بمتغير عام
  starttimer() {
    stoptimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        //  تعريم متغير محلي وربطه بمتغير الوقت العام ذيادة واحد كل ثانية
        int newseconds = duration.inSeconds + 1;
        duration = Duration(seconds: newseconds);
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // هنا نكتب الفونكشون عند بدء التشغيل
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//  هنا نكتب الاب بار والبودي والزر الاعائم
// appBar: AppBar(
//   title: Text("Counterdown"),
// ),
      backgroundColor: Color.fromARGB(255, 33, 40, 43),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      // جعل المتغير العام للوقت يظهر بالسعات  وبجانبة صفر علي اليسار اذا كان اقل من رقمين
                      duration.inHours.toString().padLeft(2, "0"),
                      style: TextStyle(color: Colors.black, fontSize: 60),
                    ),
                  ),
                  Text(
                    "Hours",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      //  جعل المتغير العام للوقت يظهر بالدقائق ولا يتعدي الستين وبحانبة صفر علي الشمال اذا كان رقم واحد
                      duration.inMinutes
                          .remainder(60)
                          .toString()
                          .padLeft(2, "0"),
                      style: TextStyle(color: Colors.black, fontSize: 60),
                    ),
                  ),
                  Text(
                    "minutes",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                       //  جعل المتغير العام للوقت يظهر بالثواني ولا يتعدي الستين وبحانبة صفر علي الشمال اذا كان رقم واحد
                      duration.inSeconds
                          .remainder(60)
                          .toString()
                          .padLeft(2, "0"),
                      style: TextStyle(color: Colors.black, fontSize: 60),
                    ),
                  ),
                  Text(
                    "Seconds",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 27),
          //  قاعدة ايف المختصرة اذا كان المتغير من نوع بولين ترو او فولس يظهر ازرار معينة
          isruning
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // اذا كان التيمر يعمل ينفذ هوت ريفريش ثم يوقف التايمر
                        if (stoptimer!.isActive) {
                          setState(() {
                            stoptimer!.cancel();
                          });
                        } else {
                          // اذا كان التايمر متوقف يشغل الفونكشون التي بداخلها التايمر
                          starttimer();
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                        padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                      ),
                      child: Text(
                        // اذا كان التايمر يعمل يظهر كلمة ايقاف واذا كان لايعمل يظهر تخطي
                        (stoptimer!.isActive) ? "stop timer" : "resume",
                        style: TextStyle(fontSize: 19, color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 22),
                    ElevatedButton(
                      onPressed: () {
                        //  عمل توقيف للتايمر
                        stoptimer!.cancel();
                        // عمل هوت ريفريش ثم جعل المتغير العام للوقت يساوي صفر وجعل المتغير البولين بفولس
                        setState(() {
                          duration = Duration(seconds: 0);
                          isruning = false;
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                        padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                      ),
                      child: Text(
                        "CAncel",
                        style: TextStyle(fontSize: 19, color: Colors.white),
                      ),
                    )
                  ],
                )
              : ElevatedButton(
                  onPressed: () {
                    //  بدء تشغيل الفونكشون التي بداخلها تايمر بيذود 1 كل ثانية
                    starttimer();
                    // تحويل المتغير البولين الي ترو لاظهار الاذرار الاخري
                    isruning = true;
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                  ),
                  child: Text(
                    "start Timer",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                )
        ],
      ),
    );
  }
}

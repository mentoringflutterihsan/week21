import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class CheckAge extends StatefulWidget {
  CheckAge({Key key}) : super(key: key);

  @override
  _CheckAgeState createState() => _CheckAgeState();
}

class _CheckAgeState extends State<CheckAge> {
  String hari = "", bulan = "", tahun = "";
  int h, b, t;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lahir"),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              f1();
            },
            child: Text('choose date'),
          ),
          Text(tahun + " " + bulan + " " + hari + " "),
        ],
      ),
    );
  }

  Future f1() async {
    DateTime tanggal = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now());
    setState(() {
      h = int.parse(DateFormat("dd").format(tanggal));
      b = int.parse(DateFormat("MM").format(tanggal));
      t = int.parse(DateFormat("yy").format(tanggal));

      int h1 = int.parse(DateFormat("dd").format(DateTime.now()));
      int b1 = int.parse(DateFormat("MM").format(DateTime.now()));
      int t1 = int.parse(DateFormat("yy").format(DateTime.now()));

      if (h1 - h >= 0) {
        hari = (h1 - h).toString() + " hari";
      } else {
        hari = (h1 + 30 - h).toString() + " hari";
        b1 = b1 - 1;
      }

      if (b1 - b >= 0) {
        bulan = (b1 - b).toString() + " bulan";
      } else {
        bulan = (b1 + 12 - b).toString() + " bulan";
        t1 = t1 - 1;
      }
      tahun = (t1 - t).toString() + " tahun";
    });
  }
}

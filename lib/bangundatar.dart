import 'package:flutter/material.dart';
import 'dart:math';

class BangunDatar extends StatefulWidget {
  BangunDatar({Key key}) : super(key: key);
  @override
  _BangunDatarState createState() => _BangunDatarState();
}

class _BangunDatarState extends State<BangunDatar> {
  TextEditingController varSisi = new TextEditingController();
  TextEditingController varJariJari = new TextEditingController();
  TextEditingController varPanjang = new TextEditingController();
  TextEditingController varTinggi = new TextEditingController();
  int sisi, panjang, r, tinggi;
  int luaspersegipanjang = 0;
  double luaslingkaran = 0;
  int luaspersegi = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.format_shapes_outlined),
                  child: Text('Persegi'),
                ),
                Tab(
                  icon: Icon(Icons.add_circle_outline_sharp),
                  child: Text('Lingkaran'),
                ),
                Tab(
                    icon: Icon(Icons.format_shapes_sharp),
                    child: Text('Persegi Panjang')),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              persegi(),
              lingkaran(),
              persegiPanjang(),
            ],
          ),
        ),
      ),
    );
  }

  persegi() {
    return Column(
      children: <Widget>[
        TextField(
          keyboardType: TextInputType.number,
          controller: varSisi,
          decoration:
              InputDecoration(hintText: 'masukkan sisi', labelText: 'sisi'),
        ),
        RaisedButton(
          onPressed: () {
            setState(() {
              sisi = int.parse(varSisi.text);
              luaspersegi = sisi * sisi;
            });
          },
          child: Text('Hitung'),
        ),
        Text(luaspersegi.toString()),
      ],
    );
  }

  lingkaran() {
    return Column(
      children: <Widget>[
        TextField(
          keyboardType: TextInputType.number,
          controller: varJariJari,
          decoration: InputDecoration(
              hintText: 'masukkan jari jari', labelText: 'jari jari'),
        ),
        RaisedButton(
          onPressed: () {
            setState(() {
              r = int.parse(varJariJari.text);
              luaslingkaran = r * 3.14 * 3.14;
            });
          },
          child: Text('Hitung'),
        ),
        Text(luaslingkaran.toString()),
      ],
    );
  }

  persegiPanjang() {
    return Column(
      children: <Widget>[
        TextField(
          keyboardType: TextInputType.number,
          controller: varPanjang,
          decoration: InputDecoration(
              hintText: 'masukkan panjang', labelText: 'panjang'),
        ),
        TextField(
          keyboardType: TextInputType.number,
          controller: varTinggi,
          decoration: InputDecoration(
              hintText: 'masukkan tinggi', labelText: 'panjang'),
        ),
        RaisedButton(
          onPressed: () {
            setState(() {
              panjang = int.parse(varPanjang.text);
              tinggi = int.parse(varTinggi.text);
              luaspersegipanjang = panjang * tinggi;
            });
          },
          child: Text('Hitung'),
        ),
        Text(luaspersegipanjang.toString()),
      ],
    );
  }
}

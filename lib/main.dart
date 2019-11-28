import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TUGAS 3',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Hari Olah Raga Nasional 2019'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final sportdata = [
    {
      "name"  : "Angkat Besi",
      "des"   : "Olah Raga dengan mengangkat beban besi",
      "pic"   : "angkatbesi.jpg"
    },
    {
      "name"  : "Bulu Tangkis",
      "des"   : "Olah Raga bulu tngkis dapat di mainkan ganda ataupung singgel",
      "pic"   : "bulutangkis.jpg"
    },
    {
      "name"  : "Dayung",
      "des"   : "Olah Raga mendayung perahu",
      "pic"   : "dayung.jpg"
    },
    {
      "name"  : "Lempar Lembing",
      "des"   : "Olah Raga melempar tombak sejauh mungkin",
      "pic"   : "lembing.jpg"
    },
    {
      "name"  : "Panahan",
      "des"   : "Olah Raga panahan adalah cabang olah raga menggunakan panah",
      "pic"   : "panahan.jpg"
    },
    {
      "name"  : "Panjat Tebing",
      "des"   : "Olah Raga memanjat tebign dengan catatan waktu tercepat",
      "pic"   : "panjat.jpg"
    },
    {
      "name"  : "Renang",
      "des"   : "Olah Raga lomba renang dengan berbagai gaya renang",
      "pic"   : "renang.jpg"
    },
    {
      "name"  : "Balap Sepatu Roda",
      "des"   : "Olah Raga balapan dengan menggunakan sepatu roda",
      "pic"   : "sepaturoda.jpg"
    },
    {
      "name"  : "Balap Sepeda",
      "des"   : "Olah Raga dengan menggunakan sepeda dengan waktu tercepat",
      "pic"   : "sepeda.jpg"
    },
    {
      "name"  : "Menembak",
      "des"   : "Olah Raga menembak dengan melihat akurasi dan waktu menyeesaikan sasaran",
      "pic"   : "tembak.jpg"
    },
    {
      "name"  : "Bola Voli",
      "des"   : "Olah Raga Tim dengan menggunakan bola volly",
      "pic"   : "voley.jpg"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text(widget.title),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3 ,mainAxisSpacing: 2 ,crossAxisSpacing: 2,),
        itemCount   : sportdata.length,
        itemBuilder : (context, index) {
          return  GestureDetector(
            onTap: () {
              print(sportdata[index]['name']);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen( sportdata[index]['name'], sportdata[index]['des'], sportdata[index]['pic'] ),
                ),
              );
            },
            child: Image.asset('assets/images/'+ sportdata[index]['pic'] , fit: BoxFit.cover,)
        );
      },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget{
  final String name;
  final String img;
  final String des;
  DetailScreen(this.name, this.des, this.img);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
          leading: IconButton(icon:Icon(Icons.arrow_back),
            onPressed:() => Navigator.pop(context, false),
          )
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Image.asset('assets/images/'+ img),
            Padding( padding: EdgeInsets.only(bottom: 20),),
//            padding:EdgeInsets.all(2)
            Text(name,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ), ),
            Padding( padding: EdgeInsets.only(bottom: 20),),
//            padding:EdgeInsets.all(2)
            Text(des,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
              ), ),
            Padding( padding: EdgeInsets.only(bottom: 20),),
          ],
        ),
      ),
    );
  }
}

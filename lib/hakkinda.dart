import 'package:flutter/material.dart';

class Hakkinda extends StatefulWidget {
  @override
  _HakkindaState createState() => _HakkindaState();
}

class _HakkindaState extends State<Hakkinda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text('HAKKINDA'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text('Bu uygulama Dr. Öğretim Üyesi Ahmet Cevahir ÇINAR tarafından yürütülen'
                  ' 3004881 kodlu ders kapsamında 173004002 numaralı Diyar Özcan'
                  ' tarafından yapılmıştır', style: TextStyle(fontSize: 30.0),),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 36.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: Text(' << GERİ', style: TextStyle(fontSize: 35.0),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

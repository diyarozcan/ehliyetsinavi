import 'package:flutter/material.dart';

class Bitir extends StatefulWidget {
  @override
  _BitirState createState() => _BitirState();
}

class _BitirState extends State<Bitir> {
  @override
  Widget build(BuildContext context) {
    var data = [];
    data = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(' Sınavınız Sonlanmıştır', style: TextStyle(fontSize: 40.0, color: Colors.white)),
            Text(data[0].toString(), style: TextStyle(fontSize: 30.0, color: Colors.white),),
            Text(data[1].toString(), style: TextStyle(fontSize: 30.0, color: Colors.white),),
            Text(data[2].toString(), style: TextStyle(fontSize: 30.0, color: Colors.white),),
            Text(data[3].toString(), style: TextStyle(fontSize: 30.0, color: Colors.white),),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: Text('Çıkış', style: TextStyle(fontSize: 35.0),),
            ),
          ],
        ),
      ),
    );
  }
}

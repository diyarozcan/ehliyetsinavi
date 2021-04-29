import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ehliyetsinavi/sorular.dart';
import 'package:ehliyetsinavi/hakkinda.dart';
import 'package:ehliyetsinavi/bitir.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MOBİL UYGULAMA DENEME',
      theme: ThemeData(
       primarySwatch: Colors.blueGrey,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/sorular': (context) => Sorular(),
        '/bitir': (context) => Bitir(),
        '/hakkinda': (context) => Hakkinda(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String adSoyad = '';
  String tcNo = '';

  void kontrol() {
    if ((adSoyad.length > 3) && (tcNo.length == 11)) {
      var data = [];
      data.add(adSoyad);
      data.add(tcNo);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Sorular(),
            settings: RouteSettings(
              arguments: data,
            ),
          ));
    } else {
    }
  }

  void _adSoyadKaydet(String text) {
    setState(() {
      adSoyad = text;
    });
  }

  void _tcNoKaydet(String text) {
    setState(() {
      tcNo = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool butonpasif = true;
    if ((adSoyad.length > 3) && (tcNo.length == 11)) {
      butonpasif = false;
    } else {
      butonpasif = true;
    }

    return Scaffold( backgroundColor: Colors.teal,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text('EHLİYET SINAVI', style: TextStyle(fontSize: 100.0, color: Colors.white)),
            Text("Giriş", style: TextStyle(fontSize: 80.0, color: Colors.white),),
            Text('Adınız ve Soyadınız:', style: TextStyle(fontSize: 20.0, color: Colors.white),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 300,
                child: TextFormField(
                  decoration: const InputDecoration(),
                  keyboardType: TextInputType.text,
                  inputFormatters: [
                    FilteringTextInputFormatter.singleLineFormatter
                  ],
                  onChanged: (text) {
                    _adSoyadKaydet(text);
                  },
                ),
              ),
            ),
            Text('TC Kimlik Numaranız:', style: TextStyle(fontSize: 20.0, color: Colors.white),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 300,
                child: TextFormField(
                  maxLength: 11,
                  decoration: const InputDecoration(),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onChanged: (text) {
                    _tcNoKaydet(text);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: ElevatedButton(
                onPressed: butonpasif ? null : kontrol,
                child: Text('SINAVI BAŞLAT', style: TextStyle(fontSize: 20.0),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Hakkinda()),
                  );
                },
                child: Text('HAKKINDA', style: TextStyle(fontSize: 20.0),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

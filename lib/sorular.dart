import 'dart:async';
import 'package:ehliyetsinavi/bitir.dart';
import 'package:flutter/material.dart';

class Sorular extends StatefulWidget {
  @override
  _SorularState createState() => _SorularState();
}

String zamaniFormatla(int milisaniye) {
  var saniye = milisaniye ~/ 1000;
  var dakika = ((saniye % 3600) ~/ 60).toString().padLeft(2, '0');
  var saniyeler = (saniye % 60).toString().padLeft(2, '0');

  return "$dakika:$saniyeler";
}

class _SorularState extends State<Sorular> {
  String adSoyad = '';
  String tcNo = '';

  int mevcutsoru = 0;
  String mevcutcevap = '';
  int puan = 0;
  int kullanilansure = 0;

  Stopwatch _sayac;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _sayac = Stopwatch();
    _timer = new Timer.periodic(new Duration(seconds: 1), (timer) {
      setState(() {});
    });
    mevcutsoru = 0;
    mevcutcevap = '';
    puan = 10;
    kullanilansure = 0;
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void BitireYolla(){
    var data = [];
    data.add(adSoyad);
    data.add(tcNo);
    data.add(puan.toString());
    data.add(zamaniFormatla(kullanilansure));
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Bitir(),
          settings: RouteSettings(
            arguments: data,
          ),
        ));
  }

  var sorular = [
    {
      'soru': 'İlkyardımın ABC si olan B neyi ifade eder?',
      'cevaplar': ['A-)' 'Vücut ısısı düşürülmesi', 'B-)' 'Solunum değerlendirilmesini', 'C-)' 'Kan dolaşımı dengesini'],
      'dogrucevap': 'B-)' 'Solunum değerlendirilmesini'
    },
    {
      'soru': 'Aşağıdaki organlardan hangisi göğüs boşluğunda bulunur?',
      'cevaplar': [ 'A-)' 'Mide', 'B-)' 'Böbrekler', 'C-)''Akciğerler'],
      'dogrucevap': 'C-)' 'Akciğerler'
    },
    {
      'soru': 'Aşağıdakilerden hangisi, kazazedenin solunum yollarının tıkanması durumunda ortaya çıkar?',
      'cevaplar': ['A-)' 'Kandaki oksijen oranının artması', 'B-)' 'Oksijenin akciğerlere ulaşamaması', 'C-)' 'Kandaki karbondioksit oranının düşmesi'],
      'dogrucevap': 'B-)' 'Oksijenin akciğerlere ulaşamaması'
    },
    {
      'soru': 'Boyun kırıklarında, yanlış taşıma ve gereksiz hareketler yapılması aşağıdakilerden hangisine neden olur?',
      'cevaplar': [ 'A-)' 'Saç dökülmesine', 'B-)' 'Omurilik zedelenmesine', 'C-)' 'Bilinç seviyesinin artmasına'],
      'dogrucevap': 'B-)' 'Omurilik zedelenmesine'
    },
    {
      'soru': 'Aşağıdakilerden hangisi burkulan bölgenin şişmesini önlemek amacıyla yapılır?',
      'cevaplar': [ 'A-)' 'Burkulan bölgenin kalp seviyesinden yüksekte tutulması', 'B-)' ' Burkulan bölgenin sürekli hareket ettirilmesi', 'C-)' 'Burkulan bölgeye masaj yapılması'],
      'dogrucevap': 'A-)' 'Burkulan bölgenin kalp seviyesinden yüksekte tutulması'
    },
    {
      'soru': 'Koma hâlindeki kazazedeye aşağıdakilerden hangisi yapılmaz?',
      'cevaplar': ['A-)' 'Solunum ve nabız kontrolü', 'B-)' 'Sıkan giysilerin gevşetilmesi', 'C-)' 'Ağızdan yiyecek, içecek verilmesi'],
      'dogrucevap': 'C-)' 'Ağızdan yiyecek, içecek verilmesi'
    },
    {
      'soru': ' Motorlu, motorsuz ve özel amaçlı taşıtlar ile iş makineleri ve lastik tekerlekli traktörlerin genel adı aşağıdakilerden hangisidir?',
      'cevaplar': ['A-)' 'Araç', 'B-)' 'Ticari taşıt', 'C-)' 'Arazi taşıtı '],
      'dogrucevap': 'A-)' 'Araç'
    },
    {
      'soru': 'Azami ağırlığı 3,5 tonu geçen araçların şoförlerinin kaç saatten fazla araç sürmesi yasaktır?',
      'cevaplar': [ 'A-)' '1.5', 'B-)' '2.5', 'C-)' '4.5'],
      'dogrucevap': 'C-)' '4.5'
    },
    {
      'soru': 'Saatte 120 kilometre hızla seyreden bir sürücü, önündeki araca en fazla kaç metre yaklaşabilir?',
      'cevaplar': ['A-)' '30', 'B-)' '40', 'C-)' '60'],
      'dogrucevap': 'C-)' '60'
    },
    {
      'soru': 'Trafik kazasına karışan sürücü yaralanmamış ise aşağıdakilerden hangisini yapmak zorundadır?',
      'cevaplar': ['A-)' 'Akan trafiği kontrol etmek', 'B-)' 'Yolu hemen trafiğe açmak', 'C-)' 'Işıklı işaret veya yansıtıcı cihazları koymak'],
      'dogrucevap': 'C-)' 'Işıklı işaret veya yansıtıcı cihazları koymak'
    },
  ];

  void kontrolEt() {
    if (mevcutsoru > 8) {
      mevcutsoru = 0;
      _timer.cancel();
      BitireYolla();
    } else {
      if (mevcutcevap == sorular[mevcutsoru]['dogrucevap']) {
        puan = puan + 10;
        mevcutsoru++;
        kullanilansure = kullanilansure + _sayac.elapsedMilliseconds;
        _sayac.reset();
      } else {
        mevcutsoru++;
        kullanilansure = kullanilansure + _sayac.elapsedMilliseconds;
        _sayac.reset();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var data = [];
    data = ModalRoute.of(context).settings.arguments;
    adSoyad = data[0];
    tcNo = data[1];

    _sayac.start();
    if (_sayac.elapsedMilliseconds > 14999 && mevcutsoru < 9) {
      kullanilansure = kullanilansure + _sayac.elapsedMilliseconds;
      _sayac.reset();
      mevcutsoru++;
    }
    if (mevcutsoru == 9 && _sayac.elapsedMilliseconds > 14999) {
      Future.delayed(Duration.zero, () async {
        _sayac.reset();
        _sayac.stop();
        _timer.cancel();
        mevcutsoru = 0;
        BitireYolla();
      });
    }

    List cevaplistesi = [];
    for (var y in sorular[mevcutsoru]['cevaplar']) {
      cevaplistesi.add(y);
    }

    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Sınav Soruları', style: TextStyle(fontSize: 60.0)),
            Text('A Kitapçığı', style: TextStyle(fontSize: 60.0)),
            Text('Ad-Soyad: ' + adSoyad, style: TextStyle(fontSize: 18.0)),
            Text('TC Kimlik No: ' + tcNo, style: TextStyle(fontSize: 18.0)),
            Text(sorular[mevcutsoru]['soru'].toString(), style: TextStyle(fontSize: 30, color: Colors.white), textAlign: TextAlign.center,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    mevcutcevap = cevaplistesi[0].toString();
                  });
                  kontrolEt();
                },
                child: Text(
                  cevaplistesi[0],
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    mevcutcevap = cevaplistesi[1].toString();
                  });
                  kontrolEt();
                },
                child: Text(
                  cevaplistesi[1],
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    mevcutcevap = cevaplistesi[2].toString();
                  });
                  kontrolEt();
                },
                child: Text(
                  cevaplistesi[2],
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                child: Text('ANASAYFA',  style: TextStyle(fontSize: (20.0), backgroundColor: Colors.red),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

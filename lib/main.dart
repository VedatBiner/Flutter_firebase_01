/*
Firebase Uygulaması
Önce ekran tasarımı
 */
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String ad, id, kategori;
  double fiyat;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.blue,
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.cyan),
          primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Ürün Envanteri"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Ürün Adı",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width:2.0,
                      ),
                    ),
                  ),
                  onChanged: (String urunAdi){
                    urunAdiAdiAl(urunAdi);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Ürün Id",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width:2.0,
                      ),
                    ),
                  ),
                  onChanged: (String urunIdsi){
                    urunIdsiAl(urunIdsi);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Ürün Kategorisi",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width:2.0,
                      ),
                    ),
                  ),
                  onChanged: (String urunKategorisi){
                    UrunKategorisiAl(urunKategorisi);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Ürün Fiyatı",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width:2.0,
                      ),
                    ),
                  ),
                  onChanged: (String urunFiyati){
                    urunFiyatiAl(urunFiyati);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void urunAdiAdiAl(String urunAdi) {
    ad = urunAdi;
  }

  void urunIdsiAl(String urunIdsi) {
    id = urunIdsi;
  }

  void UrunKategorisiAl(String urunKategorisi) {
    kategori = urunKategorisi;
  }

  void urunFiyatiAl(String urunFiyati) {
    fiyat = double.parse(urunFiyati);
  }
}




// https://www.youtube.com/watch?v=9le0wdmc4iM&list=PLLTtZhOwITSgin11j9TIQhf1EvybOxZUw&index=3&ab_channel=SanalAkademiD%C3%BCnyas%C4%B1
// ders3 6:15 ile devam
/*
Firebase Uygulaması
Önce ekran tasarımı
 */
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late String ad, id, kategori;
  late double fiyat;
  @override
  Widget build(BuildContext context) {
    ButtonStyle style = ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
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
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: style,
                      child: const Text("Ekle"),
                      onPressed: () {
                        veriEkle();
                      },
                    ),
                    ElevatedButton(
                      style: style,
                      child: const Text("Oku"),
                      onPressed: () {
                        veriOku();
                      },
                    ),
                    ElevatedButton(
                      style: style,
                      child: const Text("Güncelle"),
                      onPressed: () {
                        veriGuncelle();
                      },
                    ),
                    ElevatedButton(
                      style: style,
                      child: const Text("Sil"),
                      onPressed: () {
                        veriSil();
                      },
                    ),
                  ],
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

  void veriEkle() {
    final firebaseInstance = FirebaseFirestore.instance;
    print("Eklendi");
    //veri tabanı yolu
    DocumentReference veriYolu = firebaseInstance.collection("urunler").doc(ad);
    // çoklu veriyi map ile göndereceğiz.
    Map<String, dynamic> urunler = {
      "urunAdi" : ad,
      "urunId" : id,
      "urunKategori" : kategori,
      "urunFiyat" : fiyat,
    };
    veriYolu.set(urunler).whenComplete(() {
      print("$ad eklendi");
    });
  }

  Future<void> veriOku() async {
    final firebaseInstance = FirebaseFirestore.instance;
    final QuerySnapshot<Map<String, dynamic>> querySnapshot = await firebaseInstance.collection("urunler").get();
    DocumentReference veriYolu = firebaseInstance.collection("urunler").doc(ad);
    print("Okundu");
    print(veriYolu);

    // Firebase veri okuma - Hata var ?
    /*
    DocumentReference veriYolu = firebaseInstance.collection("urunler").doc(ad);

    veriYolu.get().then((alinanVeri) {
      print(alinanVeri.data["urunAdi"]);
      print(alinanVeri.data["urunId"]);
      print(alinanVeri.data["urunKategori"]);
      print(alinanVeri.data["urunFİyat"]);
    });
     */

  }

  void veriGuncelle() {
    print("Güncellendi");
  }

  void veriSil() {
    print("Silindi");
  }
}




// https://www.udemy.com/course/15-derste-flutter-ile-firebase-kullanm-temelleri/
// ders12 ile devam
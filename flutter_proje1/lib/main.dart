import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyProject());
}

class MyProject extends StatelessWidget {
  const MyProject({super.key});
  Widget _Textler(
    String metin,
    double boyut, {
    TextAlign? textfont,
    FontWeight textweight = FontWeight.bold,
  }) {
    return Text(
      metin,
      style: TextStyle(fontWeight: textweight, fontSize: boyut),
      textAlign: textfont,
    );
  }

  final String url =
      "https://img.magnific.com/ucretsiz-fotograf/cizgili-gomlekli-genc-sakalli-adam_273609-5677.jpg?semt=ais_hybrid&w=740&q=80";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          title: Text(
            "Profilim",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: const Color.fromARGB(255, 255, 254, 254),
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Column(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(url),
              ),
              SizedBox(height: 20),
              _Textler("Hakkımda", 25),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  elevation: 8,
                  shadowColor: Colors.black.withValues(alpha: 0.5),
                  color: Colors.grey.shade200,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.info, color: Colors.green),
                            SizedBox(width: 15),
                            _Textler("Okul Bilgileri", 20),
                          ],
                        ),
                      ),
                      Divider(color: Colors.grey.shade300, height: 12),
                      _Card_Satirlari(
                        "Okul:",
                        18,
                        "Ankara Hacı Bayram Veli Üniversitesi",
                        18,
                      ),
                      Divider(color: Colors.grey.shade300, height: 12),
                      _Card_Satirlari(
                        "Fakülte:",
                        18,
                        "İktisadi ve İdari Bilimler Fakültesi",
                        18,
                      ),
                      Divider(color: Colors.grey.shade300, height: 12),
                      _Card_Satirlari(
                        "Bölüm: ",
                        18,
                        "Yönetim Bilişim Sistemleri",
                        18,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  elevation: 8,
                  shadowColor: Colors.black.withValues(alpha: 0.5),
                  color: Colors.grey.shade200,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.track_changes, color: Colors.green),
                          SizedBox(width: 10),
                          _Textler("Amaç", 20),
                        ],
                      ),
                      Divider(color: Colors.grey.shade300, height: 12),
                      _Textler(
                        "Bu uygulama Flutter öğrenmeye yeni başlayan biri tarafından geliştirilmiştir. Amacı Flutterin temel bileşenlerini kullanarak basit bir Hakkımda sayfası oluşturmaktır.",
                        18,
                        textweight: FontWeight.normal,
                      ),
                    ],
                  ),
                ),
              ),
              _buttonMethodu("Web Sitesine Gidiliyor...","Web Sitesi"),
               _buttonMethodu("İletişim Kuruluyor...","İletişim"),
            ],
          ),
        ),
      ),
    );
  }

  Padding _buttonMethodu(String debugMetni, String textMetni) {
    return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () {
                  debugPrint(debugMetni);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                 minimumSize: Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: _Textler(textMetni, 20),
              ),
            );
  }

  Padding _Card_Satirlari(
    String metin1,
    double boyut1,
    String metin2,
    double boyut2,
  ) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Textler(metin1, boyut1),
          SizedBox(width: 10),
          Expanded(
            child: _Textler(
              metin2,
              boyut2,
              textfont: TextAlign.start,
              textweight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

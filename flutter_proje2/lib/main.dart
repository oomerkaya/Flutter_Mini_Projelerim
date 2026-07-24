import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proje2/Theme/theme_home_page.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeHomePage.theme,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PopupMenuItem<Widget> popupMenuItemsCreate({
    required String text,
    required IconData icon,
  }) {
    return PopupMenuItem(
      child: ListTile(title: Text(text), leading: Icon(icon)),
    );
  }

  late List<Map<String, dynamic>> myList;
  bool flag = false;
  Future<List<Map<String, dynamic>>> loadJson() async {
    try {
      var jsonString = await rootBundle.loadString('assets/data/persons.json');
      Map<String, dynamic> jsonMap = json.decode(jsonString);
      List<dynamic> jsonList = jsonMap["persons"];
      return jsonList.cast<Map<String, dynamic>>();
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kişiler"),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                popupMenuItemsCreate(text: "Yeni Grup", icon: Icons.add),
                popupMenuItemsCreate(
                  text: "Yıldızlı Mesajlar",
                  icon: Icons.star_border_outlined,
                ),
                popupMenuItemsCreate(text: "Ayarlar", icon: Icons.settings),
              ];
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            myList.add({
              "id": "${myList.length + 1}",
              "ad_soyad": "Yeni Kişi",
              "Cinsiyet": myList.length % 2 == 0 ? "Erkek" : "Kadın",
            });
          });
        },
      ),
      body: Center(
        child: FutureBuilder(
          future: loadJson(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (!flag) {
                myList = snapshot.data!;
                flag = true;
              }
              return ListView.builder(
                itemCount: myList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 6,
                    ),
                    child: Card(
                      child: ListTile(
                        title: Text(myList[index]['ad_soyad']),
                        leading: CircleAvatar(
                          child: Text(
                            myList[index]["id"].toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("hata");
            } else {
              return SizedBox();
            }
          },
        ),
      ),

      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: "Ana Sayfa"),
          NavigationDestination(
            icon: Icon(Icons.circle_outlined),
            label: "Durum",
          ),
          NavigationDestination(
            icon: Icon(Icons.phone),
            label: "Geçmiş Aramalar",
          ),
        ],
      ),
    );
  }
}

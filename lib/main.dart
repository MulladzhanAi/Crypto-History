
import 'package:crypto_mni/presentation/my_home_page.dart';
import 'package:crypto_mni/presentation/settings_page.dart';
import 'package:crypto_mni/presentation/top_3_crypto.dart';
import 'package:flutter/material.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  var _currentIndex=0;

  var tabs=[
    MyHomePage(),
    Top3Crypto(),
    SettingsPage(),

  ];
  @override
  Widget build(BuildContext context) {

   // var bloc=CryptoBloc();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'CryptoБрат',
            style: TextStyle(
              fontSize: 20.0, // Размер шрифта
              fontWeight: FontWeight.bold, // Жирный шрифт
            ),
          ),

          elevation: 0.0, // Тень
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor:Color.fromARGB(255, 240, 183, 14),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              //icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.trending_up),
              label: 'Top 3',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          currentIndex: _currentIndex,

          onTap: (index){
            setState(() {
              _currentIndex=index;
            });
          },
        ),
        body: tabs[_currentIndex]),
    );
  }
}





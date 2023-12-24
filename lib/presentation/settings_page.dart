import 'package:flutter/material.dart';

import '../globals/globals.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Card(
          elevation: 0, // Тень карточки
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0), // Закругленные углы
          ),
          color: Colors.white, // Цвет фона карточки
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Настройка графика",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(
                    height: 8.0), // Расстояние между заголовком и текстом
                Text(
                  "Если настроить график Японских свечей на 30-минутный",
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                ),
                Text(
                  "период, то каждая отдельная свеча будет формироваться",
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                ),
                Text(
                  "в течение 30 минут.Аналогично этому, если график",
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                ),
                Text(
                  "настроить на 15-минутный период,то для формирования",
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                ),
                Text(
                  "одной свечи потребуется 15 минут.Широкая часть свечи",
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                ),
                Text(
                  "называется телом.",
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8.0), // Расстояние между двумя карточками
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  Globals.days=1;
                });
              },
              child: Card(
                elevation: 3, // Тень карточки
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10.0), // Закругленные углы
                ),
                color: Globals.days==1 ? 
                 const Color.fromARGB(240, 230, 140, 14) : Color.fromARGB(255, 240, 183, 14), // Цвет фона карточки
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "30 минут",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: Colors.white, // Цвет текста
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            ),
            const SizedBox(width: 16.0),
            GestureDetector(
              onTap: () {
                setState(() {
                  Globals.days=7;
                });
              },
              child: Card(
                elevation: 3, // Тень карточки
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10.0), // Закругленные углы
                ),
                color: Globals.days==7 ?
                const Color.fromARGB(240, 230, 140, 14) : Color.fromARGB(255, 240, 183, 14), // Цвет фона карточки
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "4 часа",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: Colors.white, // Цвет текста
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            GestureDetector(
              onTap: () {
                setState(() {
                  Globals.days=90;
                });
              },
              child: Card(
                elevation: 3, // Тень карточки
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10.0), // Закругленные углы
                ),
                color: Globals.days==90 ?
                const Color.fromARGB(240, 230, 140, 14) : Color.fromARGB(255, 240, 183, 14), // Цвет фона карточки
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "4 дня",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: Colors.white, // Цвет текста
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    )));
  }
}

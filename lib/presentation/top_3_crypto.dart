import 'package:crypto_mni/main.dart';
import 'package:crypto_mni/presentation/ohlc_page.dart';
import 'package:flutter/material.dart';

import '../globals/globals.dart';

class Top3Crypto extends StatefulWidget {
  const Top3Crypto({super.key});

  @override
  State<Top3Crypto> createState() => _Top3CryptoState();
}

class _Top3CryptoState extends State<Top3Crypto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: Colors.white,
          child: ListTile(
            title: Text(Globals.list[index].name),
            subtitle: Text(Globals.list[index].current_price.toString()),
            leading: Image.network(Globals.list[index].image),
            trailing: GestureDetector(
                child: Icon(Icons.navigate_next_sharp),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              OHLCPage(id: Globals.list[index].id)));
                }),
          ),
        );
      },
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/blocs/crypto_block.dart';
import '../bloc/events/crypto_load_event.dart';
import '../bloc/states/crypto_state.dart';
import '../domain/models/crypto_entity.dart';
import '../globals/globals.dart';
//MY HOME PAGE ОТОБРАЖАЕТ КУРС ВАЛЮТ ПЕРВАЯ СТРАНИЦА
class MyHomePage extends StatefulWidget {
  MyHomePage({super.key})


  {}
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var bloc=CryptoBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  BlocProvider<CryptoBloc>(
      create: (BuildContext context) => bloc,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder<CryptoBloc, CryptoState>(
                  builder: (BuildContext context, CryptoState state) {
                    if(state is CryptoLoadingState){
                      return const Center(child: CircularProgressIndicator());
                    }
                    if(state is CryptoLoadedState){
                      if(Globals.list.isEmpty){
                        Globals.list=state.cryptos;
                        print(Globals.list.length);
                      }
                      return ListView.builder(
                        itemCount: Globals.list.length,
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
                            ),
                          );
                        },
                      );
                    }

                    if(state is CryptoEmptyState){
                      BlocProvider.of<CryptoBloc>(context).add(GetCryptoEvent());
                      return const Center(child: Text('Empty'),);
                    }
                    return const Center(child: Text('Empty no working'),);
                  }
              ),
            )
          ],
        ),
      ),
    );
  }
}

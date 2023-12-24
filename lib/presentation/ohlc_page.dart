import 'package:crypto_mni/bloc/blocs/crypto_ohlc_bloc.dart';
import 'package:crypto_mni/bloc/events/crypto_ohlc_event.dart';
import 'package:crypto_mni/domain/models/crypto_ohlc_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../bloc/states/crypto_ohlc_state.dart';
import '../globals/globals.dart';

class OHLCPage extends StatefulWidget {
  const OHLCPage({super.key,required this.id});
  final String id;
  @override
  State<OHLCPage> createState() => _OHLCPageState();
}

class _OHLCPageState extends State<OHLCPage> {
  late var tracboll = TrackballBehavior();

  @override
  void initState() {
    tracboll = TrackballBehavior(
        enable: true, activationMode: ActivationMode.singleTap);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var OHLCBloc = CryptoOHLCBloc();
    return Scaffold(
      appBar: AppBar(title: Text(widget.id),),
      body: SafeArea(
        child: BlocProvider<CryptoOHLCBloc>(
          create: (BuildContext context) => OHLCBloc,
          child: BlocBuilder<CryptoOHLCBloc, CryptoOHLCState>(
            builder: (BuildContext context, CryptoOHLCState state) {
              if (state is CryptoOHLCLoadingState) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is CryptoOHLCEmptyState) {
                BlocProvider.of<CryptoOHLCBloc>(context)
                    .add(CryptoOHLCGetEvent(id: widget.id, days: Globals.days));
                return const Text('Empty');
              }
              if (state is CryptoOHLCLoadedState) {
                return Column(
                    mainAxisAlignment:  MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                  Container(
                    width: width,
                    height: height * 0.6,
                    decoration: BoxDecoration(),
                    child: SfCartesianChart(
                      trackballBehavior: tracboll,
                      zoomPanBehavior: ZoomPanBehavior(
                          enablePanning: true, zoomMode: ZoomMode.x),
                      series: <ChartSeries>[
                        CandleSeries<CryptoOHLCEntity, int>(
                          enableSolidCandles: true,
                          enableTooltip: true,
                          bullColor: Colors.green,
                          bearColor: Colors.red,
                          dataSource: state.cryptos,
                          xValueMapper: (CryptoOHLCEntity crypto, _) =>
                              crypto.time,
                          lowValueMapper: (CryptoOHLCEntity crypto, _) =>
                              crypto.open,
                          highValueMapper: (CryptoOHLCEntity crypto, _) =>
                              crypto.high,
                          openValueMapper: (CryptoOHLCEntity crypto, _) =>
                              crypto.low,
                          closeValueMapper: (CryptoOHLCEntity crypto, _) =>
                              crypto.close,
                          animationDuration: 55,
                        ),
                      ],
                    ),
                  ),

                ]
                );
              }
              return Text('Error');
            },
          ),
        ),
      ),

    );
  }
}

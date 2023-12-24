class CryptoOHLCApiModel{
  final int time;
  final double open;
  final double high;
  final double low;
  final double close;

  CryptoOHLCApiModel({required this.time,required this.open,required this.high,required this.low,required this.close});
  
  factory CryptoOHLCApiModel.fromJson(List list){
    return CryptoOHLCApiModel(time: list[0], open: list[1], high: list[2], low: list[3], close: list[4]);
  }
}
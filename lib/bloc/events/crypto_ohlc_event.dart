abstract class CryptoOHLCEvent{}

class CryptoOHLCGetEvent extends CryptoOHLCEvent{
  final String id;
  final int days;
  CryptoOHLCGetEvent({required this.id,required this.days});
}
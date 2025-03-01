import 'package:wins_pkr/res/api_urls.dart';

class DragonTigerUrl{
  // base url
  static const String baseUrl = ApiUrl.baseUrl;
// dragon tiger
  static const String dragonBet = "${baseUrl}dragon_bet";
  static const String gameHistory = '${baseUrl}bet_history?game_id=';
  static const String resultList = "${baseUrl}results?game_id=";
  static const String betHistory = "${baseUrl}bet_history?userid=";
}
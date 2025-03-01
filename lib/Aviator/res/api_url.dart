import '../../res/api_urls.dart';

class AviatorApiUrl{
  // base url
  static const String baseUrl = ApiUrl.baseUrl;
  //aviator url
  static const String aviatorHistory = '${baseUrl}aviator_history';
  static const String aviatorBet = "${baseUrl}aviator_bet?game_id=5&uid=";
  static const String aviatorBetCancel = "${baseUrl}aviator_bet_cancel?userid=";
  static const String aviatorBetCashOut = "${baseUrl}aviator_cashout?salt=";
  static const String aviatorResult = "${baseUrl}aviator_last_five_result";
}
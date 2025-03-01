class ApiUrl {
  static const String baseUrl = 'https://root.winspkr.com/api/';
  static const String register = '${baseUrl}register';
  static const String sendOtp = 'https://otp.fctechteam.org/send_otp.php?';
  static const String checkExistNumber = '${baseUrl}check_number';
  static const String login = '${baseUrl}login';
  static const String profile = '${baseUrl}profile/';
  static const String slider = '${baseUrl}slider';
  static const String addBank = '${baseUrl}addAccount';
  static const String forgetPassword = '${baseUrl}forget_Password';
  static const String accountView = '${baseUrl}accountView?userid=';
  static const String payIn = '${baseUrl}payin';
  static const String usdtPayIn = '${baseUrl}usdt_payinn';
  static const String withdraw = '${baseUrl}withdraw';
  static const String depositHistory = '${baseUrl}deposit-history?user_id=';
  static const String withdrawHistory = '${baseUrl}withdraw-history?user_id=';
  static const String accountDelete = '${baseUrl}account-delete/';
  static const String promotionScreen = "${baseUrl}agency-promotion-data-";
  static const String getTier = "${baseUrl}tier";
  static const String getSubData = "${baseUrl}subordinate-data";
  static const String customerService = "${baseUrl}customer_service";
  static const String redeemGift = "${baseUrl}gift_cart_apply";
  static const String redeemGiftHis = "${baseUrl}gift_redeem_list?userid=";
  static const String showQrUrl = "${baseUrl}show_qr/?type=";
  static const String usdtAccountViewUrl = "${baseUrl}usdt_account_view?user_id=";
  static const String payModesUrl = "${baseUrl}pay_modes";
  static const String usdtWithdrawUrl = "${baseUrl}usdtwithdraw";
  static const String changePassword = "${baseUrl}changepassword";
  //vip
  static const String showVipList = "${baseUrl}vip_level?userid=";
  static const String vipRewardReceive = "${baseUrl}add_money";
  static const String vipRewardHis = "${baseUrl}vip_level_history?userid=";

  static const String dragonBet = "${baseUrl}dragon_bet";
  static const String gameHistory = '${baseUrl}bet_history';
  static const String resultList = "${baseUrl}results?game_id=";
  static const String game_win = "${baseUrl}win_amount?userid=";

  static const String plinkoBet = "${baseUrl}plinko_bet";
  static const String plinkoList = "${baseUrl}plinko_index_list?type=";
  static const String plinkoMultiplier = "${baseUrl}plinko_multiplier";
  static const String plinkoBetHistory = "${baseUrl}plinko_result?userid=";

  static const String jiliGameList = "${baseUrl}all_game_list";
  static const String getGameUrl = "${baseUrl}get_game_url";
  static const String updateMainWallet = "${baseUrl}update_main_wallet";
  static const String mainWalletTransfer = "${baseUrl}main_wallet_transfers";

  static const String versionUpdate = "${baseUrl}version_apk_link";
}

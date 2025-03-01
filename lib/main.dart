import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wins_pkr/Aviator/view_model/aviator_history_view_model.dart';
import 'package:wins_pkr/jilli_dir/jilli_view_model/jilli_view_model.dart';
import 'package:wins_pkr/view_modal/change_pass_view_modal.dart';
import 'package:wins_pkr/view_modal/paymode_view_model.dart';
import 'package:wins_pkr/view_modal/services_view_model.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:wins_pkr/utils/routes/routers.dart';
import 'package:wins_pkr/utils/routes/routers_name.dart';
import 'package:wins_pkr/view/earn_money/controller/earn_money_controller.dart';
import 'package:wins_pkr/view/home/controller/home_controller.dart';
import 'package:wins_pkr/view/me/controller/me_controller.dart';
import 'package:wins_pkr/view/mines/controller/mine_controller.dart';
import 'package:wins_pkr/view/mines/view_model/mine_bet_his_view_model.dart';
import 'package:wins_pkr/view/mines/view_model/mine_bet_view_model.dart';
import 'package:wins_pkr/view/mines/view_model/mine_cash_out_view_model.dart';
import 'package:wins_pkr/view/mines/view_model/mine_drop_down_view_model.dart';
import 'package:wins_pkr/view/promotion/controller/promotion_controller.dart';
import 'package:wins_pkr/view/trx/controller/trx_controller.dart';
import 'package:wins_pkr/view/trx/view_model/trx_bet_view_model.dart';
import 'package:wins_pkr/view/trx/view_model/trx_game_his_view_model.dart';
import 'package:wins_pkr/view/trx/view_model/trx_my_bet_his_view_model.dart';
import 'package:wins_pkr/view/trx/view_model/trx_result_view_model.dart';
import 'package:wins_pkr/view/trx/view_model/trx_win_amount_view_model.dart';
import 'package:wins_pkr/view/wingo/controller/win_go_controller.dart';
import 'package:wins_pkr/view/wingo/view_model/win_go_bet_view_model.dart';
import 'package:wins_pkr/view/wingo/view_model/win_go_my_his_view_model.dart';
import 'package:wins_pkr/view/wingo/view_model/win_go_pop_up_view_model.dart';
import 'package:wins_pkr/view/wingo/view_model/win_go_game_his_view_model.dart';
import 'package:wins_pkr/view/wingo/view_model/win_go_result_view_model.dart';
import 'package:wins_pkr/view_modal/auth_view_modal.dart';
import 'package:wins_pkr/view_modal/bank_view_model.dart';
import 'package:wins_pkr/view_modal/customer_service_view_model.dart';
import 'package:wins_pkr/view_modal/deposit_view_modal.dart';
import 'package:wins_pkr/view_modal/forget_pass_view_modal.dart';
import 'package:wins_pkr/view_modal/profile_view_model.dart';
import 'package:wins_pkr/view_modal/promotion_view_model.dart';
import 'package:wins_pkr/view_modal/redeem_gift_his_view_model.dart';
import 'package:wins_pkr/view_modal/redeem_gift_view_model.dart';
import 'package:wins_pkr/view_modal/show_qr_view_model.dart';
import 'package:wins_pkr/view_modal/slider_view_modal.dart';
import 'package:wins_pkr/view_modal/subordinate_data_view_model.dart';
import 'package:wins_pkr/view_modal/subordinate_tier_view_model.dart';
import 'package:wins_pkr/view_modal/usdt_withdraw_view_model.dart';
import 'package:wins_pkr/view_modal/user_view_modal.dart';
import 'package:wins_pkr/view_modal/vip_reward_his_view_model.dart';
import 'package:wins_pkr/view_modal/vip_reward_receive_view_model.dart';
import 'package:wins_pkr/view_modal/vip_show_list_view_model.dart';
import 'package:wins_pkr/view_modal/withdraw_view_modal.dart';
import 'package:provider/provider.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  WakelockPlus.enable();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,
      overlays: []);
  runApp(const MyApp());
}

double height = 0.0;
double width = 0.0;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width > 400
        ? 400
        : MediaQuery.of(context).size.width;
    return MediaQuery(
      data: MediaQuery.of(context)
          .copyWith(textScaler: const TextScaler.linear(1.0)),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => HomeController()),
          ChangeNotifierProvider(create: (context) => EarnMoneyController()),
          ChangeNotifierProvider(create: (context) => AuthViewModel()),
          ChangeNotifierProvider(create: (context) => UserViewModel()),
          ChangeNotifierProvider(create: (context) => ProfileViewModel()),
          ChangeNotifierProvider(create: (context) => SliderViewModel()),
          // ChangeNotifierProvider(create: (context) => ChangePasswordViewModel()),
          ChangeNotifierProvider(create: (context) => ForgetPassViewModel()),
          ChangeNotifierProvider(create: (context) => BankViewModel()),
          ChangeNotifierProvider(create: (context) => DepositViewModel()),
          ChangeNotifierProvider(create: (context) => WithdrawViewModel()),
          ChangeNotifierProvider(create: (context) => PromotionViewModel()),
          ChangeNotifierProvider(create: (context) => PromotionController()),
          ChangeNotifierProvider(create: (context) => PaymodeViewModel()),
          ChangeNotifierProvider(create: (context) => UsdtWithdrawViewModel()),
          ChangeNotifierProvider(
              create: (context) => SubordinateTierViewModel()),
          ChangeNotifierProvider(
              create: (context) => SubordinateDataViewModel()),
          ChangeNotifierProvider(create: (context) => RedeemGiftHisViewModel()),
          ChangeNotifierProvider(create: (context) => RedeemGiftViewModel()),
          ChangeNotifierProvider(create: (context) => MeController()),
          ChangeNotifierProvider(
              create: (context) => CustomerServiceViewModel()),
          ChangeNotifierProvider(create: (context) => ShowQrViewModel()),
          //win go
          ChangeNotifierProvider(create: (context) => WinGoController()),
          ChangeNotifierProvider(create: (context) => WinGoGameHisViewModel()),
          ChangeNotifierProvider(create: (context) => WinGoMyHisViewModel()),
          ChangeNotifierProvider(create: (context) => WinGoPopUpViewModel()),
          ChangeNotifierProvider(create: (context) => WinGoBetViewModel()),
          ChangeNotifierProvider(create: (context) => WinGoResultViewModel()),
          //mine
          ChangeNotifierProvider(create: (context) => MineController()),
          ChangeNotifierProvider(create: (context) => MineBetViewModel()),
          ChangeNotifierProvider(create: (context) => MineCashOutViewModel()),
          ChangeNotifierProvider(create: (context) => MineBetHisViewModel()),
          ChangeNotifierProvider(create: (context) => MineDropDownViewModel()),
          // vip
          ChangeNotifierProvider(create: (context) => VipShowListViewModel()),
          ChangeNotifierProvider(
              create: (context) => VipRewardReceiveViewModel()),
          ChangeNotifierProvider(create: (context) => VipRewardHisViewModel()),
          // trx
          ChangeNotifierProvider(create: (context) => TrxController()),
          ChangeNotifierProvider(create: (context) => TrxBetViewModel()),
          ChangeNotifierProvider(create: (context) => TrxResultViewModel()),
          ChangeNotifierProvider(create: (context) => TrxMyBetHisViewModel()),
          ChangeNotifierProvider(create: (context) => TrxGameHisViewModel()),
          ChangeNotifierProvider(create: (context) => TrxWinAmountViewModel()),
          // aviator
          ChangeNotifierProvider(
              create: (context) => AviatorHistoryViewModel()),

          ChangeNotifierProvider(create: (context) => JilliViewModal()),
          //splash service
          ChangeNotifierProvider(create: (context) => SplashServices()),
          ChangeNotifierProvider(create: (context) => ChangePasswordViewModel()),
        ],
        child: Builder(builder: (context) {
          if (kIsWeb) {
            width = MediaQuery.of(context).size.width > 400
                ? 400
                : MediaQuery.of(context).size.width;
            return MaterialApp(
              navigatorKey: navigatorKey,
              builder: (context, child) {
                return Center(
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: width,
                    ),
                    child: child,
                  ),
                );
              },
              title: 'wins_pkr',
              debugShowCheckedModeBanner: false,
              initialRoute: RoutesName.splashScreen,
              onGenerateRoute: (settings) {
                if (settings.name != null) {
                  return MaterialPageRoute(
                    builder: Routers.generateRoute(settings.name!),
                    settings: settings,
                  );
                }
                return null;
              },
            );
          } else {
            return MaterialApp(
              navigatorKey: navigatorKey,
              debugShowCheckedModeBanner: false,
              initialRoute: RoutesName.splashScreen,
              onGenerateRoute: (settings) {
                if (settings.name != null) {
                  return MaterialPageRoute(
                    builder: Routers.generateRoute(settings.name!),
                    settings: settings,
                  );
                }
                return null;
              },
            );
          }
        }),
      ),
    );
  }
}

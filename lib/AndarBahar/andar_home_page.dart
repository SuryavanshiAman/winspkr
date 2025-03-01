import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flip_card/controllers/flip_card_controllers.dart';
import 'package:wins_pkr/AndarBahar/andarBaharModel/last_fifteen.dart';
import 'package:wins_pkr/AndarBahar/andar_bahar_assets.dart';
import 'package:wins_pkr/AndarBahar/constant/andar_bahar_history.dart';
import 'package:wins_pkr/AndarBahar/constant/andar_bahar_toast.dart';
import 'package:wins_pkr/AndarBahar/constant/coins_sign_new.dart';
import 'package:wins_pkr/AndarBahar/constant/hide_coins.dart';
import 'package:wins_pkr/AndarBahar/constant/image_toast_wingo.dart';
import 'package:wins_pkr/constants/app_button.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/constants/gradient_app_bar.dart';
import 'package:wins_pkr/dragon_tiger_new/coin/set_coin.dart';
import 'package:wins_pkr/dragon_tiger_new/widgets/dragon_tiger_Assets.dart';
import 'package:wins_pkr/dragon_tiger_new/widgets/fade_animation.dart';
import 'package:wins_pkr/dragon_tiger_new/widgets/glory_border.dart';
import 'package:wins_pkr/dragon_tiger_new/widgets/image_tost.dart';
import 'package:wins_pkr/view_modal/profile_view_model.dart';
import 'package:wins_pkr/view_modal/user_view_modal.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:wins_pkr/generated/assets.dart';
import 'package:wins_pkr/main.dart';
import 'package:wins_pkr/res/api_urls.dart';
import 'package:wins_pkr/utils/utils.dart';


class AndarBaharHome extends StatefulWidget {
  final String gameId;

  const AndarBaharHome({super.key, required this.gameId});

  @override
  State<AndarBaharHome> createState() => _AndarBaharHomeState();
}

class _AndarBaharHomeState extends State<AndarBaharHome>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  @override
  void initState() {
    startCountdown();
    fetchData();
    super.initState();
  }

  var _cartQuantityItems = 0;
  bool firstCome = false;
  final pattiCon = FlipCardController();

  int countdownSeconds = 30;
  Timer? countdownTimer;
  Future<void> startCountdown() async {
    DateTime now = DateTime.now().toUtc();
    int initialSeconds = 30 - now.second;
    setState(() {
      countdownSeconds = initialSeconds;
    });
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      updateUI(timer);
    });
  }
  void updateUI(Timer timer) {
    setState(() {
      if (countdownSeconds == 29) {
        wallet = double.parse(
            context.read<ProfileViewModel>().profileData!.data!.wallet.toString());
        context.read<ProfileViewModel>().userProfileApi(context);
        _handleFlipCards(countdownSeconds);
        fetchData();
        if (firstCome == false) {
        } else {
          ImageToast.show(
              imagePath: AppAssets.dragontigerStartbetting,
              height: 80,
              context: context);
        }
      } else if (countdownSeconds == 27) {
        singleCard();
        _isFrontTwo = true;
        generateRandomCoin();
        _addCoins(randomCoin);
      } else if (countdownSeconds == 25) {
        _isFrontTwo = true;
      } else if (countdownSeconds == 20) {
      } else if (countdownSeconds == 13) {
        if (firstCome == false) {
        } else {
          ImageToast.show(
              imagePath: AppAssets.dragontigerStopbetting,
              height: 80,
              context: context);
        }
        hideButton = true;
      } else if (countdownSeconds == 10) {
        if (firstCome == false) {
        } else {
          if (andarCount == 0 && baharCount == 0) {
          } else {
            bettingApi(context);
          }
        }
      } else if (countdownSeconds == 6) {
        lastResultView(context);
      } else if (countdownSeconds == 1) {
        _handleFlipCards(countdownSeconds);
        fetchData();
        _isFrontTwo = false;
        gameWinPopup(context);
        hideButton = false;
        firstCome = true;
        countAndCoinClear();
        stringList.clear();
      }
      countdownSeconds = (countdownSeconds - 1) % 30;
    });
  }

  void waitingRoundToast(){
    setState(() {
      if (!firstCome) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text('Custom Dialog'),
                    const SizedBox(height: 10),
                    const Text('This is a custom dialog with a container.'),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        setState(() {
                          firstCome = true; // Update the state if needed
                        });
                      },
                      child: const Text('Close'),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }

    });
  }
  void countAndCoinClear() {
    setState(() {
      andarCoins.clear();
      andarCount = 0;

      baharCoins.clear();
      baharCount = 0;

      coins1.clear();
      coins2.clear();
    });
  }
  void _handleFlipCards(int newCountdownSeconds) {
    pattiCon.flipcard();

    countdownSeconds = newCountdownSeconds;
  }
  bool hideButton = false;
  double wallet = 0;
  int randomCoin = 0;
  int randomPeople = 0;

  int period = 0;
  int gameid = 13;

  void generateRandomCoin() {
    setState(() {
      randomCoin = Random().nextInt(90) + 10;
      randomPeople = Random().nextInt(989) + 10;
    });
  }

  void deductAmount(int amountToDeduct) {
    if (wallet >= amountToDeduct) {
      setState(() {
        // wallet = (wallet! - amountToDeduct).toInt();
        wallet = (wallet - amountToDeduct).toDouble();
      });
    } else {
      Utils.flushBarErrorMessage('Insufficient funds', context, );
    }
  }

  int selectedCart = 1;
  GlobalKey<CartIconKey> andar = GlobalKey<CartIconKey>();
  GlobalKey<CartIconKey> bahar = GlobalKey<CartIconKey>();
  late Function(GlobalKey<CartIconKey>) runAddToCartAnimation;

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    // Audio.audioPlayer.dispose();
    gameWinPopup(context);
    countdownTimer?.cancel();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    wallet =
        double.parse(context.read<ProfileViewModel>().profileData!.data!.wallet.toString());
    // wallet = context.read<ProfileViewModel>().totalWallet();
  }

  @override
  Widget build(BuildContext context) {

    return AddToCartAnimation(
      cartKey: selectedCart == 1 ? andar : bahar,
      height: 15,
      width: 15,
      opacity: 0.85,
      dragAnimation: const DragToCartAnimationOptions(
        rotation: false,
      ),
      jumpAnimation: const JumpAnimationOptions(),
      createAddToCartAnimation: (runAddToCartAnimation) {
        this.runAddToCartAnimation = runAddToCartAnimation;
      },
      child: Scaffold(
        backgroundColor: const Color(0xff780202),
        appBar: GradientAppBar(
          leading: const AppBackBtn(),
          centerTitle: true,
          title: const Text(
            'Andar Bahar',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 15,
            ),
          ),
          actions: [
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> AndarBaharHistory(gameid: widget.gameId,)));
                // showDialog(
                //   context: context,
                //   builder: (BuildContext context) {
                //     return AndharBaharPopUpPage(gameId: widget.gameId);
                //   },
                // );
              },
              child: Column(
                children: [
                  Container(
                    height: height * 0.03,
                    width: height * 0.04,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(Assets.andarbaharBethistory),
                          fit: BoxFit.fill,
                        )),
                  ),
                  const Text(
                    'History',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 12,
                        color: Colors.white),
                  ),
                ],
              ),
            )
          ],
        ),
        body: Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AndarAssets.andarbaharIvAndharBaharBg),
              fit: BoxFit.fill,
            ),
          ),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: height * 0.300),
                child: Container(
                  height: height * 0.8,
                  width: width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image:
                      AssetImage(AndarAssets.andarbaharIvAndarBaharTable),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    children: [
                      /// Middle
                      Padding(
                        padding: EdgeInsets.only(top: height * 0.10),
                        child: SizedBox(
                          height: height * 0.3,
                          width: width * 0.97,
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 40),
                                child: Container(
                                  height: height,
                                  width: width,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.textColor3,
                                          width: 2)),
                                ),
                              ),

                              /// Chips throwing

                              Row(
                                children: [
                                  Padding(
                                    padding:
                                    EdgeInsets.only(top: height * 0.05),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          height: height * 0.05,
                                          width: width * 0.3,
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(AndarAssets
                                                  .andarbaharTopPopAndhar),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              selectedCart = 1;
                                            });
                                          },
                                          child: Container(
                                            key: andar,
                                            height: height * 0.18,
                                            width: width * 0.48,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 2,
                                                color: selectedCart == 1
                                                    ? AppColors.textColor3
                                                    : Colors.transparent,
                                              ),
                                              color: selectedCart == 1
                                                  ? Colors.blue.withOpacity(0.5)
                                                  : null,
                                            ),
                                            child: Stack(
                                              clipBehavior: Clip.none,
                                              children: [
                                                Positioned(
                                                  left: -115,
                                                  top: 40,
                                                  child: Stack(
                                                    children: coins1,
                                                  ),
                                                ),
                                                Stack(
                                                  children: [
                                                    for (var data in andarCoins)
                                                      data,
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    EdgeInsets.only(top: height * 0.11),
                                    child: Container(
                                      height: height * 0.3,
                                      width: 2,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AppColors.textColor3)),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    EdgeInsets.only(top: height * 0.05),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          height: height * 0.05,
                                          width: width * 0.3,
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(AndarAssets
                                                  .andarbaharTopPopUpBahar),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          // color: Colors.red,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              selectedCart = 2;
                                            });
                                          },
                                          child: Container(
                                            key: bahar,
                                            height: height * 0.18,
                                            width: width * 0.48,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 2,
                                                color: selectedCart == 2
                                                    ? AppColors.textColor3
                                                    : Colors.transparent,
                                              ),
                                              color: selectedCart == 2
                                                  ? Colors.blue.withOpacity(0.5)
                                                  : null,
                                            ),
                                            child: Stack(
                                              clipBehavior: Clip.none,
                                              children: [
                                                Positioned(
                                                    left: -110,
                                                    top: 40,
                                                    child: Stack(
                                                      children: coins2,
                                                    )),
                                                Stack(
                                                  children: [
                                                    for (var data in baharCoins)
                                                      data,
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: height * 0.11),
                                child: Container(
                                  height: 2,
                                  width: width,
                                  color: AppColors.textColor3,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: height * 0.04,
                                    left: kIsWeb ? width * 0.435 : width * 0.42),
                                child: _isFrontTwo
                                    ? AnimatedGradientBorder(
                                    borderSize: 3,
                                    gradientColors: const [
                                      Color(0xfffaee72),
                                      Colors.transparent,
                                      Color(0xfffaee72),
                                    ],
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                    child: Image.asset(
                                        'assets/cards/$singleImage.png',
                                        height: height * 0.05))
                                    : FadeInUpBig(
                                    child: Image.asset(
                                        AppAssets.imageFireCard,
                                        height: height / 13
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.1,
                      ),

                      /// bottom
                      Container(
                        height: height * 0.12,
                        width: width * 12,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                AndarAssets.andarbaharIcDtBottomStrip),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: width * 0.03, top: height * 0.03),
                          child: Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: width * 0.09, top: height * 0.02),
                                child: Container(
                                  height: height * 0.04,
                                  width: width * 0.20,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          AndarAssets.andarbaharPlayerWallet),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  child: Center(
                                      child: Text(
                                        wallet.toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            color: Colors.white),
                                      )),
                                ),
                              ),
                              InkWell(
                                // onTap: () {
                                //
                                //   Navigator.push(
                                //       context,
                                //       MaterialPageRoute(
                                //           builder: (context) =>
                                //           const Deposit()));
                                // },
                                child: Container(
                                  margin: EdgeInsets.only(
                                      left: width * 0.30, top: height * 0.02),
                                  height: height * 0.04,
                                  width: width * 0.134,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          AndarAssets.andarbaharAddIconNew),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              // Padding(
                              //   padding: EdgeInsets.only(left: width * 0.36),
                              //   child: InkWell(
                              //     onTap: () {
                              //       Navigator.push(
                              //           context,
                              //           PageTransition(
                              //               child: GameHistoryPage(
                              //                   gameId: widget.gameId),
                              //               type:
                              //               PageTransitionType.topToBottom,
                              //               duration: const Duration(
                              //                   milliseconds: 500)));
                              //     },
                              //   ),
                              // ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: width * 0.45,
                                ),
                                child: SizedBox(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: list.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, int index) {
                                      final GlobalKey<CartIconKey> itemKey =
                                      GlobalKey<CartIconKey>();
                                      return firstCome == false
                                          ? HideCoins(list[index])
                                          : hideButton == true
                                          ? HideCoins(list[index])
                                          : InkWell(
                                        onTap: () async {
                                          wallet == 0
                                              ? Utils
                                              .flushBarErrorMessage(
                                              'Please Recharge',
                                              context,
                                              )
                                              : wallet < list[index]
                                              ? Utils
                                              .flushBarErrorMessage(
                                              'Low Balance',
                                              context,
                                             )
                                              : Future.delayed(
                                              const Duration(
                                                  milliseconds:
                                                  1500),
                                                  () {
                                                if (selectedCart ==
                                                    1) {
                                                  andarCoins.add(Positioned(
                                                      left: randomNo(
                                                          1,
                                                          150),
                                                      top: randomNo(
                                                          1,
                                                          50),
                                                      child: CoindesignNew(
                                                          list[
                                                          index])));
                                                } else if (selectedCart ==
                                                    2) {
                                                  baharCoins.add(Positioned(
                                                      left: randomNo(
                                                          1,
                                                          150),
                                                      top: randomNo(
                                                          1,
                                                          50),
                                                      child: CoindesignNew(
                                                          list[
                                                          index])));
                                                }
                                                setState(() {
                                                  if (selectedCart ==
                                                      1) {
                                                    andarCount =
                                                        andarCount +
                                                            list[index];
                                                  } else {
                                                    baharCount =
                                                        baharCount +
                                                            list[index];
                                                  }
                                                });
                                              });
                                          wallet < list[index]
                                              ? ''
                                              : listClick(itemKey);

                                          deductAmount(
                                            list[index],
                                          );
                                        },
                                        child: Container(
                                            key: itemKey,
                                            child: CoindesignNew(
                                                list[index])),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: height * 0.015),
                                child: CircleAvatar(
                                  radius: 18,
                                  backgroundImage: const AssetImage(
                                      AndarAssets.andarbaharIcons),
                                  child: CircleAvatar(
                                    radius: 12,
                                    backgroundImage: NetworkImage(context
                                        .watch<ProfileViewModel>()
                                        .profileData!.data!.image
                                        .toString()),
                                    backgroundColor: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              /// Top
              Padding(
                padding:
                EdgeInsets.only(left: width * 0.8, bottom: height * 0.21),
                child: Center(
                  child: Container(
                    height: height * 0.1,
                    width: width * 0.2,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill, image: AssetImage(AppAssets.watch)),
                    ),
                    child: Center(
                        child: Text(
                          countdownSeconds.toString(),
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w900),
                        )),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.29),
                child: Container(
                  height: height / 10,
                  width: width / 5,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppAssets.buttonsRuppePannel),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        gamesNo == null ? 'waiting...' : gamesNo.toString(),
                        style:
                        const TextStyle(color: Colors.white, fontSize: 10),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                radius: height / 80,
                                backgroundImage:
                                const AssetImage(AndarAssets.andarbaharA),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CircleAvatar(
                                radius: height / 80,
                                backgroundImage:
                                const AssetImage(AndarAssets.andarbaharB),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                andarCount.toString(),
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                baharCount.toString(),
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                EdgeInsets.only(top: height * 0.75, left: width * 0.14),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    children: [
                      Container(
                        height: height * 0.05,
                        width: width * 0.1,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image:
                            AssetImage(AndarAssets.andarbaharIcOnlineUser),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Text(
                        randomPeople.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w700, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: height * 0.65),
                child: Center(
                  child: Container(
                    height: height * 0.22,
                    width: width,
                    decoration: BoxDecoration(
                        color: AppColors.textColor3.withOpacity(0.4)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: width * 0.05),
                              child: Container(
                                height: height * 0.05,
                                width: width * 0.25,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        AndarAssets.andarbaharTopPopAndhar),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            FadeInRightBig(
                              child: Container(
                                alignment: Alignment.center,
                                height: height * 0.05,
                                width: width * 0.7,
                                // color: Colors.blue,
                                child: Stack(
                                  children:
                                  List.generate(stringList.length, (index) {
                                    if (kDebugMode) {
                                      print((stringList.length - 1) == index);
                                      print('Andar');
                                    }

                                    double left = 00.0 + (index * 8.0);
                                    final animation = CurvedAnimation(
                                      curve: Interval(
                                        index / stringList.length,
                                        1.0,
                                        curve: Curves.easeInOut,
                                      ),
                                      parent: const AlwaysStoppedAnimation(1),
                                    );
                                    return AnimatedPositioned(
                                      duration:
                                      const Duration(milliseconds: 500),
                                      curve: Curves.easeInOut,
                                      left: left,
                                      child: AnimatedOpacity(
                                        duration:
                                        const Duration(milliseconds: 500),
                                        curve: Curves.easeInOut,
                                        opacity: 1.0,
                                        child: FadeTransition(
                                          opacity: animation,
                                          child: Row(
                                            children: [
                                              if (index.isEven)
                                                AnimatedGradientBorder(
                                                    borderSize:
                                                    (stringList.length -
                                                        1) ==
                                                        index
                                                        ? 2
                                                        : 0,
                                                    gradientColors: const [
                                                      Color(0xfffaee72),
                                                      Colors.transparent,
                                                      Color(0xfffaee72),
                                                    ],
                                                    borderRadius:
                                                    const BorderRadius.all(
                                                      Radius.circular(5),
                                                    ),
                                                    child: Image.asset(
                                                      'assets/cards/${stringList[index]}.png',
                                                      width: 25.0,
                                                      height: 35.0,
                                                      fit: BoxFit.fill,
                                                    ))
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: width * 0.05),
                              child: Container(
                                height: height * 0.05,
                                width: width * 0.25,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        AndarAssets.andarbaharTopPopUpBahar),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            FadeInRightBig(
                              child: Container(
                                alignment: Alignment.center,
                                height: height * 0.05,
                                width: width * 0.7,
                                // color: Colors.blue,
                                child: Stack(
                                  children:
                                  List.generate(stringList.length, (index) {
                                    if (kDebugMode) {
                                      print((stringList.length - 1) == index);
                                      print('Bahar');
                                    }

                                    double left = 00.0 + (index * 8.0);
                                    final animation = CurvedAnimation(
                                      curve: Interval(
                                        index / stringList.length,
                                        1.0,
                                        curve: Curves.easeInOut,
                                      ),
                                      parent: const AlwaysStoppedAnimation(1),
                                    );
                                    return AnimatedPositioned(
                                      duration:
                                      const Duration(milliseconds: 500),
                                      curve: Curves.easeInOut,
                                      left: left,
                                      child: AnimatedOpacity(
                                        duration:
                                        const Duration(milliseconds: 500),
                                        curve: Curves.easeInOut,
                                        opacity: 1.0,
                                        child: FadeTransition(
                                          opacity: animation,
                                          child: Row(
                                            children: [
                                              if (index.isOdd)
                                                AnimatedGradientBorder(
                                                    borderSize:
                                                    (stringList.length -
                                                        1) ==
                                                        index
                                                        ? 2
                                                        : 0,
                                                    gradientColors: const [
                                                      Color(0xfffaee72),
                                                      Colors.transparent,
                                                      Color(0xfffaee72),
                                                    ],
                                                    borderRadius:
                                                    const BorderRadius.all(
                                                      Radius.circular(5),
                                                    ),
                                                    child: Image.asset(
                                                      'assets/cards/${stringList[index]}.png',
                                                      width: 25.0,
                                                      height: 35.0,
                                                      fit: BoxFit.fill,
                                                    ))
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: height * 0.01),
                          child: Container(
                            height: height * 0.06,
                            width: width * 0.98,
                            decoration:
                             const BoxDecoration(color: AppColors.black12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: height / 25,
                                  width: width * 0.8,
                                  child: ListView.builder(
                                    itemCount: items.length,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, int index) {
                                      return Padding(
                                        padding:
                                        const EdgeInsets.only(right: 5),
                                        child: CircleAvatar(
                                          radius: height / 55,
                                          backgroundImage: AssetImage(
                                              items[index].number == 2
                                                  ? AndarAssets.andarbaharB
                                                  : AndarAssets.andarbaharA),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Image.asset(AppAssets.buttonsIcArrowZigzag,
                                    height: height / 19),
                              ],
                            ),
                            // color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: height * 0.20),
                child: Center(
                    child: Image.asset(
                      Assets.andarbaharGirlCharSeven,
                      width: width * 0.25,
                      height: height * 0.15,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<int> list = [10, 50, 100, 500];
  int andarCount = 0;
  int baharCount = 0;
  bool _isFrontTwo = false;

  List<Widget> andarCoins = [];
  List<Widget> baharCoins = [];

  randomNo(int min, int max) {
    Random random = Random();
    return double.parse((min + random.nextInt(max - min + 1)).toString());
  }

  void listClick(GlobalKey<CartIconKey> itemKey) async {
    await runAddToCartAnimation(itemKey);
    if (selectedCart == 1 && andar.currentState != null) {
      andar.currentState!.runCartAnimation((++_cartQuantityItems).toString());
      debugPrint('Selected Cart: Dragon');
    } else if (selectedCart == 2 && bahar.currentState != null) {
      bahar.currentState!.runCartAnimation((++_cartQuantityItems).toString());
      debugPrint('Selected Cart: Tie');
    }
  }

  List<Widget> coins1 = [];
  List<Widget> coins2 = [];
  void _addCoins(int count) {
    for (int i = 0; i < count; i++) {
      Timer(Duration(milliseconds: i * 200), () {
        setState(() {
          coins1.add(
            const _AnimatedCoin(
              type: 0,
            ),
          );
          coins2.add(
            const _AnimatedCoin(
              type: 1,
            ),
          );
        });
      });
    }
  }

  List<LastFifteen> items = [];

  Future<void> fetchData() async {
    var gameids = widget.gameId;
    final response =
    await http.get(Uri.parse("${ApiUrl.resultList}$gameids&limit=9"));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body)['data'];
      setState(() {
        items = responseData.map((item) => LastFifteen.fromJson(item)).toList();
      });
    } else if (response.statusCode == 400) {
      if (kDebugMode) {
        print('Data not found');
      }
    } else {
      setState(() {
        items = [];
      });
      throw Exception('Failed to load data');
    }
  }

  ///betting API

  Future<void> bettingApi(BuildContext context) async {
    try {
      // Fetch userId
      UserViewModel userViewModal = UserViewModel();
      String? userId = await userViewModal.getUser();

      // Prepare the bet list
      final betList = [
        {'number': '1', 'amount': andarCount.toString()},
        {'number': '2', 'amount': baharCount.toString()},
      ];

      // Make the API request
      final response = await http.post(
        Uri.parse(ApiUrl.dragonBet),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "userid": userId,
          "game_id": widget.gameId,
          "json": betList,
        }),
      );

      // Log the request details (Debug Mode)
      if (kDebugMode) {
        print('Request Payload: ${{
          "userid": userId,
          "game_id": widget.gameId,
          "json": betList,
        }}');
      }

      // Parse the response
      var data = jsonDecode(response.body);

      // Handle the response
      if (response.statusCode == 200 && data["status"] == 200) {
        // Success response
        ImageToast.show(
          imagePath: AppAssets.bettingplaceds,
          height: 100,
          context: context,
        );
        countAndCoinClear();
      } else {
        // Error response
        String errorMessage = data['message'] ?? 'An error occurred';
        Utils.flushBarErrorMessage(errorMessage, context);
      }
    } catch (e) {
      // Handle unexpected errors
      Utils.flushBarErrorMessage('Failed to place bet: $e', context);
      if (kDebugMode) {
        print('Error occurred: $e');
      }
    }
  }

  dynamic winResult;
  dynamic gamesNo;
  dynamic resultCard;
  dynamic winnerCard;

  List<String> stringList = [];
  lastResultView(context) async {
    var gameids = widget.gameId;
    try {
      final url = Uri.parse('${ApiUrl.resultList}$gameids&limit=1');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body)["data"][0];
        final responseData1 = json.decode(response.body);
        setState(() {
          winResult = responseData["number"];
          gamesNo = responseData["games_no"] + 1;
          resultCard = responseData["random_card"];
          winnerCard = responseData1["winner_no"];
          final List<dynamic> cardImage = json.decode(responseData["json"]);
          stringList =
              cardImage.map((dynamic item) => item.toString()).toList();
        });
        winResult == 1
            ? AndarBaharToast.show(
            context: context,
            message: 'Andar Win',
            winCard: winnerCard.toString())
            : AndarBaharToast.show(
            context: context,
            message: 'Bahar Win',
            winCard: winnerCard.toString());
      } else {
        throw Exception(
            "Failed to load data. Status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Failed to load data. $e");
    }
  }

  dynamic singleImage;

  ///singleCard

  Future<void> singleCard() async {
    var gameids = widget.gameId;
    try {
      final url = Uri.parse('${ApiUrl.resultList}$gameids&limit=1');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body)["data"][0];
        setState(() {
          singleImage = responseData["random_card"];
          responseData["gamesno"];
        });
      } else {
        throw Exception(
            "Failed to load data. Status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Failed to load data. $e");
    }
  }

  /// game win popup

  gameWinPopup(context) async {
    UserViewModel userViewModal = UserViewModel();
    String? userId = await userViewModal.getUser();
    final response = await http.get(
      Uri.parse('${ApiUrl.game_win}$userId&game_id=$gameid&games_no=$gamesNo'),
    );
    var data = jsonDecode(response.body);
    if (data["status"] == 200) {
      var win = data["win"].toString();
      var result = data["result"].toString();
      var gsm = data["gamesno"].toString();
      win == '0'
          ? ImageToastWingo.showloss(
          subtext: result, subtext1: gsm, subtext2: win, context: context)
          : ImageToastWingo.showwin(
        subtext: result,
        subtext1: gsm,
        subtext2: win,
        context: context,
      );
    } else {
      setState(() {
        // loadingGreen = false;
      });
    }
  }
}

class _AnimatedCoin extends StatefulWidget {
  final int type;

  const _AnimatedCoin({required this.type});
  @override
  _AnimatedCoinState createState() => _AnimatedCoinState();
}

class _AnimatedCoinState extends State<_AnimatedCoin> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _animation = widget.type == 1
        ? Tween<Offset>(
      begin: const Offset(2, 150),
      end: _randomOffset(50, 30),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutBack,
      ),
    )
        : Tween<Offset>(
      begin: const Offset(150, 250),
      end: _randomOffset(50, 50),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutBack,
      ),
    );

    _controller.forward();
  }

  doublePj(double start, double end) {
    Random random = Random();

    return start + random.nextDouble() * (end - start);
  }

  Offset _randomOffset(double start, double end) {
    double randomPositionX = doublePj(50, 200);
    double randomPositionY = doublePj(50, 100);
    return Offset(randomPositionX, randomPositionY);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: _animation.value,
          child: const CoinSpringAnimation(),
        );
      },
    );
  }
}
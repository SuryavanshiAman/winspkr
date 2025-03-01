import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wins_pkr/view/trx/controller/trx_controller.dart';
import 'package:wins_pkr/view/trx/res/trx_text_widget.dart';
import 'package:wins_pkr/view/trx/view_model/trx_bet_view_model.dart';

class TrxBottomSheet extends StatefulWidget {
  final TrxComBetModel data;
  const TrxBottomSheet({super.key, required this.data});

  @override
  State<TrxBottomSheet> createState() => _TrxBottomSheetState();
}

class _TrxBottomSheetState extends State<TrxBottomSheet> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final result = Provider.of<TrxController>(context,listen: false);
    result.finalAmount.text="1";
    result.setSelectedIndexMultiplier(0);
    result.setSelectedBIndex(0);
  }
  @override
  void dispose() {
    final result = Provider.of<TrxController>(context,listen: false);
    result.finalAmount.clear();
    super.dispose();
  }
  bool iAgree = true;
  @override
  Widget build(BuildContext context) {
    LinearGradient gradient = LinearGradient(
        colors: [widget.data.colFir, widget.data.colSec],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        tileMode: TileMode.mirror);
    final trxBetViewModel = Provider.of<TrxBetViewModel>(context);
    return SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Consumer<TrxController>(builder: (context, trc, child) {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            height: height * 0.59,
            width: width,
            child: Column(
              children: [
                Container(
                  height: height * 0.05,
                  width: width,
                  decoration: BoxDecoration(
                    color: widget.data.colFir,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TrxTextWidget(
                        title: trc.trxTimerList[trc.gameIndex].title,
                        color: AppColors.whiteColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(width: 10),
                      TrxTextWidget(
                        title: trc.trxTimerList[trc.gameIndex].subTitle,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ],
                  ),
                ),
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    SizedBox(
                        width: width,
                        child: SizedBox(
                          width: 200,
                          height: 200,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                height: 200,
                                width: width,
                                child: ShaderMask(
                                  shaderCallback: (Rect bounds) {
                                    return gradient.createShader(bounds);
                                  },
                                  blendMode: BlendMode.srcATop,
                                  child: CustomPaint(
                                    painter: _InvertedTrianglePainterSingle(),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 35,
                                bottom: 65,
                                child: Transform.rotate(
                                  angle: -0.18,
                                  child: SizedBox(
                                    height: 200,
                                    width: width,
                                    child: CustomPaint(
                                      painter: _InvertedTrianglePainterDouble([
                                        widget.data.colFir,
                                        widget.data.colSec
                                      ]),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Select :  ${widget.data.title}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 20),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(25, 10, 0, 5),
                          width: width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Balance",
                                style: TextStyle(
                                    fontSize: 18, color: AppColors.blackColor),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: width,
                                height: 30,
                                child: Center(
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: trc.balanceList.length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                            onTap: () {
                                              trc.setSelectedBIndex(index);
                                              trc.amount.text = trc.balanceList[trc.selectedIndexBalance].toString();
                                            },
                                            child: Container(
                                                width: width * 0.2,
                                                decoration: BoxDecoration(
                                                  color:
                                                      trc.selectedIndexBalance ==
                                                              index
                                                          ? widget.data.colFir
                                                          : const Color(
                                                              0xFFeeeeee),
                                                ),
                                                margin: const EdgeInsets.only(
                                                    right: 5),
                                                padding:
                                                    const EdgeInsets.all(5),
                                                child: Center(
                                                  child: Text(
                                                    trc.balanceList[index]
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            trc.selectedIndexBalance ==
                                                                    index
                                                                ? Colors.white
                                                                : Colors.black),
                                                  ),
                                                )));
                                      }),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(25, 15, 18, 5),
                          width: width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Quantity",
                                style: TextStyle(
                                    fontSize: 18, color: AppColors.blackColor),
                              ),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        trc.decrement();
                                      },
                                      child: Icon(
                                        Icons.remove_circle,
                                        color: widget.data.colFir,
                                        size: 35,
                                      ),
                                    ),
                                    Container(
                                        height: 35,
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.all(4),
                                        width: 75,
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                        ),
                                        child: TextField(
                                          controller: trc.amount,
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.center,
                                          decoration: const InputDecoration(
                                              border: InputBorder.none),
                                          style: const TextStyle(
                                              fontSize: 18,
                                              color: Colors.black),
                                        )),
                                    InkWell(
                                      onTap: () {
                                        trc.increment();
                                      },
                                      child: Icon(
                                        Icons.add_circle,
                                        color: widget.data.colFir,
                                        size: 35,
                                      ),
                                    ),
                                  ]),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 35,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: trc.multiplierList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: InkWell(
                            onTap: () {
                              trc.setSelectedIndexMultiplier(index);
                            },
                            child: Container(
                              width: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: trc.selectedIndexMultiplier == index
                                    ? widget.data.colFir
                                    : const Color(0xFFeeeeee),
                              ),
                              child: Text("X${trc.multiplierList[index]}",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color:
                                          trc.selectedIndexMultiplier == index
                                              ? Colors.white
                                              : Colors.black)),
                            ),
                          ));
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          iAgree = !iAgree;
                        });
                      },
                      child: Container(
                          height: 30,
                          width: 30,
                          alignment: Alignment.center,
                          decoration: iAgree
                              ? BoxDecoration(
                                  color: widget.data.colFir,
                                  border: Border.all(color: widget.data.colFir),
                                  borderRadius:
                                      BorderRadiusDirectional.circular(50),
                                )
                              : BoxDecoration(
                                  border: Border.all(color: widget.data.colFir),
                                  borderRadius:
                                      BorderRadiusDirectional.circular(50),
                                ),
                          child: iAgree
                              ? const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                )
                              : null),
                    ),
                    const Text(
                      " I agree",
                      style: TextStyle(color: Colors.black),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        "《Pre-sale rules》",
                        style: TextStyle(color: AppColors.whiteColor),
                      ),
                    )
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.black.withOpacity(0.7),
                        width: width / 3,
                        height: 45,
                        child: const Text(
                          "Cancel",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        trxBetViewModel.trxAddBet(
                            widget.data.gameId,
                            trc.amount.text,
                            trc.trxTimerList[trc.gameIndex].gameId,
                            context);
                      },
                      child: Center(
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(color: widget.data.colFir),
                          width: width / 1.5,
                          height: 45,
                          child: Text(
                            "Total amount ${trc.amount.text}",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}

class _InvertedTrianglePainterSingle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..strokeWidth = 3.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;

    final Path path = Path();
    path.moveTo(size.width / -1.8, 0);
    path.lineTo(size.width * 1.5, 0);
    path.lineTo(size.width / 2, size.height / 2.8);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class _InvertedTrianglePainterDouble extends CustomPainter {
  final List<Color>? color;

  _InvertedTrianglePainterDouble(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint1 = Paint()
      ..strokeWidth = 3.0
      ..strokeCap = StrokeCap.round
      ..color = color!.last
      ..style = PaintingStyle.fill;

    final Path path1 = Path();
    path1.moveTo(size.width / 5, -5);
    path1.lineTo(size.width * 15, 0);
    path1.lineTo(size.width / 2, size.height / 2.8);

    canvas.drawPath(path1, paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

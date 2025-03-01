import 'package:flutter/material.dart';
import 'package:wins_pkr/Aviator/progressbar.dart';
import 'package:wins_pkr/view/vip/widget/vip_text_widget.dart';
import 'package:provider/provider.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/generated/assets.dart';
import 'package:wins_pkr/main.dart';
import 'package:wins_pkr/view_modal/vip_show_list_view_model.dart';


class VipShowList extends StatelessWidget {
  const VipShowList({super.key});

  @override
  Widget build(BuildContext context) {
    List<VipLevel> vipLevel = [
      VipLevel(
        bgImage: Assets.vipVipBg1,
        title: 'Vip1',
        topImg: Assets.vipVipTop1,
        levelImage: Assets.vipVip1,
        bottomColor: AppColors.vip1,
        backGroundColor: AppColors.vipColor1,
      ),
      VipLevel(
        bgImage: Assets.vipVipBg2,
        title: 'Vip2',
        topImg: Assets.vipVipTop2,
        levelImage: Assets.vipVip2,
        bottomColor: AppColors.vip2,
        backGroundColor: AppColors.vipColor2,
      ),
      VipLevel(
        bgImage: Assets.vipVipBg3,
        title: 'Vip3',
        topImg: Assets.vipVipTop2,
        levelImage: Assets.vipVip3,
        bottomColor: AppColors.vip3,
        backGroundColor: AppColors.vipColor3,
      ),
      VipLevel(
        bgImage: Assets.vipVipBg4,
        title: 'Vip4',
        topImg: Assets.vipVipTop2,
        levelImage: Assets.vipVip4,
        bottomColor: AppColors.vip4,
        backGroundColor: AppColors.vipColor4,
      ),
      VipLevel(
        bgImage: Assets.vipVipBg5,
        title: 'Vip5',
        topImg: Assets.vipVipTop2,
        levelImage: Assets.vipVip5,
        bottomColor: AppColors.vip5,
        backGroundColor: AppColors.vipColor5,
      ),
      VipLevel(
        bgImage: Assets.vipVipBg6,
        title: 'Vip6',
        topImg: Assets.vipVipTop2,
        levelImage: Assets.vipVip6,
        bottomColor: AppColors.vip6,
        backGroundColor: AppColors.vipColor6,
      ),
      VipLevel(
        bgImage: Assets.vipVipBg7,
        title: 'Vip7',
        topImg: Assets.vipVipTop2,
        levelImage: Assets.vipVip7,
        bottomColor: AppColors.vip7,
        backGroundColor: AppColors.vipColor7,
      ),
      VipLevel(
        bgImage: Assets.vipVipBg8,
        title: 'Vip8',
        topImg: Assets.vipVipTop2,
        levelImage: Assets.vipVip8,
        bottomColor: AppColors.vip8,
        // status: '0',
        backGroundColor: AppColors.vipColor8,
      ),
      VipLevel(
        bgImage: Assets.vipVipBg9,
        title: 'Vip9',
        topImg: Assets.vipVipTop2,
        levelImage: Assets.vipVip9,
        bottomColor: AppColors.vip9,
        backGroundColor: AppColors.vipColor9,
      ),
      VipLevel(
        bgImage: Assets.vipVipBg10,
        title: 'Vip10',
        topImg: Assets.vipVipTop2,
        levelImage: Assets.vipVip10,
        bottomColor: AppColors.vip10,
        backGroundColor: AppColors.vipColor10,
      ),
    ];
    final vipShLiViMo = Provider.of<VipShowListViewModel>(context);
    return SizedBox(
        height: height * 0.25,
        width: width*0.93,
        child: vipShLiViMo.vipShowListModel != null
            ? PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: vipLevel.length,
                onPageChanged: (index) {
                  vipShLiViMo.setIndexData(index);
                },
                itemBuilder: (context, index) {
                  final res = vipShLiViMo.vipShowListModel!.data![index];
                  return vipShLiViMo.vipShowListModel!.data!.isNotEmpty
                      ? Container(
                          padding: const EdgeInsets.all(8),
                          height: height * 0.18,
                          width: width * 0.8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: vipLevel[index].bottomColor,
                              image: DecorationImage(
                                  image: AssetImage(
                                      vipLevel[index].bgImage.toString()),
                                  fit: BoxFit.cover)),
                          child: Column(
                            children: [
                              SizedBox(
                                height: height * 0.1,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height: height * 0.1,
                                      width: width * 0.52,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Image(
                                                image: AssetImage(
                                                    vipLevel[index]
                                                        .topImg
                                                        .toString()),
                                                height: 30,
                                              ),
                                              VipTextWidget(
                                                  text: vipLevel[index]
                                                      .title
                                                      .toString(),
                                                  color:
                                                      const Color(0xFFFFFFFF),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700),
                                              Image(
                                                image: AssetImage(res.status ==
                                                        1
                                                    ? Assets.vipVipTick
                                                    : Assets.vipVipUnLocked),
                                                height: 18,
                                              ),
                                              VipTextWidget(
                                                  text: res.status == 1
                                                      ? 'Achieved'
                                                      : 'Not opened yet',
                                                  color:
                                                      const Color(0xFFFFFFFF),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400),
                                            ],
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            height: height * 0.03,
                                            width: width * 0.32,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.white),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: VipTextWidget(
                                                text:
                                                    ' Dear ${vipLevel[index].title.toString()} customer',
                                                color: Colors.white),
                                          ),
                                          res.status == 0
                                              ? const VipTextWidget(
                                                  text: 'Level maintenance',
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 12)
                                              : Container(),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.1,
                                      width: width * 0.22,
                                      child: Image(
                                        image: AssetImage(vipLevel[index]
                                            .levelImage
                                            .toString()),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              res.status != 1
                                  ? SizedBox(
                                      height: height * 0.1,
                                      // color: Colors.purpleAccent,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                height: 20,
                                                padding: const EdgeInsets.only(left: 5,right: 5),
                                                decoration: BoxDecoration(
                                                    color: Colors.black
                                                        .withOpacity(0.5),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: VipTextWidget(
                                                    text:
                                                        '${res.betAmount}/${res.rangeAmount}',
                                                    color: Colors.white),
                                              ),
                                              VipTextWidget(
                                                  text:
                                                      '${res.percentage}% Completed',
                                                  color: Colors.white),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            child: LinearPercentIndicator(
                                              animation: true,
                                              animationDuration: 1000,
                                              lineHeight: 9.0,
                                              percent: res.percentage! / 100,
                                              progressColor: Colors.yellow[400],
                                              backgroundColor: vipLevel[index]
                                                  .backGroundColor,
                                            ),
                                          ),
                                          const VipTextWidget(
                                              text:
                                                  '   Incomplete will be deducted by the system',
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700)
                                        ],
                                      ),
                                    )
                                  : VipTextWidget(
                                      text:
                                          'Received ${vipLevel[index].title} level bonus',
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700)
                            ],
                          ),
                        )
                      : Container();
                },
              )
            : Container());
  }
}

class VipLevel {
  final String bgImage;
  final String title;
  final String levelImage;
  final Color? bottomColor;
  final Color? backGroundColor;
  final String? topImg;

  VipLevel({
    required this.bgImage,
    required this.title,
    required this.levelImage,
    required this.bottomColor,
    required this.backGroundColor,
    required this.topImg,
  });
}

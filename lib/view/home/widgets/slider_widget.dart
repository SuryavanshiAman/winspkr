import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/main.dart';
import 'package:wins_pkr/view_modal/slider_view_modal.dart';
import 'package:provider/provider.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  SliderWidgetState createState() => SliderWidgetState();
}

class SliderWidgetState extends State<SliderWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final sliderViewModel =
          Provider.of<SliderViewModel>(context, listen: false);
      sliderViewModel.sliderApi(context);
    });
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final sliderViewModel = Provider.of<SliderViewModel>(context);
    if (sliderViewModel.sliderModelData != null) {
      return Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: height * 0.2,
                enlargeCenterPage: false,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                enableInfiniteScroll: true,
                initialPage: 0,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: sliderViewModel.sliderModelData?.data
                  ?.map((item) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(item.image.toString()),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ))
                  .toList(),
            ),
            if (sliderViewModel.sliderModelData != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: sliderViewModel.sliderModelData!.data!
                    .asMap()
                    .entries
                    .map((entry) {
                  return GestureDetector(
                    onTap: () => CarouselSlider(
                      options: CarouselOptions(initialPage: entry.key),
                      items: const [],
                    ),
                    child: Container(
                      width: width * 0.03,
                      height: height * 0.003,
                      margin: EdgeInsets.symmetric(
                          vertical: height * 0.01, horizontal: width * 0.001),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        shape: BoxShape.rectangle,
                        color: _currentIndex == entry.key
                            ? AppColors.lightMarron
                            : Colors.grey,
                      ),
                    ),
                  );
                }).toList(),
              ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../utility/app_colors.dart';
import '../utility/assets_path.dart';

class CarouselBanner extends StatefulWidget {
  const CarouselBanner({
    super.key,
    this.height,
  });

  final double? height;

  @override
  State<CarouselBanner> createState() => _CarouselBannerState();
}

class _CarouselBannerState extends State<CarouselBanner> {
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: widget.height ?? 180.0,
            onPageChanged: (index, reason) {
              _currentIndex.value = index;
            },
            viewportFraction: 1,
            autoPlay: true,
          ),
          items: [
            AssetsPath.c1,
            AssetsPath.c2,
            AssetsPath.c3,
            AssetsPath.c4,
            AssetsPath.c5,
          ].map((assetPath) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 1.0),
                  decoration: BoxDecoration(
                    color: AppColors.p1,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: Alignment.center,
                  child: Image.asset(
                    assetPath,
                    fit: BoxFit
                        .cover, // Ensure the image fully fits within the container
                    height: widget.height ??
                        180.0, // Set the height to match carousel height
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 6),
        ValueListenableBuilder(
          valueListenable: _currentIndex,
          builder: (context, index, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 5; i++)
                  Container(
                    height: 14,
                    width: 14,
                    margin: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: i == index
                          ? AppColors.primaryColor
                          : Colors.transparent,
                      border: Border.all(
                        color: i == index
                            ? AppColors.primaryColor
                            : Colors.grey.shade400,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  )
              ],
            );
          },
        ),
      ],
    );
  }
}

import 'package:e_commerce/constants/colors.dart';
import 'package:e_commerce/widgets/main_widgets.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: _body(),
    );
  }

  _body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Animation
        const SizedBox(
            height: 268,
            child: RiveAnimation.asset('assets/animations/monster-game.riv')),
        // Title
        Padding(
          padding: const EdgeInsets.only(top: 19.0, bottom: 8),
          child: MainWidgets.mainText('This product is unavailable.'),
        ),
        // Space
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 52),
          child: MainWidgets.mainText(
              'Unfortunately, this product might be out of stock or unavailable to order.',
              weight: FontWeight.w400),
        ),
        // Space
        const SizedBox(
          height: 81,
        ),

        // Bottom Button
        _button(),
      ],
    );
  }

  _button() {
    return InkWell(
      onTap: null,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              height: 72,
              width: 192,
              decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(18)),
            ),
          ),
          Container(
            height: 72,
            width: 192,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(18)),
            child: MainWidgets.mainText('See What’s New',
                color: Colors.black, weight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

import 'package:e_commerce/pages/product_detail/product_details.dart';
import 'package:e_commerce/widgets/main_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/globals.dart' as globals;

class ProductCard extends StatelessWidget {
  final dynamic product;
  const ProductCard(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => const ProductDetailPage()),
      child: Column(
        children: [
          Stack(
            children: [
              // Image
              ClipRRect(
                borderRadius: BorderRadius.circular(19),
                child: Image.asset(
                  product["image"],
                  height: 213,
                  width: globals.screenWidth * 0.48,
                  fit: BoxFit.fill,
                ),
              ),
              // Fav Button
              Positioned(
                right: 13,
                top: 13,
                child: InkWell(
                  onTap: () => print('Fav'),
                  child: Container(
                    height: 33,
                    width: 33,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFFC4C4C6).withOpacity(0.8)),
                    child: Icon(
                      Icons.favorite,
                      size: 19,
                      color: product["isFav"] ? Colors.purple : Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Title & Price
          Container(
            alignment: Alignment.centerLeft,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 13),
                  child: MainWidgets.mainText(product["title"] ?? ''),
                ),
                MainWidgets.mainText(product["price"] ?? ''),
              ],
            ),
          )
        ],
      ),
    );
  }
}

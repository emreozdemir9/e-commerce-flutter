import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_commerce/constants/colors.dart';
import 'package:e_commerce/constants/product_data.dart';
import 'package:e_commerce/pages/home/home_controller.dart';
import 'package:e_commerce/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:e_commerce/globals.dart' as globals;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomePageController controller = HomePageController();
  Color mainColor = const Color(0xFFD7FC70);
  final List<String> _categoryButtonList = [
    "Newest",
    "Accessories",
    "Hoodie",
    "Trend",
  ];
  final List<String> _topSliderImages = [
    "assets/images/image.png",
    "assets/images/image.png",
    "assets/images/image.png",
    "assets/images/image.png",
  ];

  @override
  Widget build(BuildContext context) {
    globals.screenHeight = MediaQuery.of(context).size.height;
    globals.screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65.0),
        child: AppBar(
          backgroundColor: AppColors.backgroundColor,
          leading: IconButton(
            icon: SvgPicture.asset(
              'assets/icons/filter.svg',
            ),
            onPressed: null,
          ),
          actions: [
            IconButton(
              icon: SvgPicture.asset(
                'assets/icons/search_appbar.svg',
              ),
              onPressed: null,
            ),
            IconButton(
              icon: SvgPicture.asset(
                'assets/icons/bag.svg',
              ),
              onPressed: null,
            ),
          ],
        ),
      ),
      body: _body(),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: const Color(0xFF1F1F1F),
            type: BottomNavigationBarType.fixed,
            currentIndex: 0,
            items: [
              _bottomNavigationItem('assets/icons/home.svg'),
              _bottomNavigationItem('assets/icons/search.svg'),
              _bottomNavigationItem('assets/icons/barcode_scan.svg'),
              _bottomNavigationItem('assets/icons/favorites.svg'),
              _bottomNavigationItem('assets/icons/user.svg'),
            ]),
      ),
    );
  }

  // Bottom Nav Items
  _bottomNavigationItem(String iconData) {
    return BottomNavigationBarItem(icon: SvgPicture.asset(iconData), label: '');
  }

  _body() {
    return Column(
      children: [
        // Top Image Slider
        _topSlider(),
        // Select Category Buttons
        _categoryButtons(),
        // Product List
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            primary: false,
            childAspectRatio: ((globals.screenWidth / 2) / 370),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children:
                ProductData.productList.map((e) => ProductCard(e)).toList(),
          ),
        ),
      ],
    );
  }

  // Carousel Image Slider
  Widget _topSlider() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 138.0,
            viewportFraction: 1,
            onPageChanged: (index, reason) =>
                controller.topSliderPosition.value = index,
          ),
          items: _topSliderImages.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Stack(
                  children: [
                    // Background
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(
                          right: 25.0, left: 34.0, bottom: 8),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(19),
                          border: Border.all(color: mainColor, width: 2)),
                    ),
                    // Image
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin:
                          const EdgeInsets.only(right: 33.0, left: 25, top: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(19),
                        child: Image.asset(
                          i,
                          height: 213,
                          fit: BoxFit.fill,
                        ),
                      ),
                    )
                  ],
                );
              },
            );
          }).toList(),
        ),
        // Slider Indicator
        Padding(
          padding: const EdgeInsets.only(left: 34, top: 15),
          child: Obx(
            () => DotsIndicator(
              dotsCount: _topSliderImages.length,
              position: controller.topSliderPosition.value.toDouble(),
              decorator: DotsDecorator(
                size: const Size.square(6.0),
                activeColor: mainColor,
                activeSize: const Size(28.0, 6.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
          ),
        )
      ],
    );
  }

  // Category Button List
  Widget _categoryButtons() {
    return Container(
      height: 47,
      margin: const EdgeInsets.only(top: 34, bottom: 15),
      child: ListView.builder(
          itemCount: _categoryButtonList.length,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 18.5),
          shrinkWrap: true,
          itemBuilder: (ctx, i) {
            return GestureDetector(
              onTap: () => controller.selectedCategory.value = i,
              child: Obx(
                () => Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 5.5),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 34,
                  ),
                  decoration: BoxDecoration(
                      color: controller.selectedCategory.value == i
                          ? mainColor
                          : const Color(0xFF2B2B2B),
                      borderRadius: BorderRadius.circular(32)),
                  child: Text(
                    _categoryButtonList[i],
                    style: TextStyle(
                        color: controller.selectedCategory.value == i
                            ? Colors.black
                            : Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                ),
              ),
            );
          }),
    );
  }
}

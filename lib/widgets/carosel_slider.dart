import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarouselSlider extends StatelessWidget {
  CustomCarouselSlider({super.key});

  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);

  final List<Map<String, String>> _carouselItems = [
    {
      "image": "images/banner-images/headphone.png",
      "title": "Wireless Headphones",
      "description": "High-quality sound with noise cancellation.",
      "price": "\$299"
    },
    {
      "image": "images/banner-images/tv.png",
      "title": "Smart TV",
      "description": "Experience 4K Ultra HD with amazing clarity.",
      "price": "\$899"
    },
    {
      "image": "images/banner-images/xbox.png",
      "title": "XBOX",
      "description": "The ultimate gaming experience with next-gen features.",
      "price": "\$499"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: false,
            autoPlayInterval: const Duration(seconds: 3),
            height: 220,
            viewportFraction: 1,
            onPageChanged: (currentIndex, reason) {
              _selectedIndex.value = currentIndex;
            },
          ),
          items: _carouselItems.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.pink.shade50,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        spreadRadius: 2,
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Image.asset(
                          item["image"]!,
                          fit: BoxFit.contain,
                          width: MediaQuery.of(context).size.width * 0.5,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              item["title"]!,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              item["description"]!,
                              style: const TextStyle(fontSize: 14, color: Colors.black87),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              item["price"]!,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent,
                              ),
                            ),
                            const SizedBox(height: 8),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.redAccent,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                              ),
                              onPressed: () {},
                              child: const Text("Buy Now"),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 8),
        ValueListenableBuilder(
          valueListenable: _selectedIndex,
          builder: (context, value, _) {
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_carouselItems.length, (i) {
                  return Container(
                    height: 8,
                    width: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: value == i ? Colors.redAccent : Colors.grey.shade300,
                      shape: BoxShape.circle,
                    ),
                  );
                }),
              ),
            );
          },
        ),
      ],
    );
  }
}

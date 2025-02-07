import 'package:flutter/material.dart';
import 'package:pandawebsite/screens/about_screen.dart';
import 'package:pandawebsite/screens/backpack_screen.dart';
import 'package:pandawebsite/screens/cart_screen.dart';
import 'package:pandawebsite/screens/home_screen.dart';
import 'package:pandawebsite/screens/product_list_screen.dart';
import 'package:pandawebsite/screens/shoes_screen.dart';
import 'package:pandawebsite/widgets/carosel_slider.dart';
import 'package:pandawebsite/widgets/category_item_widget.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> with SingleTickerProviderStateMixin {
  bool _isNavVisible = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  void _toggleNavMenu() {
    setState(() {
      _isNavVisible = !_isNavVisible;
      if (_isNavVisible) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  void _navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset('images/logo.png'),
                              IconButton(
                                onPressed: _toggleNavMenu,
                                icon: const Icon(Icons.list_outlined, size: 40),
                              ),
                            ],
                          ),
                          SizeTransition(
                            sizeFactor: _animation,
                            child: Align(
                              alignment: Alignment.centerLeft, 
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Divider(),
                                  _navItem('Home', const HomeScreen()),
                                  _navItem('Shoes', const ProductListScreen(categoryName: "Shoes", imageUrl: 'images/categories/shoes.png',)),
                                  _navItem('Backpack', const ProductListScreen(categoryName: "BackPack", imageUrl: 'images/bags/bag-1.png')),
                                  _navItem('Watch', const ProductListScreen(categoryName: "Watch", imageUrl: 'images/categories/watch.png')),
                                  _navItem('Cart', const CartScreen()),
                                  _navItem('About', const AboutUsScreen()),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                CustomCarouselSlider(),
                const SizedBox(height: 16),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      CategoryItemWidget(categoryName: 'Shoe', color: Colors.deepOrangeAccent),
                      CategoryItemWidget(categoryName: 'Bag', color: Colors.blueAccent),
                      CategoryItemWidget(categoryName: 'Watch', color: Colors.cyan),
                    ],
                  ),
                ),



              ],

            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(8)
              ),
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  // Additional Text Content (before footer links)
                  const Text(
                    'We are a dedicated team working to bring the best products and services to our customers. Thank you for visiting our website. For any queries, feel free to contact us.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  const SizedBox(height: 20),
                  // Footer Links
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _footerLink('Privacy Policy'),
                      const SizedBox(width: 20),
                      _footerLink('Terms of Service'),
                      const SizedBox(width: 20),
                      _footerLink('FAQ'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // Social Media Icons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.facebook, color: Colors.white),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.home, color: Colors.white),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.telegram, color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // Footer Text
                  const Text(
                    '© 2025 Billal Hossan,  Roll:03,  D-68  All rights reserved.',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),

        ],
      )
    );
  }

  Widget _navItem(String title, Widget screen) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: GestureDetector(
        onTap: () {
          _navigateToScreen(context, screen);
        },
        child: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget _footerLink(String title) {
    return GestureDetector(
      onTap: () {
        // Add navigation logic if needed
      },
      child: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}

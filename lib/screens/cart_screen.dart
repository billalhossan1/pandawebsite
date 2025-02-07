import 'package:flutter/material.dart';
import 'package:pandawebsite/widgets/cart_item_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});
  static String name = '/cart-screen';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart')
      ),
      body: SingleChildScrollView(
        child: Column(
          children: getCartList(),
        ),
      ),

    );
  }
  List<Widget>getCartList(){
    List<Widget>cartList=[];
    for(int i=0;i<6;i++){
      cartList.add(const CartItemWidget());
    }
    return cartList;
  }
}

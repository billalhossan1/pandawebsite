import 'package:flutter/material.dart';
import 'package:pandawebsite/widgets/product_item_widget.dart';
class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, required this.categoryName, required this.imageUrl});
  final String categoryName;
  final String imageUrl;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}


class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title:Text(widget.categoryName),),
        body: GridView.builder(
            itemCount: 20,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,  mainAxisSpacing: 16),
            itemBuilder: (context, index) {
              return FittedBox(child: ProductItemWidget(tittle: 'New Year Special 3D', rating: 4.5, price: 100, imageUrl: widget.imageUrl,));
            })
    );
  }
}

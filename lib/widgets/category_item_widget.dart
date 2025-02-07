import 'package:flutter/cupertino.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({super.key,  required this.categoryName, required this.color});
  final String categoryName;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: color,
        ),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(categoryName,style: const TextStyle(
            fontSize: 20,fontWeight: FontWeight.bold
          ),),
        ),
      ),
    );
  }
}

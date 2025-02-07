import 'package:flutter/material.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({
    super.key, required this.tittle, required this.rating, required this.price, required this.imageUrl,
  });
  final String imageUrl;
  final String tittle;
  final int price;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Card(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.blueAccent.shade200,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8))),
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                  height: 100,
                ),
              ),
              Column(

                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      tittle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('\$$price',style: const TextStyle(fontWeight: FontWeight.w600,color: Colors.blueAccent),),
                        const SizedBox(width: 6,),
                        Wrap(
                          children: [
                            const Icon(Icons.star,color: Colors.amber,size: 18,),
                            Text('$rating',style: const TextStyle(fontWeight: FontWeight.w400),),
                          ],
                        ),
                        const SizedBox(width: 8,),
                        const Icon(Icons.favorite,size: 18,)
                      ],
                    ),
                  )
                ],
              )
            ],
          )),
    );


  }

}

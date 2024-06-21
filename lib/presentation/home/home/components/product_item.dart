import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem(
      {super.key,
      required this.productName,
      this.oldPrice,
      required this.price,
      required this.imageUrl,
      this.isFavorite = false});

  final String productName;
  final double? oldPrice;
  final double price;
  final String imageUrl;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        )),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Stack(children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    image: NetworkImage(imageUrl),
                    height: 174,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    productName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      if (oldPrice != null)
                        Text(
                          '\$${oldPrice.toString()}',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      Text(
                        '\$${price.toString()}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
                right: 12,
                top: 12,
                child: IconButton(
                  style: ButtonStyle(
                    backgroundColor:
                        const WidgetStatePropertyAll<Color>(Colors.white),
                    shape: WidgetStatePropertyAll<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    fixedSize: const WidgetStatePropertyAll<Size>(
                      Size(32, 32),
                    ),
                  ),
                  icon: Center(
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                      size: 24,
                    ),
                  ),
                  onPressed: () {},
                ))
          ]),
        ),
      ),
    );
  }
}

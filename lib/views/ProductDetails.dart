import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  String? title;
  String? imgUrl;
  String? mrp;
  int? rate;
  double? discount;

  ProductDetails({
    this.mrp,
    this.imgUrl,
    this.title,
    this.rate,
    this.discount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
        centerTitle: true,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(imgUrl!),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    title!,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Rate :  ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        TextSpan(
                          text: "₹$mrp ",
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            wordSpacing: 4.0,
                            letterSpacing: 1.0,
                            fontSize: 18,
                          ),
                        ),
                        const TextSpan(
                          text: "Discount:  ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        TextSpan(
                          text: "${discount.toString()}%",
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            wordSpacing: 4.0,
                            letterSpacing: 1.0,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Price :  ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        TextSpan(
                          text: "₹$rate ",
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            wordSpacing: 4.0,
                            letterSpacing: 1.0,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {},
                    child: const Chip(
                      backgroundColor: Colors.red,
                      elevation: 4.0,
                      label: Text(
                        'Buy Now',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Chip(
                      avatar: CircleAvatar(
                        child: Icon(Icons.shopping_cart),
                      ),
                      backgroundColor: Colors.blue,
                      elevation: 4.0,
                      label: Text(
                        'add to cart',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

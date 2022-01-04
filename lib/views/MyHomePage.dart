import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:product_demo/controller/controller.dart';
import 'package:product_demo/models/prod_model.dart';
import 'package:product_demo/models/product_model.dart';
import 'package:product_demo/views/ProductDetails.dart';

class MyHomePage extends StatelessWidget {
  // final List<ProductModel> _products = [
  //   ProductModel(
  //     title: "IPhone",
  //     imageUrl:
  //         "https://cdn.pixabay.com/photo/2014/08/05/10/30/iphone-410324_960_720.jpg",
  //     description:
  //         "The iPhone is a smartphone made by Apple that combines a computer, iPod, digital camera and cellular phone into one device with a touchscreen interface. The iPhone runs the iOS operating system, and in 2021 when the iPhone 13 was introduced, it offered up to 1 TB of storage and a 12-megapixel camera.",
  //   ),
  //   ProductModel(
  //     title: "Samsung",
  //     imageUrl:
  //         "https://cdn.pixabay.com/photo/2016/03/27/19/43/samsung-1283938_960_720.jpg",
  //     description:
  //         "Samsung, South Korean company that is one of the world's largest producers of electronic devices. Samsung specializes in the production of a wide variety of consumer and industry electronics, including appliances, digital media devices, semiconductors, memory chips, and integrated systems.",
  //   ),
  //   ProductModel(
  //     title: "Nike Shoes",
  //     imageUrl:
  //         "https://cdn.pixabay.com/photo/2016/11/19/18/06/feet-1840619_960_720.jpg",
  //     description:
  //         "Nike, Inc is an American multinational corporation that is engaged in the design, development, manufacturing, and worldwide marketing and sales of footwear,.",
  //   ),
  //   ProductModel(
  //     title: "Nikon Camera",
  //     imageUrl:
  //         "https://cdn.pixabay.com/photo/2018/10/11/09/24/slr-camera-3739242_960_720.jpg",
  //     description:
  //         "Nikon Small World (Nikon's Small World) is a photographic contest run by Nikon Instruments and a forum for showcasing the beauty and complexity of life as seen through the light microscope.[1] It serves as a window into a world that can only be seen through the lens of an optical microscope. The contest comprises two separate competitions",
  //   ),
  //   ProductModel(
  //     title: "Mac Book",
  //     imageUrl:
  //         "https://cdn.pixabay.com/photo/2020/12/18/16/56/laptop-5842509_960_720.jpg",
  //     description:
  //         "The MacBook is a brand of Macintosh notebook computers designed and marketed by Apple Inc. that use Apple's macOS operating system since 2006.",
  //   ),
  //   ProductModel(
  //     title: "Play Station ",
  //     imageUrl:
  //         "https://cdn.pixabay.com/photo/2017/08/10/07/29/sony-2619483_960_720.jpg",
  //     description:
  //         "The PlayStation 5's main hardware features include a solid-state drive customized for high-speed data streaming to enable significant improvements in storage performance, an AMD GPU capable of 4K resolution display at up to 120 frames per second, hardware-accelerated ray tracing for realistic lighting and reflections",
  //   ),
  //   ProductModel(
  //     title: "HP Laptop",
  //     imageUrl:
  //         "https://cdn.pixabay.com/photo/2016/06/08/10/35/laptop-1443559_960_720.jpg",
  //     description:
  //         "HP offers a wide array of high-powered laptops that are built to boost your business or career.",
  //   ),
  //   ProductModel(
  //     title: "Range Rover",
  //     imageUrl:
  //         "https://cdn.pixabay.com/photo/2017/01/28/16/03/range-rover-2015653_960_720.jpg",
  //     description:
  //         "The Land Rover Range Rover (generally known simply as the Range Rover) is a 4x4 motor car produced by Land Rover, a marque and sub-brand of Jaguar Land Rover. The Range Rover line was launched in 1970 by British Leyland and is now in its fifth generation.",
  //   ),
  //   ProductModel(
  //     title: "Lamborghini",
  //     imageUrl:
  //         "https://cdn.pixabay.com/photo/2019/10/21/07/41/lamborgini-4565361_960_720.jpg",
  //     description:
  //         "Automobili Lamborghini S.p.A. is an Italian brand and manufacturer of luxury sports cars and SUVs based in Sant'Agata Bolognese.",
  //   ),
  //   ProductModel(
  //     title: "Gucci purse ",
  //     imageUrl:
  //         "https://cdn.pixabay.com/photo/2021/12/12/02/36/bag-6864025_960_720.jpg",
  //     description:
  //         "Gucci was founded in 1921 by Guccio Gucci in Florence, Tuscany. Under the direction of Aldo Gucci (son of Guccio), Gucci became a worldwide-known brand, an icon of the Italian Dolce Vita. Following family feuds during the 1980s, the Gucci family was entirely ousted from the capital of the company by 1993. After this crisis, the brand was revived with a provocative 'Porno Chic' props. In 1999, Gucci was acquired by the French conglomerate Pinault Printemps Redoute, which later became Kering. During the 2010s, Gucci became an iconic 'geek-chic' brand.",
  //   ),
  // ];
  // @override
  Controller controller = Get.put(Controller());

  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: controller.products,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<Result> results = snapshot.data.result;
            return ListView.builder(
              itemCount: results.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    //    Get.to(
                    //     ProductDetails(
                    //       title: results[index].name,
                    //       mrp: results[index].mrp.toString(),
                    //       imgUrl: results[index].gallery!.mediumThumbnailLink,
                    //     ),
                    //   );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductDetails(
                          title: results[index].name,
                          mrp: results[index].mrp.toString(),
                          imgUrl: results[index].gallery!.mediumThumbnailLink,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.white70, width: 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 4.0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            height: 200,
                            width: 200,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                results[index].gallery!.mediumThumbnailLink!,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(
                                top: 30,
                              ),
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    results[index].name!,
                                    maxLines: 3,
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "MRP: ₹${results[index].mrp!}",
                                    style: const TextStyle(fontSize: 20),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app/models/Product.dart';
import 'package:flutter_app/models/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BodyProduct extends StatelessWidget {
  final Product product;

  const BodyProduct({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                      top: size.height * 0.15,
                      left: kDefaultPaddin,
                      right: kDefaultPaddin),
                  height: 500,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24))),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Color"),
                                Row(
                                  children: const [
                                    DotColor(
                                      color: Color(0xFF2F80BB),
                                      isSelected: true,
                                    ),
                                    DotColor(
                                      color: Color(0xFFF8C078),
                                    ),
                                    DotColor(
                                      color: Color(0xFFA29B9B),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: RichText(
                                text: TextSpan(
                                    style: TextStyle(color: kTextColor),
                                    children: [
                                  TextSpan(text: "Size\n"),
                                  TextSpan(
                                      text: "${product.size} cm",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold))
                                ])),
                          )
                        ],
                      ),
                      const SizedBox(height: kDefaultPaddin),
                      Text(product.description,
                          style: const TextStyle(height: 1.5)),
                      const SizedBox(height: kDefaultPaddin),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CartCouter(),
                          Container(
                            padding: EdgeInsets.all(8),
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                                color: Color(0xFFFF6464),
                                shape: BoxShape.circle),
                            child: SvgPicture.asset("assets/icons/heart.svg"),
                          )
                        ],
                      ),
                      const SizedBox(height: kDefaultPaddin),
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: 58,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                border: Border.all(color: Colors.black12)),
                            child: IconButton(
                              icon: SvgPicture.asset(
                                  "assets/icons/add_to_cart.svg"),
                              onPressed: () {},
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                margin:
                                    const EdgeInsets.only(left: kDefaultPaddin),
                                height: 50,
                                // color: product.color,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: product.color,
                                ),
                                child: Center(
                                  child: Text(
                                    "Buy Now".toUpperCase(),
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Aristorcatic Hand Bag",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        product.title,
                        style: Theme.of(context).textTheme.headline4?.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: size.height * 0.12),
                            child: RichText(
                                text: TextSpan(children: [
                              const TextSpan(text: "Price\n"),
                              TextSpan(
                                  text: "\$${product.price}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      ?.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold))
                            ])),
                          ),
                          const SizedBox(width: kDefaultPaddin),
                          Expanded(
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: kDefaultPaddin),
                                  child: Hero(
                                    tag: "${product.id}",
                                    child: Image.asset(
                                      product.image,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  )))
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CartCouter extends StatefulWidget {
  const CartCouter({Key? key}) : super(key: key);

  @override
  State<CartCouter> createState() => _CartCouterState();
}

class _CartCouterState extends State<CartCouter> {
  int numOfItems = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildSizedBox(
            icon: Icons.remove,
            press: () {
              setState(() {
                if (numOfItems == 1) return;
                numOfItems -= 1;
              });
            }),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin / 2),
          child: Text(numOfItems.toString().padLeft(2, "0"),
              style: Theme.of(context).textTheme.headline6),
        ),
        buildSizedBox(
            icon: Icons.add,
            press: () {
              setState(() {
                numOfItems += 1;
              });
            }),
      ],
    );
  }

  SizedBox buildSizedBox({required IconData icon, required Function press}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlinedButton(
        onPressed: () => press(),
        child: Icon(icon),
        style: OutlinedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(23)),
            padding: EdgeInsets.zero),
      ),
    );
  }
}

class DotColor extends StatelessWidget {
  final color;
  final isSelected;

  const DotColor({
    Key? key,
    required this.color,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(top: kDefaultPaddin / 4, right: kDefaultPaddin / 2),
      padding: EdgeInsets.all(2.5),
      width: 24,
      height: 24,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: isSelected ? color : Colors.transparent)),
      child: DecoratedBox(
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}

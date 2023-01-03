import 'package:flutter/material.dart';
import 'package:flutter_app/models/Product.dart';
import 'package:flutter_app/models/constants.dart';

class BodyProduct extends StatelessWidget {
  final Product product;

  const BodyProduct({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
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
                    top: size.height * 0.12,
                    left: kDefaultPaddin,
                    right: kDefaultPaddin,
                  ),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      )
                  ),
                  child: Text(product.title),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app/models/constants.dart';
import 'package:flutter_svg/svg.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ["Hand bag", "Jewellery", "Footwear", "Dresses"];
  int tabSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) => buildGestureDetector(index)),
      ),
    );
  }

  GestureDetector buildGestureDetector(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          tabSelected = index;
        });
      },
      child: Padding(
        padding:
        const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              categories[index],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: tabSelected == index
                      ? Colors.black
                      : kTextLightColor),
            ),
            Container(
              margin: EdgeInsets.only(top: kDefaultPaddin / 4),
              height: 2,
              width: 30,
              color: tabSelected == index
                  ? Colors.black
                  : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
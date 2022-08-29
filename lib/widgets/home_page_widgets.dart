import 'package:flutter/material.dart';

import '../constants.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.location_on_outlined,
                color: secondaryColor,
                size: 18,
              ),
              Text(location,
                  style: TextStyle(color: primaryColor, fontSize: 15)),
              Icon(Icons.arrow_drop_down_outlined),
            ],
          ),
          const Positioned(
              right: 0,
              child: Icon(
                Icons.filter_alt_outlined,
                size: 18,
              ))
        ]),
        Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                headerHome1,
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 25,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                'view all',
                style: TextStyle(
                    color: secondaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
        )
      ],
    );
  }
}

class SelectCategoryView extends StatelessWidget {
  final List<String> categoryTitle = <String>[
    'Phones',
    'Computers',
    'Health',
    'Books',
    'Food'
  ];
  final List<IconData> icons = <IconData>[
    Icons.phone_android_sharp,
    Icons.computer,
    Icons.health_and_safety_rounded,
    Icons.book_outlined,
    Icons.food_bank_outlined
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: icons.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Container(
                  height: 71,
                  width: 71,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle
                  ),
                  child: Icon(icons[index]),
                ),
                Text(categoryTitle[index], style: TextStyle(color: secondaryColor, fontSize: 12),)
              ],
            );
          }),
    );
  }
}

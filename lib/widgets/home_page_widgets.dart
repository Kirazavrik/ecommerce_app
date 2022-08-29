import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

class SelectCategoryView extends StatefulWidget {
  const SelectCategoryView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SelectCategoryState();
}

class SelectCategoryState extends State<SelectCategoryView> {
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

  late List<bool> _selected = List.generate(5, (i) => false);

  @override
  initState() {
    _selected[0] = true;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: icons.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                onTap: () {
                  setState(() {
                    _selected = List.generate(5, (i) => false);
                    _selected[index] = !_selected[index];
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: Column(
                    children: [
                      Container(
                        height: 71,
                        width: 71,
                        decoration: BoxDecoration(
                            color: _selected[index]
                                ? secondaryColor
                                : Colors.white,
                            shape: BoxShape.circle),
                        child: Icon(
                          icons[index],
                          color: _selected[index]
                              ? Colors.white
                              : const Color(0xffb3b3c3),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 7.0),
                        child: Text(
                          categoryTitle[index],
                          style: TextStyle(
                              color: _selected[index]
                                  ? secondaryColor
                                  : primaryColor,
                              fontSize: 12),
                        ),
                      )
                    ],
                  ),
                ));
          }),
    );
  }
}

class SearchField extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Expanded(
          child: SizedBox(
            height: 34,
            width: 300,
            child: TextField(

              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50)))
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 11.0),
          child: Icon(Icons.add),
        )
      ],
    );
  }

}

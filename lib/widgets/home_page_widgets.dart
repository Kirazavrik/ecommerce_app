import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/home_page/home_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transparent_image/transparent_image.dart';
import '../constants.dart';
import '../home_page/home_page_model.dart';

TextStyle SFProFonts = TextStyle(fontFamily: 'SFProDisplay');

class HomePageHeaderWidget extends StatelessWidget {
  const HomePageHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9.0),
      child: Column(
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
      ),
    );
  }
}

class SelectCategoryWidget extends StatefulWidget {
  const SelectCategoryWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SelectCategoryState();
}

class SelectCategoryState extends State<SelectCategoryWidget> {
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

class SearchFieldWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Expanded(
          child: SizedBox(
            height: 34,
            width: 300,
            child: TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.search),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      borderSide: BorderSide(color: Colors.white))),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 11.0),
          child: Container(
            height: 34,
            width: 34,
            decoration: const BoxDecoration(
                color: secondaryColor, shape: BoxShape.circle),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}

class HomeStoreWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9.0),
      child: BlocBuilder<HomePageCubit, HomePageState>(
        builder: (context, state) {
          var homeStoreList = state.model.homeStore;
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Hot sales',
                    style: TextStyle(
                        color: primaryColor,
                        fontSize: 25,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'see more',
                    style: TextStyle(
                        color: secondaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
              Container(
                height: 200,
                child: PageView.builder(
                    itemCount: homeStoreList!.length,
                    itemBuilder: (context, pagePosition) {
                      return homeStoreElement(homeStoreList![pagePosition]);
                    }),
              )
            ],
          );
        },
      ),
    );
  }

  Widget homeStoreElement(HomeStore homeStore) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          image: DecorationImage(
              image: NetworkImage(homeStore.picture!), fit: BoxFit.fill)),
      child: Stack(
        children: [
          if (homeStore.isNew != null)
            Positioned(
                top: 23,
                left: 24,
                child: Container(
                  alignment: Alignment.center,
                  height: 27,
                  width: 27,
                  decoration: const BoxDecoration(
                      color: secondaryColor, shape: BoxShape.circle),
                  child: Text(
                    'New',
                    style:
                        SFProFonts.copyWith(fontSize: 10, color: Colors.white),
                  ),
                )),
          Positioned(
              left: 24.0,
              top: 68.0,
              child: Text(
                homeStore.title!,
                style: SFProFonts.copyWith(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              )),
          Positioned(
              left: 24.0,
              top: 100,
              child: Text(
                homeStore.subtitle!,
                style: SFProFonts.copyWith(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              )),
          Positioned(
              left: 24.0,
              bottom: 34,
              child: SizedBox(
                height: 27.0,
                width: 98.0,
                child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.white),
                  child: Text(
                    'Buy now!',
                    style: SFProFonts.copyWith(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: primaryColor),
                  ),
                  onPressed: () {},
                ),
              ))
        ],
      ),
    );
  }
}

class BestSellerWidget extends StatelessWidget {
  List<BestSeller> bestSellers;

  BestSellerWidget({required this.bestSellers});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 9.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Best Seller',
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  'see more',
                  style: TextStyle(
                      color: secondaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
            Container(
              child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: bestSellers.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return bestSellerElement(bestSellers[index], context);
                  }),
            )
          ],
        ));
  }

  Widget bestSellerElement(BestSeller bestSeller, BuildContext context) {
    return SizedBox(
      height: 300,
      width: 181,
      child: Card(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Stack(
              children: [
                Image.network(
                  bestSeller.picture!,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return Center(child: Icon(Icons.error_outline_outlined));
                  },
                )
              ],
            ),
          ),
          Text(
            bestSeller.priceWithoutDiscount!.toString(),
            style: TextStyle(
                color: primaryColor, fontSize: 16, fontWeight: FontWeight.w700),
          )
        ],
      )),
    );
  }
}

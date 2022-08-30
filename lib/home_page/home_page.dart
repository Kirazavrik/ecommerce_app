import 'package:ecommerce/home_page/home_page_cubit.dart';
import 'package:ecommerce/repository.dart';
import 'package:ecommerce/widgets/home_page_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomePageCubit(Repository())..loadHomePage(),
        child: const HomeView());
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: '23'),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_time_rounded), label: '123')
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<HomePageCubit, HomePageState>(
          builder: (context, state) {
            switch (state.status) {
              case HomePageStatus.loading:
                return const CircularProgressIndicator();
              case HomePageStatus.success:
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        HomePageHeaderWidget(),
                        Padding(
                          padding:
                              EdgeInsets.only(top: 24.0, bottom: 35, left: 19),
                          child: SelectCategoryWidget(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 26.0, right: 8.0, bottom: 24),
                          child: SearchFieldWidget(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 24.0),
                          child: HomeStoreWidget(),
                        ),
                        BlocBuilder<HomePageCubit, HomePageState>(
                          builder: (context, state) {
                            var bestSellers = state.model.bestSeller!;
                            return BestSellerWidget(bestSellers: bestSellers,);
                          },
                        )
                      ],
                    ),
                  ),
                );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

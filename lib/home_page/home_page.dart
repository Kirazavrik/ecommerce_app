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
      appBar: AppBar(),
      body: BlocBuilder<HomePageCubit, HomePageState>(
        builder: (context, state) {
          switch (state.status) {
            case HomePageStatus.loading:
              return const CircularProgressIndicator();
            case HomePageStatus.success:
              return Padding(
                padding: const EdgeInsets.all(17.0),
                child: Column(
                  children: [
                    HomePageHeader(),
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: SelectCategoryView(),
                    )
                  ],
                ),
              );
          }
          return Container();
        },
      ),
    );
  }
}

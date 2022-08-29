import 'package:ecommerce/home_page/home_page_cubit.dart';
import 'package:ecommerce/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomePageCubit(Repository())..loadHomePage(),
        child: HomeView()
    );
  }
}

class HomeView extends StatelessWidget {
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
              return Center(
                child: Text(state.model.homeStore!.first.subtitle!),
              );
          }
          return Container();
        },
      ),
    );
  }
}

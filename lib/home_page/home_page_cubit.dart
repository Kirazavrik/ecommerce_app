import 'package:bloc/bloc.dart';
import 'package:ecommerce/home_page/home_page_model.dart';
import 'package:ecommerce/repository.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit(this._repository) : super(HomePageState());

  final Repository _repository;

  Future<void> loadHomePage() async {
    emit(state.copyWith(status: HomePageStatus.loading));
    try {
      final model = await _repository.fetchMainPageData();
      emit(state.copyWith(status: HomePageStatus.success, model: model));
    } on Exception {
      emit(state.copyWith(status: HomePageStatus.failure));
    }
  }

}

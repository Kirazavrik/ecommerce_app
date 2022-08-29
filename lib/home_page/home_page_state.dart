part of 'home_page_cubit.dart';

enum HomePageStatus { initial, loading, success, failure }

class HomePageState {
  HomePageState({this.status = HomePageStatus.initial, HomePageModel? model})
      : model = model ?? HomePageModel();

  final HomePageModel model;
  final HomePageStatus status;

  HomePageState copyWith({HomePageStatus? status, HomePageModel? model}) {
    return HomePageState(
        status: status ?? this.status, model: model ?? this.model);
  }
}

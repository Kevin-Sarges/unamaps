import 'package:unamaps/app/common/error/failure.dart';
import 'package:unamaps/app/features/home/domain/entity/home_entity.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  List<HomeEntity> andares;

  HomeSuccess(this.andares);
}

class HomeError extends HomeState {
  final Failure error;

  HomeError(this.error);
}

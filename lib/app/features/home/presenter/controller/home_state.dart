import 'package:unamaps/app/common/entity/local_entity.dart';
import 'package:unamaps/app/common/error/failure.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadgin extends HomeState {}

class HomeLocalLatLon extends HomeState {
  List<LocalEntity> local;

  HomeLocalLatLon(this.local);
}

class HomeSucess extends HomeState {
  double lat;
  double lon;

  HomeSucess(this.lat, this.lon);
}

class HomeError extends HomeState {
  Failure erro;

  HomeError(this.erro);
}

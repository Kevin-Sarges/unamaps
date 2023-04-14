import 'package:unamaps/app/common/entity/local_entity.dart';
import 'package:unamaps/app/common/error/failure.dart';

abstract class MapState {}

class MapInitial extends MapState {}

class MapLoading extends MapState {}

class MapSuccess extends MapState {
  double lat;
  double lon;
  List<LocalEntity> local;

  MapSuccess(this.lat, this.lon, this.local);
}

class MapError extends MapState {
  Failure erro;

  MapError(this.erro);
}

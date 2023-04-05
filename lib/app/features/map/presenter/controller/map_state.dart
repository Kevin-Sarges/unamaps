import 'package:unamaps/app/common/entity/local_entity.dart';
import 'package:unamaps/app/common/error/failure.dart';

abstract class MapState {}

class MapInitial extends MapState {}

class MapLoadgin extends MapState {}

class MapLocalLatLon extends MapState {
  List<LocalEntity> local;

  MapLocalLatLon(this.local);
}

class MapSucess extends MapState {
  double lat;
  double lon;

  MapSucess(this.lat, this.lon);
}

class MapError extends MapState {
  Failure erro;

  MapError(this.erro);
}

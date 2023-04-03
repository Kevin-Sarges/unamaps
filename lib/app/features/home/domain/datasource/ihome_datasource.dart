import 'package:geolocator/geolocator.dart';
import 'package:unamaps/app/common/entity/local_entity.dart';

abstract class HomeDataSourceImpl {
  Future<Position> getLatLonUser();
  Future<List<LocalEntity>> getLatLonLocal();
}

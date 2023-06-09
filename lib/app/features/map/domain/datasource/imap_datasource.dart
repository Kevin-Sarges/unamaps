import 'package:geolocator/geolocator.dart';
import 'package:unamaps/app/common/entity/local_entity.dart';

abstract class MapDataSourceImpl {
  Future<Position> getLatLonUser();
  Future<List<LocalEntity>> getLatLonLocal(String andar);
  Future<List<LocalEntity>> filterLocais(String tipoLocal, String andar);
}

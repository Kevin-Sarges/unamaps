import 'package:unamaps/app/common/entity/local_entity.dart';

class LocalModel extends LocalEntity {
  LocalModel({
    required super.lat,
    required super.lon,
    required super.nomeLocal,
    required super.tipoLocal,
    required super.marker,
    required super.foto,
  });

  factory LocalModel.fromJson(Map<String, dynamic> json) {
    return LocalModel(
      lat: json['lat'] as double,
      lon: json['lon'] as double,
      nomeLocal: json['nomeLocal'] as String,
      tipoLocal: json['tipoLocal'] as String,
      marker: json['marker'] as String,
      foto: json['foto'] as String,
    );
  }
}

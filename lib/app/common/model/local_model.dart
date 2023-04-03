import 'package:unamaps/app/common/entity/local_entity.dart';

class LocalModel extends LocalEntity {
  LocalModel({
    required super.lat,
    required super.lon,
    required super.nomeLocal,
  });

  factory LocalModel.fromJson(Map<String, dynamic> json) {
    return LocalModel(
      lat: json['lat'] as double,
      lon: json['lon'] as double,
      nomeLocal: json['nomeLocal'] as String,
    );
  }
}

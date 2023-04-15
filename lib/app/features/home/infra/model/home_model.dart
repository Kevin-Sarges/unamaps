import 'package:unamaps/app/features/home/domain/entity/home_entity.dart';

class HomeModel extends HomeEntity {
  HomeModel({required super.andar});

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(andar: json['andar'] as String);
  }
}

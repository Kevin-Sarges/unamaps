import 'package:unamaps/app/features/home/domain/entity/home_entity.dart';

abstract class HomeDataSourceImpl {
  Future<List<HomeEntity>> getAndares();
}

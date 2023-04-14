import 'package:unamaps/app/common/error/failure.dart';
import 'package:unamaps/app/common/entity/local_entity.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:dartz/dartz.dart';
import 'package:unamaps/app/features/map/domain/datasource/imap_datasource.dart';
import 'package:unamaps/app/features/map/domain/repository/imap_repository.dart';

class MapRepository implements MapRepositoryImpl {
  final MapDataSourceImpl dataSource;

  MapRepository({required this.dataSource});

  @override
  Future<Either<Failure, List<LocalEntity>>> getLatLonLocal() async {
    try {
      final result = await dataSource.getLatLonLocal();

      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, Position>> getLatLonUser() async {
    try {
      final result = await dataSource.getLatLonUser();

      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}

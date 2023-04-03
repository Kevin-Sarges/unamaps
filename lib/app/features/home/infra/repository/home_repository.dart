import 'package:unamaps/app/common/error/failure.dart';
import 'package:unamaps/app/common/entity/local_entity.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:dartz/dartz.dart';
import 'package:unamaps/app/features/home/domain/datasource/ihome_datasource.dart';
import 'package:unamaps/app/features/home/domain/repository/ihome_repository.dart';

class HomeRepository implements HomeRepositoryImpl {
  final HomeDataSourceImpl dataSource;

  HomeRepository({required this.dataSource});

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

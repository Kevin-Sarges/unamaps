import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:unamaps/app/common/entity/local_entity.dart';
import 'package:unamaps/app/common/error/failure.dart';

abstract class HomeRepositoryImpl {
  Future<Either<Failure, Position>> getLatLonUser();
  Future<Either<Failure, List<LocalEntity>>> getLatLonLocal();
}

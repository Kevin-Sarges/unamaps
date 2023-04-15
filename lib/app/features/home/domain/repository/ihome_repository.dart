import 'package:dartz/dartz.dart';
import 'package:unamaps/app/common/error/failure.dart';
import 'package:unamaps/app/features/home/domain/entity/home_entity.dart';

abstract class HomeRepositoryImpl {
  Future<Either<Failure, List<HomeEntity>>> getAndares();
}

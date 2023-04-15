import 'package:unamaps/app/features/home/domain/datasource/ihome_datasource.dart';
import 'package:unamaps/app/features/home/domain/entity/home_entity.dart';
import 'package:unamaps/app/common/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:unamaps/app/features/home/domain/repository/ihome_repository.dart';

class HomeRepository implements HomeRepositoryImpl {
  final HomeDataSourceImpl dataSource;

  HomeRepository({required this.dataSource});

  @override
  Future<Either<Failure, List<HomeEntity>>> getAndares() async {
    try {
      final result = await dataSource.getAndares();

      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}

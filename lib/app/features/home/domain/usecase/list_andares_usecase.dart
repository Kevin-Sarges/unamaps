import 'package:dartz/dartz.dart';
import 'package:unamaps/app/common/error/failure.dart';
import 'package:unamaps/app/features/home/domain/entity/home_entity.dart';
import 'package:unamaps/app/features/home/domain/repository/ihome_repository.dart';

class ListaAndaresUseCase {
  final HomeRepositoryImpl repository;

  ListaAndaresUseCase({required this.repository});

  Future<Either<Failure, List<HomeEntity>>> call() async {
    return await repository.getAndares();
  }
}

import 'package:dartz/dartz.dart';
import 'package:unamaps/app/common/entity/local_entity.dart';
import 'package:unamaps/app/common/error/failure.dart';
import 'package:unamaps/app/features/map/domain/repository/imap_repository.dart';

class FilterLocalUseCase {
  final MapRepositoryImpl repository;

  FilterLocalUseCase({required this.repository});

  Future<Either<Failure, List<LocalEntity>>> call(String tipoLocal) async {
    return await repository.filterLocais(tipoLocal);
  }
}

import 'package:dartz/dartz.dart';
import 'package:unamaps/app/common/entity/local_entity.dart';
import 'package:unamaps/app/common/error/failure.dart';
import 'package:unamaps/app/features/map/domain/repository/imap_repository.dart';

class GetLocalPositionUseCase {
  final MapRepositoryImpl repository;

  GetLocalPositionUseCase({required this.repository});

  Future<Either<Failure, List<LocalEntity>>> call() async {
    return await repository.getLatLonLocal();
  }
}

import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:unamaps/app/common/error/failure.dart';
import 'package:unamaps/app/features/map/domain/repository/imap_repository.dart';

class GetUserPositionUseCase {
  final MapRepositoryImpl repository;

  GetUserPositionUseCase({required this.repository});

  Future<Either<Failure, Position>> call() async {
    return await repository.getLatLonUser();
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unamaps/app/features/map/domain/usecase/get_local_position_usecase.dart';
import 'package:unamaps/app/features/map/domain/usecase/get_user_postion_usecase.dart';
import 'package:unamaps/app/features/map/presenter/controller/map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit({
    required this.getLocalPositionUseCase,
    required this.getUserPositionUseCase,
  }) : super(MapInitial());

  final GetLocalPositionUseCase getLocalPositionUseCase;
  final GetUserPositionUseCase getUserPositionUseCase;

  Future<void> getLocalPosition() async {
    emit(MapLoadgin());

    final result = await getLocalPositionUseCase();

    emit(result.fold(
      (erro) => MapError(erro),
      (sucess) => MapLocalLatLon(sucess),
    ));
  }

  Future<void> getUserPosition() async {
    emit(MapLoadgin());

    final result = await getUserPositionUseCase();

    emit(result.fold(
      (erro) => MapError(erro),
      (sucess) => MapSucess(sucess.latitude, sucess.longitude),
    ));
  }
}

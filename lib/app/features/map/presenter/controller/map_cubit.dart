import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unamaps/app/features/map/domain/usecase/filter_local_usecase.dart';
import 'package:unamaps/app/features/map/domain/usecase/get_local_position_usecase.dart';
import 'package:unamaps/app/features/map/domain/usecase/get_user_postion_usecase.dart';
import 'package:unamaps/app/features/map/presenter/controller/map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit({
    required this.getLocalPositionUseCase,
    required this.getUserPositionUseCase,
    required this.filterLocalUseCase,
  }) : super(MapInitial());

  final GetLocalPositionUseCase getLocalPositionUseCase;
  final GetUserPositionUseCase getUserPositionUseCase;
  final FilterLocalUseCase filterLocalUseCase;

  Future<void> getUserPosition() async {
    emit(MapLoading());

    final result1 = await getUserPositionUseCase();
    final result2 = await getLocalPositionUseCase();

    result1.fold(
      (erro) => emit(MapError(erro)),
      (sucess) => result2.fold(
        (l) => emit(MapError(l)),
        (locais) => emit(
          MapSuccess(
            sucess.latitude,
            sucess.longitude,
            locais,
          ),
        ),
      ),
    );
  }

  Future<void> filter(String tipoLocal) async {
    emit(MapLoading());

    final result1 = await getUserPositionUseCase();
    final result2 = await filterLocalUseCase(tipoLocal);

    result1.fold(
      (erro) => emit(MapError(erro)),
      (success) => result2.fold(
        (l) => emit(MapError(l)),
        (locais) => emit(
          MapSuccess(
            success.latitude,
            success.longitude,
            locais,
          ),
        ),
      ),
    );
  }
}

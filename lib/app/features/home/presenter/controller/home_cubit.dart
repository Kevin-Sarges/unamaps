import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unamaps/app/features/home/domain/usecase/get_local_position_usecase.dart';
import 'package:unamaps/app/features/home/domain/usecase/get_user_postion_usecase.dart';
import 'package:unamaps/app/features/home/presenter/controller/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required this.getLocalPositionUseCase,
    required this.getUserPositionUseCase,
  }) : super(HomeInitial());

  final GetLocalPositionUseCase getLocalPositionUseCase;
  final GetUserPositionUseCase getUserPositionUseCase;

  Future<void> getLocalPosition() async {
    emit(HomeLoadgin());

    final result = await getLocalPositionUseCase();

    emit(result.fold(
      (erro) => HomeError(erro),
      (sucess) => HomeLocalLatLon(sucess),
    ));
  }

  Future<void> getUserPosition() async {
    emit(HomeLoadgin());

    final result = await getUserPositionUseCase();

    emit(result.fold(
      (erro) => HomeError(erro),
      (sucess) => HomeSucess(sucess.latitude, sucess.longitude),
    ));
  }
}

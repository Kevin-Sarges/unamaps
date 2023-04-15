import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unamaps/app/features/home/domain/usecase/list_andares_usecase.dart';
import 'package:unamaps/app/features/home/presenter/controller/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.listaAndaresUseCase}) : super(HomeInitial());

  final ListaAndaresUseCase listaAndaresUseCase;

  Future<void> listAndares() async {
    emit(HomeLoading());

    final result = await listaAndaresUseCase();

    result.fold(
      (error) => emit(HomeError(error)),
      (andares) => emit(HomeSuccess(andares)),
    );
  }
}

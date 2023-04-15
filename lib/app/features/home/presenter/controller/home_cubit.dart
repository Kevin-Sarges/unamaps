import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unamaps/app/features/home/presenter/controller/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
}

import 'package:get_it/get_it.dart';
import 'package:unamaps/app/features/home/domain/datasource/ihome_datasource.dart';
import 'package:unamaps/app/features/home/domain/repository/ihome_repository.dart';
import 'package:unamaps/app/features/home/domain/usecase/list_andares_usecase.dart';
import 'package:unamaps/app/features/home/infra/datasource/home_datasource.dart';
import 'package:unamaps/app/features/home/infra/repository/home_repository.dart';
import 'package:unamaps/app/features/home/presenter/controller/home_cubit.dart';

class HomeInjectDependecy {
  static void init(GetIt getIt) {
    getIt.registerFactory<HomeDataSourceImpl>(() => HomeDataSource());

    getIt.registerFactory<HomeRepositoryImpl>(
      () => HomeRepository(dataSource: getIt()),
    );

    getIt.registerFactory<ListaAndaresUseCase>(
      () => ListaAndaresUseCase(repository: getIt()),
    );

    getIt.registerFactory<HomeCubit>(
      () => HomeCubit(listaAndaresUseCase: getIt()),
    );
  }
}

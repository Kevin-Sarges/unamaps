import 'package:get_it/get_it.dart';
import 'package:unamaps/app/features/map/domain/datasource/imap_datasource.dart';
import 'package:unamaps/app/features/map/domain/repository/imap_repository.dart';
import 'package:unamaps/app/features/map/domain/usecase/filter_local_usecase.dart';
import 'package:unamaps/app/features/map/domain/usecase/get_local_position_usecase.dart';
import 'package:unamaps/app/features/map/domain/usecase/get_user_postion_usecase.dart';
import 'package:unamaps/app/features/map/infra/datasource/map_datasource.dart';
import 'package:unamaps/app/features/map/infra/repository/map_repository.dart';
import 'package:unamaps/app/features/map/presenter/controller/map_cubit.dart';

class MapInjectDependecy {
  static void init(GetIt getIt) {
    getIt.registerFactory<MapDataSourceImpl>(() => MapDataSource());

    getIt.registerFactory<MapRepositoryImpl>(
        () => MapRepository(dataSource: getIt()));

    getIt.registerFactory(
      () => GetLocalPositionUseCase(repository: getIt()),
    );

    getIt.registerFactory(
      () => GetUserPositionUseCase(repository: getIt()),
    );

    getIt.registerFactory(
      () => FilterLocalUseCase(repository: getIt()),
    );

    getIt.registerFactory(
      () => MapCubit(
        getLocalPositionUseCase: getIt(),
        getUserPositionUseCase: getIt(),
        filterLocalUseCase: getIt(),
      ),
    );
  }
}

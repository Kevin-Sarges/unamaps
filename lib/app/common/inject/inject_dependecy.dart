import 'package:get_it/get_it.dart';
import 'package:unamaps/app/features/map/domain/inject/map_inject.dart';

class InjectDependecy {
  static void init() {
    final getIt = GetIt.instance;

    MapInjectDependecy.init(getIt);
  }
}

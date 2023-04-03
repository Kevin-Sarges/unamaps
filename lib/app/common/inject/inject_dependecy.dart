import 'package:get_it/get_it.dart';
import 'package:unamaps/app/features/home/domain/inject/home_inject.dart';

class InjectDependecy {
  static void init() {
    final getIt = GetIt.instance;

    HomeInjectDependecy.init(getIt);
  }
}

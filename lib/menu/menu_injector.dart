import 'package:snake/injecton_container.dart';
import 'package:snake/menu/bloc/menu_bloc.dart';

mixin MenuInjector on Injector {
  @override
  Future<void> init() async {
    await super.init();
    getIt.registerLazySingleton(() => MenuBloc());
  }
}

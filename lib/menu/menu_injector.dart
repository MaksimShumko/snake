import 'package:snake/database/drift/drift_database.dart';
import 'package:snake/injecton_container.dart';
import 'package:snake/menu/bloc/menu_bloc.dart';

mixin MenuInjector on Injector {
  @override
  Future<void> init() async {
    await super.init();

    // repositories
    final MyDriftDatabase db = getIt();
    final scoreDao = db;

    // blocs
    getIt.registerLazySingleton(() => MenuBloc());
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:snake/database/drift/drift_database.dart';
import 'package:snake/database/drift/score_dao.dart';
import 'package:snake/database/retrofit/rest_client.dart';
import 'package:snake/database/score/score_local.dart';
import 'package:snake/database/score/score_repository.dart';
import 'package:snake/menu/menu_injector.dart';

final getIt = GetIt.instance;

class InjectionContainer extends Injector with MenuInjector {}

abstract class Injector {
  @mustCallSuper
  Future<void> init() async {
    getIt.registerLazySingleton(() => MyDriftDatabase());
    getIt.registerLazySingleton(() => RestClient(Dio()));
    getIt.registerLazySingleton(() {
      final dao = ScoreDao(getIt());
      final local = ScoreLocal(dao);
      final remote = ScoreLocal(dao);
      return ScoreRepository(local, remote);
    });
  }
}

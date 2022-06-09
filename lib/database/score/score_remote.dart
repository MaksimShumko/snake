import 'dart:async';

import 'package:dio/dio.dart';
import 'package:snake/database/drift/drift_score.dart';
import 'package:snake/database/result.dart';
import 'package:snake/database/retrofit/rest_client.dart';
import 'package:snake/database/score/score_data_source.dart';

class ScoreRemote extends ScoreDataSource {
  final RestClient _restClient;

  ScoreRemote(this._restClient);

  @override
  Future<Result<List<Score>>> getScores() => _restClient
      .getScores()
      .then((value) => Result.success(value))
      .catchError(_catchError<List<Score>>);

  @override
  Future<Result<Score>> getScore(String id) => _restClient
      .getScore(id)
      .then((value) => Result.success(value))
      .catchError(_catchError<Score>);

  @override
  Future<Result> postScore(Score score) => _restClient
      .postScore(score)
      .then((value) => Result.success(value))
      .catchError(_catchError);

  @override
  Future<Result> putScore(String id, Score score) => _restClient
      .putScore(id, score)
      .then((value) => Result.success(value))
      .catchError(_catchError);

  @override
  Future<Result> deleteScore(String id) => _restClient
      .deleteScore(id)
      .then((value) => Result.success(value))
      .catchError(_catchError);

  FutureOr<Result<T>> _catchError<T>(Object obj) {
    switch (obj.runtimeType) {
      case DioError:
        final response = (obj as DioError).response;
        return Result<T>.failure(response?.statusMessage, response?.statusCode);
      default:
        return Result<T>.remoteUnknownFailure();
    }
  }
}

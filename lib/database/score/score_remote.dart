import 'package:dio/dio.dart';
import 'package:snake/database/drift/drift_score.dart';
import 'package:snake/database/result.dart';
import 'package:snake/database/retrofit/rest_client.dart';
import 'package:snake/database/score/score_data_source.dart';

class ScoreRemote extends ScoreDataSource {
  final RestClient _restClient;

  ScoreRemote(this._restClient);

  Future<Result<List<Score>>> getScores() async {
    await _restClient.getScores();

    return await _restClient
        .getScores()
        .then((value) => Result.success(value))
        .catchError((Object obj) {
      switch (obj.runtimeType) {
        case DioError:
          final response = (obj as DioError).response;
          return Result.failure(response?.statusMessage, response?.statusCode);
        default:
          break;
      }
    });
  }

  Future<Result<Score>> getScore(String id) {
    throw NotImplementedError();
  }

  Future<Result> postScore(Score score) {
    throw NotImplementedError();
  }

  Future<Result> putScore(String id, Score score) {
    throw NotImplementedError();
  }

  Future<Result> deleteScore(String id) {
    throw NotImplementedError();
  }
}

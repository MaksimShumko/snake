import 'package:snake/database/drift/drift_score.dart';
import 'package:snake/database/result.dart';
import 'package:snake/database/score/score_data_source.dart';

class ScoreRepository implements ScoreDataSource {
  final ScoreDataSource _local;
  final ScoreDataSource _remote;

  ScoreRepository(this._local, this._remote);

  @override
  Future<Result<List<Score>>> getScores() async {
    final result = await _remote.getScores();
    if (result is Success) {
      return await _local.getScores();
    } else {
      return result;
    }
  }

  @override
  Stream<Score> observeScore(String id) => _local.observeScore(id);

  @override
  Future<Result<Score>> getScore(String id) async {
    final result = await _remote.getScore(id);
    if (result is Success) {
      return await _local.getScore(id);
    } else {
      return result;
    }
  }

  @override
  Future<Result> postScore(Score score) async {
    final result = await _remote.postScore(score);
    if (result is Success) {
      return await _local.postScore(score);
    } else {
      return result;
    }
  }

  @override
  Future<Result> putScore(String id, Score score) async {
    final result = await _remote.putScore(id, score);
    if (result is Success) {
      return await _local.putScore(id, score);
    } else {
      return result;
    }
  }

  @override
  Future<Result> deleteScore(String id) async {
    final result = await _remote.deleteScore(id);
    if (result is Success) {
      return await _local.deleteScore(id);
    } else {
      return result;
    }
  }
}

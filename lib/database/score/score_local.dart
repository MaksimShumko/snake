import 'dart:async';

import 'package:snake/database/drift/drift_score.dart';
import 'package:snake/database/drift/score_dao.dart';
import 'package:snake/database/result.dart';
import 'package:snake/database/score/score_data_source.dart';

class ScoreLocal extends ScoreDataSource {
  final ScoreDao _dao;

  ScoreLocal(this._dao);

  @override
  Future<Result<List<Score>>> getScores() async {
    final result = await _dao.allScores;
    return Result.success(result);
  }

  @override
  Future<Result<Score>> getScore(String id) async {
    final result = await _dao.getScore(id);
    if (result == null) {
      return Result.localEmptyObjectFailure();
    } else {
      return Result.success(result);
    }
  }

  @override
  Stream<Result<Score>> observeScore(String id) =>
      _dao.watchScore(id).map((event) {
        if (event == null) {
          return Result.localEmptyObjectFailure();
        } else {
          return Result.success(event);
        }
      });

  @override
  Future<Result> postScore(Score score) async {
    final result = await _dao.createOrUpdateScore(score);
    return Result.success(result);
  }

  @override
  Future<Result> deleteScore(String id) async {
    final result = await _dao.deleteScore(id);
    return Result.success(result);
  }
}

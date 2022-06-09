import 'package:snake/database/drift/drift_score.dart';
import 'package:snake/database/not_implemented_error.dart';
import 'package:snake/database/result.dart';

abstract class ScoreDataSource {
  Future<Result<List<Score>>> getScores() {
    throw NotImplementedError();
  }

  Stream<Score> observeScore(String id) {
    throw NotImplementedError();
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

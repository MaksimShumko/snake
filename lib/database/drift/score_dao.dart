import 'package:drift/drift.dart';
import 'package:snake/database/drift/drift_database.dart';
import 'package:snake/database/drift/drift_score.dart';

part 'score_dao.g.dart';

@DriftAccessor(tables: [DriftScore])
class ScoreDao extends DatabaseAccessor<MyDriftDatabase> with _$ScoreDaoMixin {
  ScoreDao(MyDriftDatabase db) : super(db);

  Future<List<Score>> get allScores => select(driftScore).get();

  Stream<Score> watchScore(String id) =>
      (select(driftScore)..where((t) => t.id.equals(id))).watchSingle();

  Future<int> createOrUpdateScore(Score entry) =>
      into(driftScore).insertOnConflictUpdate(entry);
}

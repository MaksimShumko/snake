import 'package:drift/drift.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:snake/database/drift/drift_database.dart';

part 'drift_score.g.dart';

@UseRowClass(Score)
class DriftScore extends Table {
  TextColumn get id => text()();

  IntColumn get score => integer()();

  @override
  Set<Column>? get primaryKey => {id};
}

@JsonSerializable()
class Score implements Insertable<Score> {
  final String id;
  final int score;

  Score({required this.id, required this.score});

  factory Score.fromJson(Map<String, dynamic> json) => _$ScoreFromJson(json);

  Map<String, dynamic> toJson() => _$ScoreToJson(this);

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return DriftScoreCompanion(
      id: Value(id),
      score: Value(score),
    ).toColumns(nullToAbsent);
  }
}

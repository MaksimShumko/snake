// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class DriftScoreCompanion extends UpdateCompanion<Score> {
  final Value<String> id;
  final Value<int> score;
  const DriftScoreCompanion({
    this.id = const Value.absent(),
    this.score = const Value.absent(),
  });
  DriftScoreCompanion.insert({
    required String id,
    required int score,
  })  : id = Value(id),
        score = Value(score);
  static Insertable<Score> custom({
    Expression<String>? id,
    Expression<int>? score,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (score != null) 'score': score,
    });
  }

  DriftScoreCompanion copyWith({Value<String>? id, Value<int>? score}) {
    return DriftScoreCompanion(
      id: id ?? this.id,
      score: score ?? this.score,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (score.present) {
      map['score'] = Variable<int>(score.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DriftScoreCompanion(')
          ..write('id: $id, ')
          ..write('score: $score')
          ..write(')'))
        .toString();
  }
}

class $DriftScoreTable extends DriftScore
    with TableInfo<$DriftScoreTable, Score> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DriftScoreTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _scoreMeta = const VerificationMeta('score');
  @override
  late final GeneratedColumn<int?> score = GeneratedColumn<int?>(
      'score', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, score];
  @override
  String get aliasedName => _alias ?? 'drift_score';
  @override
  String get actualTableName => 'drift_score';
  @override
  VerificationContext validateIntegrity(Insertable<Score> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('score')) {
      context.handle(
          _scoreMeta, score.isAcceptableOrUnknown(data['score']!, _scoreMeta));
    } else if (isInserting) {
      context.missing(_scoreMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Score map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Score(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      score: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}score'])!,
    );
  }

  @override
  $DriftScoreTable createAlias(String alias) {
    return $DriftScoreTable(attachedDatabase, alias);
  }
}

abstract class _$MyDriftDatabase extends GeneratedDatabase {
  _$MyDriftDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $DriftScoreTable driftScore = $DriftScoreTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [driftScore];
}

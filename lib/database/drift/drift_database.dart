import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:snake/database/drift/drift_score.dart';

part 'drift_database.g.dart';

@DriftDatabase(tables: [DriftScore])
class MyDriftDatabase extends _$MyDriftDatabase {
  static const _dbName = 'db.sqlite';

  MyDriftDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() => LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, MyDriftDatabase._dbName));
      return NativeDatabase(file);
    });

import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:sqflite/sqflite.dart';

import '../../../core/database/database_service.dart';
import '../../../domain/models/app_user.dart';

class UserRepository {
  UserRepository({DatabaseService? databaseService})
      : _databaseService = databaseService ?? DatabaseService.instance;

  final DatabaseService _databaseService;

  String _hash(String password) =>
      sha256.convert(utf8.encode(password)).toString();

  Future<List<AppUser>> getUsers() async {
    final db = await _databaseService.database;
    final rows = await db.query(
      'app_users',
      orderBy: 'display_name COLLATE NOCASE',
    );
    return rows.map(AppUser.fromMap).toList();
  }

  Future<int> createUser({
    required String email,
    required String displayName,
    required String password,
    required UserRole role,
  }) async {
    final db = await _databaseService.database;
    final now = DateTime.now().toUtc().toIso8601String();
    return db.insert(
      'app_users',
      {
        'email': email.trim().toLowerCase(),
        'display_name': displayName.trim(),
        'password_hash': _hash(password),
        'role': role.name,
        'is_active': 1,
        'created_at': now,
        'updated_at': now,
      },
      conflictAlgorithm: ConflictAlgorithm.abort,
    );
  }

  Future<void> setActive(int userId, bool active) async {
    final db = await _databaseService.database;
    await db.update(
      'app_users',
      {
        'is_active': active ? 1 : 0,
        'updated_at': DateTime.now().toUtc().toIso8601String(),
      },
      where: 'id = ?',
      whereArgs: [userId],
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';
import '../models/phone_masked_formatter.dart'; 


class DatabaseGen {
  static final DatabaseGen instance = DatabaseGen._init();
  static Database? _database;

  DatabaseGen._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('user_profile.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        email TEXT NOT NULL,
        name TEXT NOT NULL,
        surname TEXT NOT NULL,
        phone NUMBERS NOT NULL,
        employee TEXT NOT NULL,
        birthDate DATE NOT NULL,
        imagePath TEXT
      )
    ''');
  }

 Future<void> saveUser(User user) async {
    final db = await database;
    final userToSave = user.copyWith(
      phone: PhoneMaskedFormatter.unmask(user.phone),
    );
    await db.insert(
      'users',
      userToSave.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

 Future<User?> getUser() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('users');

    if (maps.isNotEmpty) {
      return User.fromMap(maps[0]);
    }
    return null;
  }
}

abstract class DatabaseService {
  Future<void> saveUser(User user);
  Future<User?> getUser();
}

class MobileDatabaseService implements DatabaseService {
  @override
  Future<void> saveUser(User user) => DatabaseGen.instance.saveUser(user);

  @override
  Future<User?> getUser() => DatabaseGen.instance.getUser();
}

class WebDatabaseService implements DatabaseService {
  static const String _userKey = 'user_data';

  @override
  Future<void> saveUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    final userToSave = user.copyWith(
      phone: PhoneMaskedFormatter.unmask(user.phone),
    );
    await prefs.setString(_userKey, jsonEncode(userToSave.toMap()));
  }

  @override
  Future<User?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_userKey);
    if (jsonString != null) {
      final map = jsonDecode(jsonString) as Map<String, dynamic>;
      return User.fromMap(map);
    }
    return null;
  }
}

DatabaseService getDatabaseService() {
  if (kIsWeb) {
    return WebDatabaseService();
  } else {
    return MobileDatabaseService();
  }
}

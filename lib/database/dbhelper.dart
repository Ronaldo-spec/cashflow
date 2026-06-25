// ignore_for_file: avoid_print
import 'dart:async';
import 'dart:io' as io;

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../model/cashflow.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper.internal();
  DBHelper.internal();

  factory DBHelper() => _instance;

  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await setDB();
    return _db;
  }

  Future<Database> setDB() async {
    final io.Directory directory = await getApplicationDocumentsDirectory();
    final String path = join(directory.path, 'myCashbook.db');
    final database = await openDatabase(path, version: 1, onCreate: _onCreate);
    return database;
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE cashflow(id INTEGER PRIMARY KEY, tanggal STRING, nominal INTEGER, deskripsi TEXT, tipe STRING)',
    );

    await db.execute(
      'CREATE TABLE user(id INTEGER PRIMARY KEY AUTOINCREMENT, name STRING, username STRING, password STRING)',
    );

    await db.insert('user', {
      'username': 'user',
      'password': 'user',
    });

    print('Database Created');
  }

  Future<Map<String, dynamic>> getLogin(String username, String password) async {
    final dbClient = await db;
    final List<Map<String, dynamic>> result = await dbClient!.query(
      'user',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );

    if (result.isNotEmpty) {
      return result[0];
    }

    return {};
  }

  Future<String> getPassword() async {
    final dbClient = await db;
    final List<Map<String, dynamic>> list = await dbClient!.query(
      'user',
      columns: ['password'],
      where: 'username = ?',
      whereArgs: ['user'],
      limit: 1,
    );

    if (list.isEmpty) {
      return '';
    }

    return list[0]['password'].toString();
  }

  Future<bool> updatePassword(String password) async {
    final dbClient = await db;
    final int affectedRows = await dbClient!.update(
      'user',
      {'password': password},
      where: 'username = ?',
      whereArgs: ['user'],
    );

    return affectedRows > 0;
  }

  Future<int> saveCashflow(Cashflow cashflow) async {
    final dbClient = await db;
    final int insertedId = await dbClient!.insert('cashflow', cashflow.toMap());
    print('Cashflow saved');
    return insertedId;
  }

  Future<List<Cashflow>> getCashflow() async {
    final dbClient = await db;
    final List<Map<String, dynamic>> list = await dbClient!.query('cashflow');
    final List<Cashflow> cashflowList = [];

    for (int i = 0; i < list.length; i++) {
      final cashflow = Cashflow(
        list[i]['tanggal'],
        list[i]['nominal'],
        list[i]['deskripsi'],
        list[i]['tipe'],
      );
      cashflow.setCashflowId(list[i]['id']);
      cashflowList.add(cashflow);
    }

    print(cashflowList);
    return cashflowList;
  }

  Future<int> getTotalNominalByType(String type) async {
    final dbClient = await db;
    final List<Map<String, dynamic>> list = await dbClient!.rawQuery(
      'SELECT SUM(nominal) as total_nominal FROM cashflow WHERE tipe = ?',
      [type],
    );

    if (list.isNotEmpty && list[0]['total_nominal'] != null) {
      return int.parse(list[0]['total_nominal'].toString());
    }

    return 0;
  }

  Future<bool> updateCashflow(Cashflow cashflow) async {
    final dbClient = await db;
    final int affectedRows = await dbClient!.update(
      'cashflow',
      cashflow.toMap(),
      where: 'id = ?',
      whereArgs: [cashflow.id],
    );

    return affectedRows > 0;
  }

  Future<int> deleteCashflow(Cashflow cashflow) async {
    final dbClient = await db;
    final int deletedRows = await dbClient!.delete(
      'cashflow',
      where: 'id = ?',
      whereArgs: [cashflow.id],
    );

    return deletedRows;
  }
}

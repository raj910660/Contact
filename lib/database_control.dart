import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseController extends GetxController {
  // final DatabaseController _databaseController = DatabaseController.getInstance();
  DatabaseController._();

  static Future<DatabaseController> getInstance() async {
    DatabaseController instance = DatabaseController._();
    await instance._createDatabase();
    return instance;
  }

  Database? database;

  Future<void> _createDatabase() async {
    print('Database creating...');
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'My_database.db');

// open the database
    database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE tab_data (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, email TEXT, password TEXT, conform_password TEXT)');
      print('table tab_data Created!');
      await db.execute(
          'CREATE TABLE contacts (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, phone TEXT, email TEXT, nick TEXT, userid INTEGER)');
      print('TABLE contacts Created!');
    });
  }

  void registerUser(
      {required String name,
      required String email,
      required String password,
      required String Conformpassword}) async {
    print("data insert...");
    String sql =
        "INSERT INTO tab_data (name, email, password, conform_password) VALUES('$name', '$email', '$password', '$Conformpassword')";
    print("Sucess insert data");

    await database?.rawInsert(sql);
  }

  Future<void> contacts({
    required String name,
    required String phone,
    required String email,
    required String nick,
    required int UserId,
  }) async {
    {
      print("data insert...");
      String sql =
          "INSERT INTO contacts (name, phone, email, nick,userid) VALUES('$name', '$phone', '$email', '$nick',$UserId)";
      print("Sucess insert data");

      await database?.rawInsert(sql);
    }
  }

  Future<Map> login({
    required String name,
    required String password,
  }) async {
    String sql =
        "SELECT * FROM tab_data WHERE name = '$name' AND password = '$password'";
    List<Map> users = await (database?.rawQuery(sql)) ?? [];
    return users.isNotEmpty ? users[0] : {};
  }

  Future<List<Map<String, Object?>>?> fetchContact(int useId) async {
    String sql = "SELECT * FROM contacts WHERE userid = '$useId'";
    var data = await database!.rawQuery(sql);
    return data;
  }

  Future<void> updateContact(
      {required String name,
      required String phone,
      required String email,
      required String nick,
      required int id}) async {
    String sql =
        "UPDATE contacts SET name = '$name', phone = '$phone', email = '$email', nick = '$nick' WHERE id = $id";
    await database?.rawUpdate(sql);
  }

  Future<void> deleteContact({required int id}) async {
    String sql = "DELETE FROM contacts WHERE id = $id";
    await database?.execute(sql);
  }
}

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageController {
  LocalStorageController._();

  static SharedPreferences? preferences;

  static Future<LocalStorageController> getInstance() async {
    LocalStorageController instance = LocalStorageController._();
    preferences = await SharedPreferences.getInstance();
    return instance;
  }

  void saveUser({required int id, required String name, required email}) {
    preferences?.setInt('id', id);
    preferences?.setString('name', name);
    preferences?.setString('email', email);
  }

  Map<String, Object?> getUser() {
    print('preferences: ${preferences?.getKeys()}');
    if (preferences!.containsKey('id')) {
      return {
        'id': preferences?.getInt('id'),
        'name': preferences?.getString('name'),
        'email': preferences?.getString('email')
      };
    }
    return {};
  }
}

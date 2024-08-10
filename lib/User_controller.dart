import 'package:contacts_book/database_control.dart';
import 'package:contacts_book/local_strorage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  DatabaseController? databaseController;

  @override
  void onInit() {
    DatabaseController.getInstance()
        .then((instance) => databaseController = instance);
    super.onInit();
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConformController = TextEditingController();

  TextEditingController get nameController => _nameController;

  TextEditingController get emailController => _emailController;

  TextEditingController get passwordController => _passwordController;

  TextEditingController get passwordConformController => _passwordConformController;

  void registerUser() {
    print("Register....");
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String Conformpassword = passwordConformController.text.trim();

    print('name: $name');
    print('email: $email');
    print('password: $password');
    print('Conformpassword: $Conformpassword');

    if (databaseController != null) {
      databaseController!.registerUser(
        name: name,
        email: email,
        password: password,
        Conformpassword: Conformpassword,
      );
      Get.back();
    } else {
      print('Database not created!');
    }
  }

  Future<Map> login() async {
    String name = nameController.text.trim();
    String password = passwordController.text.trim();
    if (databaseController != null) {
      Map user = await databaseController!.login(name:name,password:password);
      return user;
    } else {
      print('Database not created! please try after sometime');
      return {};
    }
  }
  Future<void> saveUser({required int id, required String name, required email}) async {
    LocalStorageController controller = await LocalStorageController.getInstance();
    controller.saveUser(id: id, name: name, email: email);

  }

  Future<Map<String, Object?>> getUser() async {
    LocalStorageController controller = await LocalStorageController.getInstance();
    return controller.getUser();
  }
  void logOut() {
    LocalStorageController.preferences?.clear();
  }

}


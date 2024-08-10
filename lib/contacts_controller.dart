import 'package:contacts_book/database_control.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactsController extends GetxController {
  DatabaseController? databaseController;
  DatabaseController? controller;

  @override
  Future<void> onInit() async {
    DatabaseController.getInstance().then((instance) => databaseController = instance);
    DatabaseController.getInstance().then((value) => controller = value);
    super.onInit();
  }

  final TextEditingController _NameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _EmailController = TextEditingController();
  final TextEditingController _NicknameController = TextEditingController();

  TextEditingController get NameController => _NameController;
  TextEditingController get phoneController => _phoneController;
  TextEditingController get EmailController => _EmailController;
  TextEditingController get NicknameController => _NicknameController;
  var contact = <Map<String, Object?>>[].obs;

  Future<void> contacts(int userid) async {

    String name = NameController.text.trim();
    String phone = phoneController.text.trim();
    String email = EmailController.text.trim();
    String nick = NicknameController.text.trim();

    print('name: $name');
    print('phone: $phone');
    print('email: $email');
    print('nick: $nick');

    if (databaseController != null) {
      databaseController!.contacts(
        name: name,
        phone: phone,
        email: email,
        nick: nick,
        UserId: userid,
      );
    }
    contact.value = await fetchContacts(userid) ?? [];
  }

  Future<void> updateContact(int id) async {
    await controller!.updateContact(
        name: NameController.text,
        phone: phoneController.text,
        email: EmailController.text,
        nick: NicknameController.text,
        id: id);
  }

  Future<List<Map<String, Object?>>?> fetchContacts(int userId) async {
    await Future.delayed(Duration(seconds: 3));
    var data =  await controller!.fetchContact(userId);
    return data;
  }

  Future<void> deleteContact(int id) async {
    await controller!.deleteContact(
        id: id);
  }
}

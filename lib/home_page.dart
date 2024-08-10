import 'package:contacts_book/User_controller.dart';
import 'package:contacts_book/contacts_controller.dart';
import 'package:contacts_book/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key, required this.user});

  final Map user;

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    UserController controller = Get.find<UserController>();
    ContactsController contactController = Get.put(ContactsController());

    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Center(
                  child: Text(widget.user['name'],
                      style: const TextStyle(fontSize: 30))),
              accountEmail: Center(
                  child: Text(
                    widget.user['email'],
                    style: const TextStyle(fontSize: 20),
                  )),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.home, size: 30),
              title: const Text(
                'Home',
                style: TextStyle(fontSize: 25),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.settings, size: 30),
              title: const Text('Settings', style: TextStyle(fontSize: 25)),
              onTap: () {},
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.help, size: 30),
              title: const Text('Help', style: TextStyle(fontSize: 25)),
              onTap: () {},
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.logout, size: 30),
              title: const Text('Logout', style: TextStyle(fontSize: 25)),
              onTap: () {
                controller.logOut();
                Get.offAll(Login_Page());
              },
            ),
          ],
        ),
      ),
      floatingActionButton: CircleAvatar(
        radius: 32,
        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          elevation: 0,
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return SimpleDialog(
                  backgroundColor: Colors.white,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        'Save Contact', // added text
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextField(
                        controller: contactController.NameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          labelText: 'Name',
                          labelStyle: TextStyle(color: Colors.black),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextField(
                        controller: contactController.phoneController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          labelText: 'Phone',
                          labelStyle: TextStyle(color: Colors.black),
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Colors.black,
                          ),
                          prefixText: '+91 ',
                          prefixStyle: TextStyle(color: Colors.black),
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextField(
                        controller: contactController.EmailController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.black),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.black,
                          ),
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextField(
                        controller: contactController.NicknameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          labelText: 'Nick Name',
                          labelStyle: TextStyle(color: Colors.black),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white, backgroundColor: Colors
                            .blue,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {
                          contactController.contacts(widget.user['id']);
                          contactController.NameController.clear();
                          contactController.EmailController.clear();
                          contactController.phoneController.clear();
                          contactController.NicknameController.clear();
                          Get.back();
                          Get.snackbar('Save', 'Successful Add Contact',
                              snackStyle: SnackStyle.FLOATING,
                              backgroundColor: Colors.white
                          );
                        },
                        child: const Text('Save'),
                      ),
                    )
                  ],
                );
              },
            );
          },
          child: const Icon(
            Icons.add,
            color: Colors.black,
            size: 30,
          ),
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            'assest/img/home.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 40,
              left: 20,
              right: 20,
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    _scaffoldKey.currentState?.openDrawer();
                  },
                  icon: const Icon(Icons.list, color: Colors.white, size: 30),
                ),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      filled: true,
                      fillColor: Colors.white24,
                      hintText: 'Search',
                      hintStyle: const TextStyle(color: Colors.white),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsetsDirectional.all(20),
            margin: const EdgeInsetsDirectional.symmetric(vertical: 80),
            child: FutureBuilder(
              future: contactController.fetchContacts(widget.user['id']),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                      child: Text('No Contact',
                          style: TextStyle(color: Colors.white, fontSize: 30))
                  );
                } else if (snapshot.hasData) {
                  contactController.contact.value = snapshot.data ?? [];

                  return Obx(() =>
                      ListView.separated(
                          itemBuilder: (context, index) =>
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.black),
                                  color: Colors.white.withOpacity(0.8),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: ListTile(
                                        title: Text(
                                          '${contactController
                                              .contact[index]['name']} ',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 20),
                                        ),
                                        subtitle: Text(
                                            '+91'
                                                ' '
                                                '${contactController
                                                .contact[index]['phone']}',
                                            style:
                                            const TextStyle(
                                                color: Colors.black45)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: PopupMenuButton(
                                        child: const Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Icon(Icons.more_vert),
                                        ),
                                        itemBuilder: (context) =>
                                        [
                                          const PopupMenuItem(
                                            value: 'edit',
                                            child: Text('Edit Contact'),
                                          ),
                                          const PopupMenuItem(
                                            value: 'delete',
                                            child: Text('Delete Contact'),
                                          ),
                                        ],
                                        onSelected: (value) {
                                          if (value == 'edit') {
                                            showDialog(context: context,
                                              barrierDismissible: true,
                                              builder: (BuildContext context) =>
                                                  WillPopScope(onWillPop: () {
                                                    contactController
                                                        .NameController.clear();
                                                    contactController
                                                        .phoneController
                                                        .clear();
                                                    contactController
                                                        .EmailController
                                                        .clear();
                                                    contactController
                                                        .NicknameController
                                                        .clear();
                                                    return Future.value(true);
                                                  },
                                                      child: SimpleDialog(
                                                        backgroundColor: Colors
                                                            .white,
                                                        children: [
                                                          const Padding(
                                                            padding: EdgeInsets
                                                                .all(20.0),
                                                            child: Text(
                                                              'Edit Contact',
                                                              // added text
                                                              style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight: FontWeight
                                                                    .bold,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                            ),
                                                          ),

                                                          Padding(
                                                            padding: const EdgeInsets
                                                                .all(20.0),
                                                            child: TextField(
                                                              controller: contactController
                                                                  .NameController
                                                                ..text = contactController
                                                                    .contact[index]['name'] as String,
                                                              decoration: const InputDecoration(
                                                                border: OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                      color: Colors
                                                                          .black),
                                                                  borderRadius: BorderRadius
                                                                      .all(
                                                                      Radius
                                                                          .circular(
                                                                          15)),
                                                                ),
                                                                focusedBorder: OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                      color: Colors
                                                                          .black),
                                                                  borderRadius: BorderRadius
                                                                      .all(
                                                                      Radius
                                                                          .circular(
                                                                          15)),
                                                                ),
                                                                labelText: 'Name',
                                                                labelStyle: TextStyle(
                                                                    color: Colors
                                                                        .black),
                                                                prefixIcon: Icon(
                                                                  Icons.person,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets
                                                                .all(20.0),
                                                            child: TextField(
                                                              controller: contactController
                                                                  .phoneController
                                                                ..text = contactController
                                                                    .contact[index]['phone'] as String,
                                                              decoration: const InputDecoration(
                                                                border: OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                      color: Colors
                                                                          .black),
                                                                  borderRadius: BorderRadius
                                                                      .all(
                                                                      Radius
                                                                          .circular(
                                                                          15)),
                                                                ),
                                                                focusedBorder: OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                      color: Colors
                                                                          .black),
                                                                  borderRadius: BorderRadius
                                                                      .all(
                                                                      Radius
                                                                          .circular(
                                                                          15)),
                                                                ),
                                                                labelText: 'Phone',
                                                                labelStyle: TextStyle(
                                                                    color: Colors
                                                                        .black),
                                                                prefixIcon: Icon(
                                                                  Icons.phone,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                                prefixText: '+91 ',
                                                                prefixStyle: TextStyle(
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets
                                                                .all(20.0),
                                                            child: TextField(
                                                              controller: contactController
                                                                  .EmailController
                                                                ..text = contactController
                                                                    .contact[index]['email'] as String,
                                                              decoration: const InputDecoration(
                                                                border: OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                      color: Colors
                                                                          .black),
                                                                  borderRadius: BorderRadius
                                                                      .all(
                                                                      Radius
                                                                          .circular(
                                                                          15)),
                                                                ),
                                                                focusedBorder: OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                      color: Colors
                                                                          .black),
                                                                  borderRadius: BorderRadius
                                                                      .all(
                                                                      Radius
                                                                          .circular(
                                                                          15)),
                                                                ),
                                                                labelText: 'Email',
                                                                labelStyle: TextStyle(
                                                                    color: Colors
                                                                        .black),
                                                                prefixIcon: Icon(
                                                                  Icons.email,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets
                                                                .all(20.0),
                                                            child: TextField(
                                                              controller: contactController
                                                                  .NicknameController
                                                                ..text = contactController
                                                                    .contact[index]['nick'] as String,
                                                              decoration: const InputDecoration(
                                                                border: OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                      color: Colors
                                                                          .black),
                                                                  borderRadius: BorderRadius
                                                                      .all(
                                                                      Radius
                                                                          .circular(
                                                                          15)),
                                                                ),
                                                                focusedBorder: OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                      color: Colors
                                                                          .black),
                                                                  borderRadius: BorderRadius
                                                                      .all(
                                                                      Radius
                                                                          .circular(
                                                                          15)),
                                                                ),
                                                                labelText: 'Nick Name',
                                                                labelStyle: TextStyle(
                                                                    color: Colors
                                                                        .black),
                                                                prefixIcon: Icon(
                                                                  Icons.person,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets
                                                                .all(20.0),
                                                            child: ElevatedButton(
                                                              style: ElevatedButton
                                                                  .styleFrom(
                                                                foregroundColor: Colors
                                                                    .white,
                                                                backgroundColor: Colors
                                                                    .blue,
                                                                elevation: 5,
                                                                shape: RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius
                                                                      .circular(
                                                                      15),
                                                                ),
                                                              ),
                                                              onPressed: () async {
                                                                await contactController
                                                                    .updateContact(
                                                                    contactController
                                                                        .contact[index]['id'] as int);
                                                                setState(() {
                                                                  Get.back();
                                                                  Get.snackbar(
                                                                      'Update',
                                                                      'Successful Update Contact',
                                                                      snackStyle: SnackStyle
                                                                          .FLOATING,
                                                                      backgroundColor: Colors
                                                                          .white);
                                                                },);
                                                              },
                                                              child: const Text(
                                                                  'Update'),
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                  ),);
                                          } else if (value == 'delete') {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  AlertDialog(
                                                    title: const Text(
                                                      'Delete Contact',
                                                      style: TextStyle(
                                                        color: Colors.red,
                                                        fontSize: 25,
                                                        fontWeight: FontWeight
                                                            .bold,),),
                                                    content: const Text(
                                                        'Deleted Contacts Will be Kept in Recently Deleted For 30 Days.'),
                                                    actions: [
                                                      TextButton(
                                                        child: const Text(
                                                            'Cancel'),
                                                        onPressed: () {
                                                          Get.back();
                                                        },
                                                      ),
                                                      TextButton(
                                                        child: const Text(
                                                            'Delete'),
                                                        onPressed: () async {
                                                          await contactController
                                                              .deleteContact(
                                                              contactController
                                                                  .contact[index]['id'] as int);
                                                          setState(() {
                                                            Get.back();
                                                            Get.snackbar(
                                                                'Delete',
                                                                'Successful Delete Contact',
                                                                snackStyle: SnackStyle
                                                                    .GROUNDED,
                                                                backgroundColor: Colors
                                                                    .white);
                                                          },);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          separatorBuilder: (context, index) => const Divider(),
                          itemCount: contactController.contact.length ?? 0));
                }
                return const Center(
                  child: Text('No Contacts'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


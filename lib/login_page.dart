import 'package:contacts_book/User_controller.dart';
import 'package:contacts_book/home_page.dart';
import 'package:contacts_book/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login_Page extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    UserController controller = Get.find<UserController>();
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            Image.asset(
              'assest/img/img.png',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Welcome to",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    const Text(
                      "Login Page",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: controller.nameController,
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              hintText: 'Enter Your Username ',
                              hintStyle: TextStyle(color: Colors.white),
                              labelText: 'USER NAME',
                              labelStyle: TextStyle(color: Colors.white),
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your Username';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            width: 10,
                            height: 20,
                          ),
                          TextFormField(
                            controller: controller.passwordController,
                            obscureText: true,
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.white),
                              labelText: 'PASSWORD',
                              labelStyle: TextStyle(color: Colors.white),
                              prefixIcon: Icon(
                                Icons.visibility_off_outlined,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a password';
                              }
                              if (value.length < 8) {
                                return 'Password must be at least 8 characters long';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: InkWell(
                        onTap: () {
                          controller.login().then((User) {
                            if (User.isNotEmpty) {
                              controller.saveUser(id: User['id'], name: User['name'], email: User['email']);
                              Get.to(Home_page(
                                user: User,
                              ));
                            } else {
                              Get.snackbar('Error', 'Invalid userid or password');
                            }
                          });
                        },
                        child: Container(
                          width: 150,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.red.shade200,
                            border: Border.all(color: Colors.white, width: 3),
                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                          ),
                          child: const Center(
                            child: Text(
                              'Login',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          'New user? ',
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(
                            onPressed: () => Get.to(Register_page()),
                            child: const Text(
                              'Register',
                              style: TextStyle(color: Colors.red),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

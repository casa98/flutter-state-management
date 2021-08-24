import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:states/controllers/user_controller.dart';
import 'package:states/models/user.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get arguments from previous screen
    final _title = Get.arguments['title'];

    final userCtrl = Get.find<UserController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                final user = User(
                  name: 'Andrés',
                  age: 23,
                  professions: ['Mobile Developer'],
                );
                userCtrl.loadUser(user);
              },
              color: Colors.blue,
              child: Text(
                'Set a User',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () => userCtrl.changeAge(32),
              color: Colors.blue,
              child: Text(
                'Edit Age',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () => userCtrl.addProfession(),
              color: Colors.blue,
              child: Text(
                'Add Profession',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

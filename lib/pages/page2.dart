import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:states/models/user.dart';
import 'package:states/services/user_service.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userService = context.read<UserService>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                userService.user = User(
                  name: 'Andrés',
                  age: 23,
                  professions: ['Mobile Developer', 'Designer'],
                );
              },
              color: Colors.blue,
              child: Text(
                'Set a User',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () {
                userService.changeAge(32);
              },
              color: Colors.blue,
              child: Text(
                'Edit Age',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () {
                userService.addProfession();
              },
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

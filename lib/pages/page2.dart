import 'package:flutter/material.dart';
import 'package:states/models/user.dart';
import 'package:states/services/user_service.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder<User>(
          stream: userService.userStrem,
          builder: ( context,  snapshot) {
            if(!snapshot.hasData) return Text('Page 2');
            return Text(snapshot.data!.name!);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                userService.loadUser(
                  User(
                    name: 'Andrés',
                    age: 23,
                    professions: ['Developer'],
                  ),
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
                userService.changeAge(24);
              },
              color: Colors.blue,
              child: Text(
                'Edit Age',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () {},
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

import 'package:flutter/material.dart';
import 'package:states/models/user.dart';
import 'package:states/services/user_service.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
      ),
      body: StreamBuilder<User>(
        stream: userService.userStrem,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? UserInfo(user: snapshot.data)
              : Center(
                  child: Text('No User'),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, 'page2'),
        child: Icon(Icons.add),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  final User? user;

  const UserInfo({required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('General'),
          Divider(),
          ListTile(
            title: Text('Name: ${user!.name}'),
          ),
          ListTile(
            title: Text('Age: ${user!.age}'),
          ),
          Divider(),
          Text('Professions'),
          ListTile(
            title: Text('Profession 1: ${user!.professions!.first}'),
          ),
          ListTile(
            title: Text('Profession 2: '),
          ),
          ListTile(
            title: Text('Profession 3: '),
          ),
        ],
      ),
    );
  }
}

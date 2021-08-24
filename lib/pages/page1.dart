import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:states/models/user.dart';
import 'package:states/services/user_service.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userService = context.watch<UserService>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
        actions: [
          if (userService.userExists)
            IconButton(
              onPressed: () => userService.removeUser(),
              icon: Icon(Icons.delete),
            ),
        ],
      ),
      body: userService.userExists
          ? UserInfo(user: userService.user)
          : Center(
              child: Text('No User'),
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

          /// Elementa destructuring
          ...user!.professions!
              .map((profession) => ListTile(title: Text(profession)))
              .toList(),
        ],
      ),
    );
  }
}

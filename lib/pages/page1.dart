import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:states/controllers/user_controller.dart';
import 'package:states/models/user.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userCtrl = Get.find<UserController>(); 

    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
      ),
      body: Obx(
        () => userCtrl.userExists.isTrue
            ? UserInfo(user: userCtrl.user.value)
            : Center(child: Text('No User')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(
          '/page2',
          arguments: {'title': 'Options'},
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  final User user;

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
            title: Text('Name: ${user.name}'),
          ),
          ListTile(
            title: Text('Age: ${user.age}'),
          ),
          Divider(),
          Text('Professions'),
          ...user.professions!
              .map((profession) => ListTile(
                    title: Text(profession),
                  ))
              .toList(),
        ],
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:states/bloc/user/user_cubit.dart';
import 'package:states/models/user.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
        actions: [
          BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              if (state is UserActice)
                return IconButton(
                  onPressed: () => context.read<UserCubit>().removeUser(),
                  icon: Icon(Icons.delete),
                );
              return SizedBox();
            },
          ),
        ],
      ),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          // Could be replaced for a switch(state.runtimeType) statement
          if (state is UserInitial)
            return Center(child: Text('No User'));
          else if (state is UserActice)
            return UserInfo(user: state.user!);
          else
            return Center(child: Text('Unknown State!'));
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
              .map((profession) => ListTile(title: Text(profession)))
              .toList(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states/bloc/user/user_bloc.dart';
import 'package:states/models/user.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);

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
                final user = User(
                  name: 'Andrés',
                  age: 23,
                  professions: ['Mobile Developer', 'Designer'],
                );
                userBloc.add(SetUser(user: user));
              },
              color: Colors.blue,
              child: Text(
                'Set a User',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () => userBloc.add(ChangeAge(newAge: 32)),
              color: Colors.blue,
              child: Text(
                'Edit Age',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () =>
                  userBloc.add(AddProfession(profession: 'Web Developer')),
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

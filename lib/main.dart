import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:states/pages/page1.dart';
import 'package:states/pages/page2.dart';
import 'package:states/services/user_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //Provider<UserService>(create: (_) => UserService()),
        ChangeNotifierProvider(create: (_) => UserService()),
      ],
      child: MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'page1',
        routes: {
          'page1': (_) => Page1(),
          'page2': (_) => Page2(),
        },
      ),
    );
  }
}

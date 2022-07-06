// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:scrumpoker/screens/home.dart';
import 'package:scrumpoker/screens/room.dart';
import 'socket.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  SocketApi.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ScrumPoker',
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: (settings) {
          if (settings.name == '/') {
            if (Uri.base.pathSegments.isNotEmpty) {
              return MaterialPageRoute(
                builder: (context) =>
                    RoomPage(roomId: Uri.base.pathSegments[0]),
              );
            } else {
              return MaterialPageRoute(
                builder: (context) => const HomePage(),
              );
            }
          } else {
            return null;
          }
        });
  }
}

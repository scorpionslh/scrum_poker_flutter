// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:scrumpoker/socket.dart';

class RoomPage extends StatefulWidget {
  const RoomPage({Key? key, this.roomId = ''}) : super(key: key);
  final String roomId;

  @override
  State<RoomPage> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  void join() {
    SocketApi socketApi = SocketApi();
    socketApi.joinRoom(widget.roomId);
  }

  void newRoom() {
    print('teste');
    SocketApi socketApi = SocketApi();
    socketApi.newRoom();
  }

  @override
  Widget build(BuildContext context) {
    print('roompage');

    return Scaffold(
      appBar: AppBar(
        title: const Text('ScrumPoker'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              Navigator.pushNamed(context, '/about');
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text('Seja Bem Vindo ao Scrum Poker'),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
          ),
          const SizedBox(height: 5),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: join,
                  child: const Text('Entrar'),
                ),
                const Text('ou'),
                TextButton(
                  onPressed: newRoom,
                  child: const Text('Criar nova sala !!!'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ignore_for_file: avoid_print, library_prefixes

import 'dart:async';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketApi {
  static final SocketApi _socketApi = SocketApi._internal();

  SocketApi._internal();

  factory SocketApi() {
    return _socketApi;
  }

  IO.Socket socket = IO.io(
    'ws://localhost:3001',
    IO.OptionBuilder()
        .setTransports(['websocket'])
        .setTimeout(5000)
        .setReconnectionDelay(10000)
        .enableReconnection()
        .build(),
  );

  static void init() {
    _socketApi.socket.on('connect', (_) {
      print(_socketApi.socket.id);
      print('Connected');
    });

    _socketApi.socket.on('newRoom', (data) {
      print(data);
      print('new Room');
    });
  }

  dynamic newRoom() {
    return _socketApi.socket.emit('newRoom');
  }
}

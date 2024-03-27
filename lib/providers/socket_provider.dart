import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

class SocketProvider extends ChangeNotifier {
  int _scoreA = 0;
  int get scoreA => _scoreA;
  set scoreA(int newValue) {
    if (newValue != _scoreA) {
      _scoreA = newValue;
      notifyListeners();
    }
  }

  int _scoreB = 0;
  int get scoreB => _scoreB;
  set scoreB(int newValue) {
    if (newValue != _scoreB) {
      _scoreB = newValue;
      notifyListeners();
    }
  }

  String _information = 'This is great battle between Team1 and Team2';
  String get information => _information;
  set information(String newValue) {
    if (newValue != _information) {
      _information = newValue;
      notifyListeners();
    }
  }

  ServerSocket? serverSocket;

  Socket? _clientSocket;

  String get matchScore => '$scoreA:$scoreB';

  Future<void> initServerSocket() async {
    serverSocket = await ServerSocket.bind('0.0.0.0', 8080);

    debugPrint(
        'TCP server running on ${serverSocket?.address.host}:${serverSocket?.port}');

    serverSocket?.listen((Socket clientSocket) {
      debugPrint(
          'Client connected: ${clientSocket.remoteAddress.address}:${clientSocket.remotePort}');
      _clientSocket = clientSocket;
      // Handle messages from the client
      clientSocket.listen((List<int> data) {
        String jsonString = utf8.decode(data);
        Map<String, dynamic> jsonData = jsonDecode(jsonString);
        information = jsonData['information'];
        scoreA = jsonData['scoreA'];
        scoreB = jsonData['scoreB'];
        debugPrint('Received JSON data: $jsonData');
      });

      // Handle client disconnection
      clientSocket.done.then((_) {
        debugPrint(
            'Client disconnected: ${clientSocket.remoteAddress.address}:${clientSocket.remotePort}');
      }).catchError((error) {
        debugPrint('Error with client socket: $error');
      });
    });
  }

  Future<void> sendData() async {
    // Send data to the server
    Map<String, dynamic> jsonData = {
      'information': information,
      'scoreA': scoreA,
      'scoreB': scoreB,
    };
    String jsonString = jsonEncode(jsonData);
    _clientSocket?.write(jsonString);
  }
}

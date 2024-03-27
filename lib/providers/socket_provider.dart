import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

class SocketProvider extends ChangeNotifier {
  String matchScore = '0:0';
  String matchInfo = '';

  ServerSocket? serverSocket;

  Future<void> initServerSocket() async {
    serverSocket = await ServerSocket.bind('0.0.0.0', 8080);

    debugPrint(
        'TCP server running on ${serverSocket?.address.host}:${serverSocket?.port}');

    serverSocket?.listen((Socket clientSocket) {
      debugPrint(
          'Client connected: ${clientSocket.remoteAddress.address}:${clientSocket.remotePort}');

      // Handle messages from the client
      clientSocket.listen((List<int> data) {
        String jsonString = utf8.decode(data);
        Map<String, dynamic> jsonData = jsonDecode(jsonString);
        matchInfo = jsonData['information'];
        matchScore = jsonData['score'];
        notifyListeners();
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
}

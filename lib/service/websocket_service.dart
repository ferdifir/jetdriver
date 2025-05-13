import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:jetdriver/service/hive_service.dart'; // ganti path sesuai struktur

typedef OnMessageCallback = void Function(Map<String, dynamic> data);
typedef OnConnectedCallback = void Function();
typedef OnDisconnectedCallback = void Function();

class WebSocketService {
  static final WebSocketService _instance = WebSocketService._internal();
  factory WebSocketService() => _instance;

  WebSocketService._internal();

  late WebSocketChannel _channel;
  bool _isConnected = false;

  OnMessageCallback? onMessage;
  OnConnectedCallback? onConnected;
  OnDisconnectedCallback? onDisconnected;

  void connect(String url) {
    final token = HiveService().get<String>('token');
    final wsUrl = Uri.parse(token != null ? '$url?token=$token' : url);
    _channel = WebSocketChannel.connect(wsUrl);
    _isConnected = true;

    _channel.stream.listen(
      (event) {
        try {
          final data = jsonDecode(event);
          if (data is Map<String, dynamic>) {
            onMessage?.call(data);
          }
        } catch (_) {}
      },
      onDone: () {
        _isConnected = false;
        onDisconnected?.call();
      },
      onError: (e) {
        _isConnected = false;
        onDisconnected?.call();
      },
    );

    onConnected?.call();
  }

  void send(String type, dynamic data) {
    if (!_isConnected) return;

    final token = HiveService().get<String>('token');

    final payload = {
      "type": type,
      "token": token, // token disisipkan otomatis
      "data": data,
    };

    _channel.sink.add(jsonEncode(payload));
  }

  void close() {
    _channel.sink.close();
    _isConnected = false;
  }

  bool get isConnected => _isConnected;
}

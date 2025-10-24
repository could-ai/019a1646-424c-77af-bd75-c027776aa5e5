import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '3D Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const GameScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    final WebViewController controller = WebViewController();
    
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..loadFlutterAsset('assets/index.html');

    _controller = controller;
  }

  void _movePlayer(double dx, double dz) {
    _controller.runJavaScript('movePlayer($dx, $dz)');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Roblox Type Game'),
        backgroundColor: Colors.black87,
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          // Movement Controls
          Positioned(
            bottom: 30,
            right: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: "up",
                  onPressed: () => _movePlayer(0, 0.5),
                  child: const Icon(Icons.arrow_upward),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    FloatingActionButton(
                      heroTag: "left",
                      onPressed: () => _movePlayer(-0.5, 0),
                      child: const Icon(Icons.arrow_back),
                    ),
                    const SizedBox(width: 60),
                    FloatingActionButton(
                      heroTag: "right",
                      onPressed: () => _movePlayer(0.5, 0),
                      child: const Icon(Icons.arrow_forward),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                FloatingActionButton(
                  heroTag: "down",
                  onPressed: () => _movePlayer(0, -0.5),
                  child: const Icon(Icons.arrow_downward),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

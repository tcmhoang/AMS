import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:window_size/window_size.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle('LEON SYSTEM VIETNAM ASSETS MANAGEMENT');
    setWindowMinSize(const Size(300, 300));
    setWindowMaxSize(Size.infinite);
  }
  runApp(App());
}

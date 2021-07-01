import 'dart:io';

import 'package:window_size/window_size.dart';
import 'package:flutter/widgets.dart';
import 'package:lsv_ams/services/injection_pool.dart';
import 'app.dart';

void main() async {
  // runApp(App());
  WidgetsFlutterBinding.ensureInitialized();
  await InjectionPool.initInjection();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle('LEON SYSTEM VIETNAM ASSETS MANAGEMENT');
    setWindowMinSize(const Size(300, 300));
    setWindowMaxSize(Size.infinite);
  }
  runApp(App());
}

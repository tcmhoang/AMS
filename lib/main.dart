import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:window_size/window_size.dart';

import 'app.dart';
import 'config/constansts.dart';
import 'services/injection_pool.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InjectionPool.initInjection();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle('LEON SYSTEM VIETNAM ASSETS MANAGEMENT');
    setWindowMinSize(const Size(kMinScreenSize, kMinScreenSize));
    setWindowMaxSize(Size.infinite);
  }
  runApp(App());
}

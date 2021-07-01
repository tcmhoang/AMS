import 'package:flutter/widgets.dart';
import 'package:lsv_ams/services/injection_pool.dart';

void main() async {
  // runApp(App());
  WidgetsFlutterBinding.ensureInitialized();
  await InjectionPool.initInjection();
}

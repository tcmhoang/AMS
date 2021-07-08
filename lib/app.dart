import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lsv_ams/providers/main_screen_provider.dart';
import 'package:provider/provider.dart';

import 'pages/main/main_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      ChangeNotifierProvider<MainScreenProvider>(
        create: (_) => MainScreenProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'LEON SYSTEM DEVELOPMENT ASSET MANAGEMENT APP',
          theme: ThemeData(
            pageTransitionsTheme: const PageTransitionsTheme(
              builders: <TargetPlatform, PageTransitionsBuilder>{
                TargetPlatform.linux: FadeThroughPageTransitionsBuilder(),
                TargetPlatform.windows: FadeThroughPageTransitionsBuilder(),
              },
            ),
            fontFamily: GoogleFonts.roboto().fontFamily,
          ),
          home: MainScreen(),
        ),
      );
}

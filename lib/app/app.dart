import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app/app_theme.dart';
import '../common/view/common_screen.dart';
import '../browse/view/browse_screen.dart';

class App extends StatefulWidget {
  @override
  _State createState() {
    return _State();
  }
}

class _State extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.data,
      home: BrowseScreen(),
    );
  }
}

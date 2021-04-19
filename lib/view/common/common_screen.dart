import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonScreen extends StatefulWidget {
  final Widget child;

  CommonScreen({
    @required this.child,
  });

  @override
  _State createState() {
    return _State();
  }
}

class _State extends State<CommonScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 24.0,
              color: Colors.white,
            ),
            Expanded(
              child: widget.child,
            ),
          ],
        ),
      ),
    );
  }
}

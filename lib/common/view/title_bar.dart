import 'dart:async';

import 'package:flutter/material.dart';

class TitleBar extends StatefulWidget {
  final String title;
  final void Function() onBackButtonTap;
  final void Function() onRefreshButtonTap;

  TitleBar({
    @required this.title,
    @required this.onRefreshButtonTap,
    this.onBackButtonTap,
  });

  @override
  _State createState() {
    return _State();
  }
}

class _State extends State<TitleBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            child: widget.onBackButtonTap == null
                ? SizedBox()
                : IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black38,
                    ),
                    splashRadius: 16.0,
                    onPressed: widget.onBackButtonTap,
                  ),
          ),
          Expanded(
            child: Text(
              widget.title,
              style: Theme.of(context).textTheme.headline4.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
              icon: Icon(
                Icons.refresh,
                color: Colors.black38,
              ),
              splashRadius: 16.0,
              onPressed: widget.onRefreshButtonTap,
            ),
          ),
        ],
      ),
    );
  }
}

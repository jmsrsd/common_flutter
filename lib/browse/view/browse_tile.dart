import 'dart:async';
import 'dart:math';

import 'package:common_flutter/detail/view/detail_screen.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import 'browse_photo.dart';

class BrowseTile extends StatefulWidget {
  final Map<String, dynamic> data;

  BrowseTile({
    @required this.data,
  });

  @override
  _State createState() {
    return _State();
  }
}

class _State extends State<BrowseTile> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        height: 56.0,
        alignment: Alignment.center,
        child: Stack(
          children: [
            Row(
              children: [
                AspectRatio(
                  aspectRatio: 1.0,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Material(
                      color: Colors.black12,
                      shape: CircleBorder(),
                      clipBehavior: Clip.antiAlias,
                      child: BrowsePhoto(
                        url: widget.data['photoUrl'] ?? '',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.only(left: 8.0, right: 16.0),
                      child: Material(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(4.0),
                        clipBehavior: Clip.antiAlias,
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 4.0,
                          ),
                          child: Text(
                            widget.data['name'] ?? '',
                            softWrap: false,
                            overflow: TextOverflow.fade,
                            style:
                                Theme.of(context).textTheme.bodyText1.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Timer.run(() {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return DetailScreen(
                          data: widget.data,
                        );
                      }),
                    );
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

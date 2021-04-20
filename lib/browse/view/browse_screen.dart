import 'dart:async';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:common_flutter/common/view/common_screen.dart';
import 'package:common_flutter/common/view/search_bar.dart';
import 'package:common_flutter/common/view/title_bar.dart';
import 'package:common_flutter/detail/view/detail_screen.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import 'browse_list.dart';

class BrowseScreen extends StatefulWidget {
  @override
  _State createState() {
    return _State();
  }
}

class _State extends State<BrowseScreen> {
  String searchQuery;

  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      child: Container(
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleBar(
              title: 'Persons',
              onRefreshButtonTap: () {
                Timer.run(() {
                  setState(() {});
                });
              },
            ),
            SearchBar(onSubmitted: (query) {
              print(query);

              setState(() {
                searchQuery = query ?? '';
              });
            }),
            Expanded(
              child: BrowseList(
                searchQuery: searchQuery,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 16.0,
                right: 8.0,
                bottom: 8.0,
              ),
              child: Row(
                children: [
                  FlatButton(
                    color: Colors.black12,
                    clipBehavior: Clip.antiAlias,
                    minWidth: double.maxFinite,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    onPressed: () {},
                    child: Icon(
                      Icons.person_add_alt_1,
                      color: Colors.black38,
                    ),
                  ),
                  FlatButton(
                    color: Colors.black12,
                    clipBehavior: Clip.antiAlias,
                    minWidth: double.maxFinite,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    onPressed: () {},
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.black38,
                    ),
                  ),
                ].map((e) {
                  return Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 8.0),
                      child: Container(
                        child: e,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

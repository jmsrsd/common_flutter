import 'dart:async';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:common_flutter/common/view/common_screen.dart';
import 'package:common_flutter/common/view/title_bar.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final Map<String, dynamic> data;

  DetailScreen({
    @required this.data,
  });

  @override
  _State createState() {
    return _State();
  }
}

class _State extends State<DetailScreen> {
  Widget get photo {
    return CachedNetworkImage(
      imageUrl: widget.data['photoUrl'],
      alignment: Alignment.center,
      fit: BoxFit.cover,
      placeholder: (context, url) {
        return Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.transparent,
            valueColor: AlwaysStoppedAnimation(
              Colors.black38,
            ),
          ),
        );
      },
      errorWidget: (context, url, error) {
        return Center(
          child: Icon(
            Icons.image,
            color: Colors.black38,
          ),
        );
      },
    );
  }

  Widget get tile {
    return Material(
      color: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 16.0,
        ).copyWith(
          right: 0.0,
        ),
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      'Nama',
                      softWrap: false,
                      overflow: TextOverflow.fade,
                      style: Theme.of(context).textTheme.caption.copyWith(
                            color: Colors.black38,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Text(
                    widget.data['name'],
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              child: IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Colors.black38,
                ),
                splashRadius: 16.0,
                onPressed: () {
                  Timer.run(() {
                    setState(() {});
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      child: Container(
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleBar(
              title: 'Person',
              onBackButtonTap: () {
                Timer.run(() {
                  Navigator.of(context).pop();
                });
              },
              onRefreshButtonTap: () {
                Timer.run(() {
                  setState(() {});
                });
              },
            ),
            Expanded(
              child: Row(
                children: [
                  Container(
                    width: 56.0 * 2.0,
                    margin: EdgeInsets.symmetric(horizontal: 16.0).copyWith(
                      top: 8.0,
                      bottom: 32.0,
                    ),
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        Material(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(8.0),
                          clipBehavior: Clip.antiAlias,
                          child: AspectRatio(
                            aspectRatio: 3.0 / 4.0,
                            child: photo,
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
                            Icons.upload_file,
                            color: Colors.black38,
                          ),
                        ),
                        Spacer(),
                        FlatButton(
                          color: Colors.black12,
                          clipBehavior: Clip.antiAlias,
                          minWidth: double.maxFinite,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          onPressed: () {},
                          child: Icon(
                            Icons.delete,
                            color: Colors.black38,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: SingleChildScrollView(
                        padding: EdgeInsets.only(
                          top: 8.0,
                          right: 16.0,
                          bottom: 32.0,
                        ),
                        physics: BouncingScrollPhysics(),
                        child: Material(
                          color: Colors.black12,
                          clipBehavior: Clip.antiAlias,
                          borderRadius: BorderRadius.circular(8.0),
                          child: Column(
                            children: [
                              tile,
                              tile,
                              tile,
                              tile,
                              tile,
                              tile,
                              tile,
                              tile,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Container(
                  //   margin: EdgeInsets.symmetric(
                  //     horizontal: 8.0,
                  //   ).copyWith(bottom: 32.0),
                  //   alignment: Alignment.topCenter,
                  //   child: Column(
                  //     children: [
                  //       IconButton(
                  //         icon: Icon(
                  //           Icons.delete,
                  //           color: Colors.black38,
                  //         ),
                  //         splashRadius: 16.0,
                  //         onPressed: () {
                  //           Timer.run(() {
                  //             setState(() {});
                  //           });
                  //         },
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

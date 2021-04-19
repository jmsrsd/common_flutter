import 'dart:async';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:common_flutter/view/common/common_screen.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  @override
  _State createState() {
    return _State();
  }
}

class _State extends State<DetailScreen> {
  Widget get title {
    return Container(
      height: 56.0,
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 1.0,
            child: Center(
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black38,
                ),
                splashRadius: 16.0,
                onPressed: () {
                  Timer.run(() {
                    Navigator.pop(context);
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: Text(
              'Contact',
              style: Theme.of(context).textTheme.headline4.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          AspectRatio(
            aspectRatio: 1.0,
            child: Center(
              child: IconButton(
                icon: Icon(
                  Icons.refresh,
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
          ),
        ],
      ),
    );
  }

  Widget get photo {
    return CachedNetworkImage(
      imageUrl: 'https://randomuser.me'
          '/api/portraits'
          '/${Random().nextInt(1000) % 2 == 0 ? '' : 'wo'}men'
          '/${Random().nextInt(1000) % 100}.jpg',
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
        height: 56.0,
        alignment: Alignment.center,
        child: Stack(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 16.0, right: 16.0),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Nama',
                          softWrap: false,
                          overflow: TextOverflow.fade,
                          style: Theme.of(context).textTheme.caption.copyWith(
                                color: Colors.black38,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        Text(
                          '${Faker().person.firstName()}'
                          ' ${Faker().person.lastName()}'
                          ' ${Faker().person.lastName()}'
                          ' ${Faker().person.lastName()}',
                          softWrap: false,
                          overflow: TextOverflow.fade,
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {},
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
            title,
            Expanded(
              child: Row(
                children: [
                  Container(
                    width: 56.0,
                    margin: EdgeInsets.only(
                      top: 8.0,
                      left: 16.0,
                      bottom: 32.0,
                    ),
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        Material(
                          color: Colors.black12,
                          shape: CircleBorder(),
                          clipBehavior: Clip.antiAlias,
                          child: AspectRatio(
                            aspectRatio: 1.0,
                            child: photo,
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.black38,
                          ),
                          splashRadius: 16.0,
                          onPressed: () {
                            Timer.run(() {
                              setState(() {});
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: SingleChildScrollView(
                        padding: EdgeInsets.all(16.0).copyWith(
                          top: 8.0,
                          right: 8.0,
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
                  Container(
                    width: 56.0,
                    margin: EdgeInsets.only(
                      right: 8.0,
                      bottom: 32.0,
                    ),
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        IconButton(
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

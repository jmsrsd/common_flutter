import 'dart:async';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:common_flutter/view/common/common_screen.dart';
import 'package:common_flutter/view/detail/detail_screen.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _State createState() {
    return _State();
  }
}

class _State extends State<HomeScreen> {
  Widget get title {
    return Container(
      height: 56.0,
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 16.0),
              child: Text(
                'Contacts',
                style: Theme.of(context).textTheme.headline4.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
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

  Widget get search {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      child: Container(
        height: 40.0,
        alignment: Alignment.center,
        child: Material(
          color: Colors.black12,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AspectRatio(
                aspectRatio: 1.0,
                child: Center(
                  child: Icon(Icons.search, color: Colors.black38),
                ),
              ),
              Expanded(
                child: TextField(
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                        color: Colors.black38,
                        fontWeight: FontWeight.bold,
                      ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    hintText: 'Search',
                    hintStyle: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: Colors.black38,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              AspectRatio(
                aspectRatio: 1.0,
                child: Center(
                  child: IconButton(
                    splashRadius: 16.0,
                    icon: Icon(
                      Icons.close,
                      color: Colors.black38,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
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
                AspectRatio(
                  aspectRatio: 1.0,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Material(
                      color: Colors.black12,
                      shape: CircleBorder(),
                      clipBehavior: Clip.antiAlias,
                      child: photo,
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
                            '${Faker().person.firstName()}'
                            ' ${Faker().person.lastName()}'
                            ' ${Faker().person.lastName()}'
                            ' ${Faker().person.lastName()}',
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
                        return DetailScreen();
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

  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      child: Container(
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title,
            search,
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(16.0).copyWith(
                  top: 8.0,
                  bottom: 16.0 + 8.0,
                ),
                physics: BouncingScrollPhysics(),
                children: [
                  tile,
                  tile,
                  tile,
                  tile,
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
          ],
        ),
      ),
    );
  }
}

import 'dart:async';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BrowsePhoto extends StatefulWidget {
  final String url;

  BrowsePhoto({
    @required this.url,
  });

  @override
  _State createState() {
    return _State();
  }
}

class _State extends State<BrowsePhoto> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.url,
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
}

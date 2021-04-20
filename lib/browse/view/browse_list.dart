import 'dart:convert';
import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import 'browse_tile.dart';

class BrowseList extends StatefulWidget {
  final String searchQuery;

  BrowseList({
    this.searchQuery,
  });

  @override
  _State createState() {
    return _State();
  }
}

class _State extends State<BrowseList> {
  final List<Map<String, dynamic>> data = [];

  List<Map<String, dynamic>> get sortedData {
    final copy = data.map((e) {
      return jsonDecode(jsonEncode(e)) as Map<String, dynamic>;
    }).toList();

    copy.sort((a, b) {
      return (a['name'] as String).compareTo(b['name'] as String);
    });

    return copy;
  }

  void updateData() {
    data.clear();
    data.addAll(
      List.generate(24, (index) {
        return {
          'photoUrl': 'https://randomuser.me'
              '/api/portraits'
              '/${Random().nextInt(1000) % 2 == 0 ? '' : 'wo'}men'
              '/${Random().nextInt(1000) % 100}.jpg',
          'name': '${Faker().person.firstName()}'
              ' ${Faker().person.lastName()}'
              ' ${Faker().person.lastName()}'
              ' ${Faker().person.lastName()}',
        };
      }),
    );
  }

  @override
  void initState() {
    super.initState();

    updateData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0).copyWith(
        top: 8.0,
        bottom: 8.0,
      ),
      physics: BouncingScrollPhysics(),
      children: sortedData.where((element) {
        if (widget.searchQuery == null) {
          return true;
        }

        return (element['name'] as String)
            .toLowerCase()
            .contains(widget.searchQuery);
      }).map((element) {
        return BrowseTile(
          data: element,
        );
      }).toList(),
    );
  }
}

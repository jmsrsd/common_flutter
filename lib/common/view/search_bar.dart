import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class SearchBar extends StatefulWidget {
  final void Function(String) onSubmitted;

  SearchBar({
    @required this.onSubmitted,
  });

  @override
  _State createState() {
    return _State();
  }
}

class _State extends State<SearchBar> {
  final focusNode = FocusNode();
  final keyboardVisibilityController = KeyboardVisibilityController();
  final textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();

    keyboardVisibilityController.onChange.listen((isVisible) {
      if (isVisible == false) {
        focusNode.unfocus();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
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
                focusNode: focusNode,
                controller: textEditingController,
                textInputAction: TextInputAction.search,
                onSubmitted: widget.onSubmitted,
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
                  onPressed: () {
                    textEditingController.clear();
                    widget.onSubmitted('');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

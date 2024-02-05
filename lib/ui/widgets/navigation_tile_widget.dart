import 'package:flutter/material.dart';
import 'package:text_responsive/text_responsive.dart';

class NavigationTileWidget extends StatelessWidget {
  const NavigationTileWidget({
    required this.page,
    required this.title,
    this.description = '',
    super.key,
  });

  final Widget page;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<Widget>(
            builder: (BuildContext context) => page,
          ),
        );
      },
      title: InlineTextWidget(
        title,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        description,
      ),
    );
  }
}

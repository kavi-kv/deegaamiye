import 'package:flutter/material.dart';

class SocialListiles extends StatelessWidget {
  final Widget title;
  final Widget icon;
  const SocialListiles({Key? key, required this.title, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green[200],
        borderRadius: BorderRadius.circular(12), // Rounded border
      ),
      child: ListTile(
        leading: icon,
        title: title,
      ),
    );
  }
}

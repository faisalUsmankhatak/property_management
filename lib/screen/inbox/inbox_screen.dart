import 'package:flutter/material.dart';
class InboxScreen extends StatelessWidget {
  const InboxScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Container(
        width: 100,
        height: 100,
        child: Text("Inbox")),);
  }
}

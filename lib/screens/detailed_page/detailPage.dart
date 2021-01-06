import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
      children: [
        _coverWithTitle(),
      ],
    );
  }

  Widget _coverWithTitle() {
    return Text("asda");
  }
}

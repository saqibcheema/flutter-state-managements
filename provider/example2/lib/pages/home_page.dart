import 'package:example2/widgets/cheaper_widget.dart';
import 'package:example2/widgets/expensive_widget.dart';
import 'package:example2/widgets/object_provider_widget.dart';
import 'package:example2/widgets/text_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/object_model_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.blue,
      ),
      body: buildHome(context),
    );
  }
}

Widget buildHome(BuildContext context) => Column(
  children: [
    SizedBox(height: 30),
    Row(children: [CheaperWidget(), ExpensiveWidget()]),
    Row(children: [ObjectProviderWidget()]),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButtonWidget(
          text: 'Stop',
          onPressed: () {
            final provider = context.read<ObjectModelProvider>();
            provider.stop();
          },
        ),
        TextButtonWidget(
          text: 'Start',
          onPressed: () {
            final provider = context.read<ObjectModelProvider>();
            provider.start();
          },
        ),
      ],
    ),
  ],
);

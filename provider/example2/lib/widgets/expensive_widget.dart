import 'package:example2/model/base_model.dart';
import 'package:example2/model/object_model_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpensiveWidget extends StatelessWidget {
  const ExpensiveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final expensiveWidget = context.select<ObjectModelProvider, ExpensiveModel>((provider) => provider.expensiveModel);
    return Expanded(
      child: Container(
        color: Colors.blue,
        height: 100,
        child: Column(
          children: [
            const Text('Expensive Widget',textAlign: TextAlign.center,),
            const Text('Latest Update : ',textAlign: TextAlign.center),
            Text(expensiveWidget.updatedTime)
          ],
        ),
      ),
    );
  }
}

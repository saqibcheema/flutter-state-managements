import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/object_model_provider.dart';

class ObjectProviderWidget extends StatelessWidget {
  const ObjectProviderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final objectModelProvider = context.watch<ObjectModelProvider>();
    return Expanded(
      child: Container(
        color: Colors.purple,
        height: 100,
        child: Column(
          children: [
            const Text('Object Provider Widget',textAlign: TextAlign.center,),
            const Text('ID',textAlign: TextAlign.center),
            Text(objectModelProvider.id)
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/base_model.dart';
import '../model/object_model_provider.dart';

class CheaperWidget extends StatelessWidget {
  const CheaperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cheaperModel = context.select<ObjectModelProvider, CheaperModel>((provider) => provider.cheaperModel);
    return Expanded(
      child: Container(
        color: Colors.yellow,
        height: 100,
        child: Column(
          children: [
            const Text('Cheaper Widget',textAlign: TextAlign.center,),
            const Text('Latest Update : ',textAlign: TextAlign.center),
            Text(cheaperModel.updatedTime,)
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/bread_crumb_provider.dart';
import '../model/breadcrumb_model.dart';
import '../widgets/text_button_widget.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  TextEditingController textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          buildTextForm(context, textController),
          TextButtonWidget(text: "Add",onPressed: (){
            Navigator.pop(context);
            context.read<BreadCrumbProvider>().add(BreadCrumb(text: textController.text));
          },),
        ],
      ),
    );
  }
}

Widget buildTextForm(BuildContext context,TextEditingController textController) => Padding(
  padding: EdgeInsets.all(16),
  child: TextFormField(
    controller: textController,
    decoration: const InputDecoration(
      border: OutlineInputBorder(),
      hintText: 'Add a new bread crumb....',
    ),
  ),
);
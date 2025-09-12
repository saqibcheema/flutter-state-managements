import 'package:example1/model/bread_crumb_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/text_button_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildBreadCrumb(context),
          TextButtonWidget(
            text: "Add bread crumb",
            onPressed: () => Navigator.pushNamed(context, '/new'),
          ),
          TextButtonWidget(text: "reset",onPressed: (){
            context.read<BreadCrumbProvider>().reset();
          }),
        ],
      ),
    );
  }
}

Widget buildBreadCrumb(BuildContext context) {
  return Consumer<BreadCrumbProvider>(
    builder: (context, provider, child) {
      return Wrap(
        spacing: 0,
        children: provider.breadCrumbs.map((crumb) {
          return TextButton(
            onPressed: () {},
            child: Text(
              crumb.text + (crumb.isActive ? ">" : ""),
              style: TextStyle(
                color: crumb.isActive ? Colors.blue : Colors.black,
              ),
            ),
          );
        }).toList(),
      );
    },
  );
}

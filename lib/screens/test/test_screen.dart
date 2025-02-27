import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/widgets/actions/bla_button.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              Text("Hello World"),
              BlaButton(
                  text: "Book",
                  buttonType: ButtonType.primary,
                  onPressed: () {}),
              SizedBox(height: 100),
              BlaButton(
                  text: "Contact Driver",
                  buttonType: ButtonType.secondary,
                  onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}

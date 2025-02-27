import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/theme/theme.dart';
import 'package:week_3_blabla_project/widgets/actions/bla_button.dart';

class NumberSpinner extends StatelessWidget {
  const NumberSpinner({
    super.key,
    required this.initialSeats,
  });

  final int initialSeats;

  @override
  Widget build(BuildContext context) {
    int currentSeats = initialSeats;

    return StatefulBuilder(
      builder: (context, setState) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Number of seats to book'),
            leading: IconButton(
              icon: Icon(Icons.close),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: BlaSpacings.m, vertical: BlaSpacings.m),
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.remove,
                            size: 30,
                            color: currentSeats > 1
                                ? BlaColors.primary
                                : BlaColors.greyLight,
                          ),
                          onPressed: currentSeats > 1
                              ? () => setState(() => currentSeats--)
                              : null,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Text(
                            '$currentSeats',
                            style: TextStyle(fontSize: 40),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.add,
                            size: 30,
                            color: BlaColors.primary,
                          ),
                          onPressed: () => setState(() => currentSeats++),
                        ),
                      ],
                    ),
                  ),
                ),

                // confirm button
                Center(
                  child: SizedBox(
                    width: 150,
                    child: BlaButton(
                      buttonType: ButtonType.primary,
                      text: "Confirm",
                      onPressed: () {
                        Navigator.pop(context, currentSeats);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

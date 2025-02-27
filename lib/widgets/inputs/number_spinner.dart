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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.remove,
                        size: 30,
                        color: BlaColors.primary,
                      ),
                      onPressed: currentSeats > 1
                          ? () => setState(() => currentSeats--)
                          : null,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: BlaSpacings.l),
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
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, currentSeats);
                  },
                  child: Text('Confirm'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

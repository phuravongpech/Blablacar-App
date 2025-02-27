import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/theme/theme.dart';

import '../../../model/ride/ride.dart';
import '../../../utils/date_time_util.dart';

class RideTile extends StatelessWidget {
  final Ride ride;
  const RideTile({super.key, required this.ride});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: BlaColors.greyLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(color: BlaColors.backGroundColor),
      ),
      title: Text(
          '${ride.departureLocation.name} -> ${ride.arrivalLocation.name}'),
      subtitle: Column(children: [
        Text('Date: ${DateTimeUtils.formatDateTime(ride.departureDate)}'),
        Text('Available seats: ${ride.availableSeats}'),
        Text(
          'Price per seat: €${ride.pricePerSeat}',
        ),
      ]),
      trailing: Text(
        '€${ride.pricePerSeat}',
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}

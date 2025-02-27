import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/model/ride/ride.dart';
import 'package:week_3_blabla_project/model/ride_pref/ride_pref.dart';
import 'package:week_3_blabla_project/screens/ride/widgets/ride_tile.dart';

import '../../service/rides_service.dart';

//this screen shows the avaliable rides from the ride pref
class RideScreen extends StatefulWidget {
  final RidePref ridePref;
  const RideScreen({super.key, required this.ridePref});

  @override
  State<RideScreen> createState() => _RideScreenState();
}

class _RideScreenState extends State<RideScreen> {
  late List<Ride> matchingRides;

  @override
  void initState() {
    super.initState();
    matchingRides = RidesService.getRidesFor(widget.ridePref);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text('Ride Screen'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                'ride for ${widget.ridePref.departure.name} to ${widget.ridePref.arrival.name}'),
            Text('avaliable rides: ${matchingRides.length}'),
            Expanded(
              child: ListView.builder(
                itemCount: matchingRides.length,
                itemBuilder: (context, index) {
                  final ride = matchingRides[index];
                  return RideTile(ride: ride);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

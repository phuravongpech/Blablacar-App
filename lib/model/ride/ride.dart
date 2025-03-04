import 'package:week_3_blabla_project/model/ride/locations.dart';
import 'package:week_3_blabla_project/service/rides_service.dart';

import '../../utils/date_time_util.dart';
import '../user/user.dart';

enum RideStatus {
  created,
  published,
  ongoing,
  finished;
}

///
/// This model describes a  Ride.
///
class Ride {
  final Location departureLocation;
  final DateTime departureDate;

  final Location arrivalLocation;
  final DateTime arrivalDateTime;

  final User driver;

  final int availableSeats;
  final double pricePerSeat;

  final RidesFilter ridesFilter;

  RideStatus status = RideStatus.created;

  final List<User> passengers = [];

  Ride({
    required this.departureLocation,
    required this.departureDate,
    required this.arrivalLocation,
    required this.arrivalDateTime,
    required this.driver,
    required this.availableSeats,
    required this.pricePerSeat,
    required this.ridesFilter,
  });

  void addPassenger(User passenger) {
    passengers.add(passenger);
  }

  int get remainingSeats => availableSeats - passengers.length;

  @override
  String toString() {
    return 'Ride from $departureLocation at ${DateTimeUtils.formatDateTime(departureDate)} '
        'to $arrivalLocation arriving at ${DateTimeUtils.formatDateTime(arrivalDateTime)}, '
        'Driver: $driver, Seats: $availableSeats, Price: \$${pricePerSeat.toStringAsFixed(2)}'
        'Remaining Seats: $remainingSeats, Pets allowed: ${ridesFilter.acceptPets}';
  }
}

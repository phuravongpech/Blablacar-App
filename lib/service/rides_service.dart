import 'package:week_3_blabla_project/model/ride_pref/ride_pref.dart';
import 'package:week_3_blabla_project/repository/rides_repository.dart';

import '../dummy_data/dummy_data.dart';
import '../model/ride/ride.dart';

////
///   This service handles:
///   - The list of available rides
///
class RidesService {
  // static List<Ride> availableRides = fakeRides;
  List<Ride>? availableRides;

  // Static private instance
  static RidesService? _instance;

  // Access to available rides
  final RidesRepository repository;

  // Private constructor
  RidesService._internal(this.repository);

  static void initialize(RidesRepository repository) {
    if (_instance == null) {
      _instance = RidesService._internal(repository);
    } else {
      throw Exception("RidesService is already initialized.");
    }
  }

  static RidesService get instance {
    if (_instance == null) {
      throw Exception(
          "RidesService is not initialized. Call initialize() first.");
    }
    return _instance!;
  }

  

  // List<Ride> get getAvailableRides => availableRides ?? [];

  ///
  ///  Return the relevant rides, given the passenger preferences
  ///
  List<Ride> getRidesFor(RidePreference preferences, RidesFilter? filter) {
    List<Ride> rides = repository.getRides(preferences, preferences.ridesFilter,
        RideSortType(sortOrder: RideSortOrder.soonest));

    return rides
        .where((ride) =>
            ride.departureLocation == preferences.departure &&
            ride.arrivalLocation == preferences.arrival &&
            ride.availableSeats >= preferences.requestedSeats &&
            ride.ridesFilter.acceptPets == filter?.acceptPets)
        .toList();
  }

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
}

class RidesFilter {
  final bool acceptPets;

  RidesFilter({required this.acceptPets});
}

class RideSortType {
  final RideSortOrder sortOrder;

  RideSortType({required this.sortOrder});
}

enum RideSortOrder { soonest, latest }

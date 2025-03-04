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

  ///
  ///  Return the relevant rides, given the passenger preferences
  ///
  List<Ride> getRidesFor(RidePreference preferences) {
    List<Ride> rides = repository.getRides(
        preferences, preferences.ridesFilter, RideSortType(sortOrder: RideSortOrder.soonest));

     // Sort rides based on the order (soonest → latest OR latest → soonest)
  rides.sort((a, b) {
    if (preferences.sortType?.sortOrder == RideSortOrder.latest) {
      return b.departureDate.compareTo(a.departureDate);
    }
    return a.departureDate.compareTo(b.departureDate);
  });

  return rides;
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

enum RideSortOrder { soonest, latest}

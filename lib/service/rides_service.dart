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
    return repository.getRides(preferences, preferences.ridesFilter);
  }
}

class RidesFilter {
  final bool acceptPets;

  RidesFilter({required this.acceptPets});
}

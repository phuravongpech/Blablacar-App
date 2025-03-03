import 'package:week_3_blabla_project/model/ride/locations.dart';

import '../dummy_data/dummy_data.dart';
import '../repository/locations_repository.dart';

////
///   This service handles:
///   - The list of available rides
///
class LocationsService {
  // static const List<Location> availableLocations = fakeLocations;

  // Static private instance
  static LocationsService? _instance;

  final LocationsRepository repository;

  // Access to available locations
  List<Location>? availableLocations;

  // Private constructor
  LocationsService._internal(this.repository) {
    availableLocations = repository.getLocations();
  }

  static void initialize(LocationsRepository repository) {
    if (_instance == null) {
      _instance = LocationsService._internal(repository);
    } else {
      throw Exception("LocationsService is already initialized.");
    }
  }

  static LocationsService get instance {
    if (_instance == null) {
      throw Exception(
          "LocationsService is not initialized. Call initialize() first.");
    }
    return _instance!;
  }

  List<Location> getLocations() {
    return repository.getLocations();
  }
}

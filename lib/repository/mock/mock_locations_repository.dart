import 'package:week_3_blabla_project/repository/locations_repository.dart';

import '../../model/ride/locations.dart';

class MockLocationsRepository extends LocationsRepository {
  final List<Location> _locations = [
    Location(country: Country.cambodia, name: "Phnom Penh"),
    Location(country: Country.cambodia, name: "Siem Reap"),
    Location(country: Country.cambodia, name: "Sihanoukville"),
    Location(country: Country.cambodia, name: "Kampot"),
    Location(country: Country.cambodia, name: "Battambang")
  ];

  @override
  List<Location> getLocations() {
    return _locations;
  }


}

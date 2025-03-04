import 'package:week_3_blabla_project/model/ride/locations.dart';
import 'package:week_3_blabla_project/model/user/user.dart';
import 'package:week_3_blabla_project/repository/rides_repository.dart';

import '../../model/ride/ride.dart';
import '../../model/ride_pref/ride_pref.dart';
import '../../service/rides_service.dart';

class MockRidesRepository extends RidesRepository {
  List<User> users = [
    User(
        firstName: 'Kannika',
        lastName: 'Kannika',
        email: 'hi',
        phone: '0123456789',
        profilePicture: 'assets/images/profile.png',
        verifiedProfile: true),
    User(
        firstName: 'Chaylim',
        lastName: 'Chaylim',
        email: 'hi',
        phone: '0123456789',
        profilePicture: 'assets/images/profile.png',
        verifiedProfile: true),
    User(
        firstName: 'Mengtech',
        lastName: 'Mengtech',
        email: 'hi',
        phone: '0123456789',
        profilePicture: 'assets/images/profile.png',
        verifiedProfile: true),
    User(
        firstName: 'Limhao',
        lastName: 'Limhao',
        email: 'hi',
        phone: '0123456789',
        profilePicture: 'assets/images/profile.png',
        verifiedProfile: true),
    User(
        firstName: 'Sovanda',
        lastName: 'h',
        email: 'hi',
        phone: '01',
        profilePicture: 'a',
        verifiedProfile: true)
  ];

  @override
  List<Ride> getRides(
      RidePreference preference, RidesFilter? filter, RideSortType? sortType) {
    final List<Ride> rides = [
      Ride(
          departureLocation:
              Location(name: 'Battambang', country: Country.cambodia),
          departureDate: DateTime.now().add(Duration(hours: 5, minutes: 30)),
          arrivalLocation:
              Location(name: 'Siem Reap', country: Country.cambodia),
          arrivalDateTime: DateTime.now().add(Duration(hours: 7, minutes: 30)),
          driver: users[0],
          availableSeats: 2,
          pricePerSeat: 10.0,
          ridesFilter: RidesFilter(acceptPets: true)),
      Ride(
          departureLocation:
              Location(name: 'Battambang', country: Country.cambodia),
          departureDate: DateTime.now().add(Duration(hours: 20)),
          arrivalLocation:
              Location(name: 'Siem Reap', country: Country.cambodia),
          arrivalDateTime: DateTime.now().add(Duration(hours: 22)),
          driver: users[1],
          availableSeats: 0,
          pricePerSeat: 10.0,
          ridesFilter: RidesFilter(acceptPets: true)),
      Ride(
          departureLocation:
              Location(name: 'Battambang', country: Country.cambodia),
          departureDate: DateTime.now().add(Duration(hours: 5)),
          arrivalLocation:
              Location(name: 'Siem Reap', country: Country.cambodia),
          arrivalDateTime: DateTime.now().add(Duration(hours: 8)),
          driver: users[2],
          availableSeats: 1,
          pricePerSeat: 10.0,
          ridesFilter: RidesFilter(acceptPets: true)),
      Ride(
          departureLocation:
              Location(name: 'Battambang', country: Country.cambodia),
          departureDate: DateTime.now().add(Duration(hours: 20)),
          arrivalLocation:
              Location(name: 'Siem Reap', country: Country.cambodia),
          arrivalDateTime: DateTime.now().add(Duration(hours: 22)),
          driver: users[3],
          availableSeats: 2,
          pricePerSeat: 10.0,
          ridesFilter: RidesFilter(acceptPets: true)),
      Ride(
          departureLocation:
              Location(name: 'Battambang', country: Country.cambodia),
          departureDate: DateTime.now().add(Duration(hours: 5)),
          arrivalLocation:
              Location(name: 'Siem Reap', country: Country.cambodia),
          arrivalDateTime: DateTime.now().add(Duration(hours: 8)),
          driver: users[4],
          availableSeats: 1,
          pricePerSeat: 10.0,
          ridesFilter: RidesFilter(acceptPets: true)),
    ];
    return rides;
  }
}

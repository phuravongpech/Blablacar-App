import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/model/ride/locations.dart';
import 'package:week_3_blabla_project/repository/mock/mock_ride_preferences_repository.dart';
import 'repository/mock/mock_locations_repository.dart';
import 'screens/ride_pref/ride_pref_screen.dart';
import 'service/locations_service.dart';
import 'service/ride_prefs_service.dart';
import 'theme/theme.dart';
import 'package:logger/logger.dart';

void main() {
  var logger = Logger();
  // 1 - Initialize the services
  RidePrefService.initialize(MockRidePreferencesRepository());
  logger.d(
      'Available ride preferences: ${RidePrefService.instance.getPastPreferences()}');

  LocationsService.initialize(MockLocationsRepository());
  logger.d('Available locations: ${LocationsService.instance.getLocations()}');

  // 2- Run the UI
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: Scaffold(body: RidePrefScreen()),
    );
  }
}

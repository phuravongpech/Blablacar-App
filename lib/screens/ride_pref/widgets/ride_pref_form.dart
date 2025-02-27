import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/utils/animations_util.dart';
import 'package:week_3_blabla_project/widgets/actions/bla_button.dart';
import 'package:week_3_blabla_project/widgets/inputs/location_picker.dart';

import '../../../model/ride/locations.dart';
import '../../../model/ride_pref/ride_pref.dart';
// import '../../../service/locations_service.dart';
import '../../../theme/theme.dart';
import '../../../utils/date_time_util.dart';
import '../../../widgets/display/bla_divider.dart';
import '../../../widgets/inputs/number_spinner.dart';

///
/// A Ride Preference From is a view to select:
///   - A depcarture location
///   - An arrival location
///   - A date
///   - A number of seats
///
/// The form can be created with an existing RidePref (optional).
///
class RidePrefForm extends StatefulWidget {
  // The form can be created with an optional initial RidePref.
  final RidePref? initRidePref;
  final void Function(RidePref)? onSearch;

  const RidePrefForm({super.key, this.initRidePref, this.onSearch});

  @override
  State<RidePrefForm> createState() => _RidePrefFormState();
}

class _RidePrefFormState extends State<RidePrefForm> {
  Location? departure;
  late DateTime departureDate;
  Location? arrival;
  late int requestedSeats;

  // ----------------------------------
  // Initialize the Form attributes
  // ----------------------------------

  @override
  void initState() {
    super.initState();
    departure = widget.initRidePref?.departure;
    arrival = widget.initRidePref?.arrival;
    departureDate = widget.initRidePref?.departureDate ?? DateTime.now();
    requestedSeats = widget.initRidePref?.requestedSeats ?? 1;
  }

  // ----------------------------------
  // Handle events
  // ----------------------------------

  void _handleSearch(){
    //validate the form if have all data yet
    if(departure == null || arrival == null){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select departure and arrival locations'),
        ),
      );
      return;
    }

    //create a new RidePref object
    final ridePref = RidePref(
      departure: departure!,
      arrival: arrival!,
      departureDate: departureDate,
      requestedSeats: requestedSeats,
    );

    //call the onSearch callback
    if(widget.onSearch != null){
      widget.onSearch!(ridePref);
    }
  }

  void _showDateSelection() async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: departureDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)));
    if (picked != null && picked != departureDate) {
      setState(() {
        departureDate = picked;
      });
    }
  }

  void _showLocationSelection(bool isDeparture) async {
    final result = await Navigator.of(context).push(
        AnimationUtils.createBottomToTopRoute(LocationPicker(
            initialLocation: isDeparture ? departure : arrival)));
    if (result != null && result is Location) {
      setState(() {
        if (isDeparture) {
          departure = result;
        } else {
          arrival = result;
        }
      });
    }
  }

  void _showSeatSelection() async {
    final result = await Navigator.of(context).push(
      AnimationUtils.createBottomToTopRoute(
        NumberSpinner(initialSeats: requestedSeats),
      ),
    );

    if (result != null && result is int) {
      setState(() {
        requestedSeats = result;
      });
    }
  }

  void _switchLocations() {
    setState(() {
      final temp = departure;
      departure = arrival;
      arrival = temp;
    });
  }

  // ----------------------------------
  // Compute the widgets rendering
  // ----------------------------------

  Widget _buildLocationPicker(
      String label, Location? location, bool isDeparture) {
    return InkWell(
      onTap: () => _showLocationSelection(isDeparture),
      child: Padding(
        padding: const EdgeInsets.all(BlaSpacings.s),
        child: Row(
          children: [
            Icon(
              Icons.circle_outlined,
              color: BlaColors.neutralLight,
            ),
            const SizedBox(width: BlaSpacings.s),
            Expanded(
              child: Text(
                location?.name ?? label,
                style: TextStyle(
                  color: location != null ? Colors.black : Colors.grey,
                ),
              ),
            ),
            if (isDeparture && departure != null && arrival != null)
              IconButton(
                icon: Icon(Icons.swap_vert, color: BlaColors.primary),
                onPressed: _switchLocations,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDatePicker() {
    return InkWell(
        onTap: _showDateSelection,
        child: Padding(
          padding: const EdgeInsets.all(BlaSpacings.s),
          child: Row(
            children: [
              Icon(
                Icons.calendar_today,
                color: BlaColors.neutralLight,
              ),
              const SizedBox(width: BlaSpacings.s),
              Text(
                DateTimeUtils.formatDateTime(departureDate),
                style: TextStyle(
                  color: BlaColors.neutralLight,
                ),
              ),
            ],
          ),
        ));
  }

  // ----------------------------------
  // Build the widgets
  // ----------------------------------
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildLocationPicker('Leaving from', departure, true),
          const BlaDivider(),
          _buildLocationPicker('Going to', arrival, false),
          const BlaDivider(),
          _buildDatePicker(),
          const BlaDivider(),
          InkWell(
            onTap: _showSeatSelection,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: BlaSpacings.m, vertical: BlaSpacings.m),
              child: Row(
                children: [
                  Icon(
                    Icons.people,
                    color: BlaColors.neutralLight,
                  ),
                  const SizedBox(width: 8),
                  Text('Passengers: $requestedSeats',
                      style: TextStyle(color: BlaColors.neutralLight)),
                ],
              ),
            ),
          ),
          const BlaDivider(),
          BlaButton(
            text: "Search",
            buttonType: ButtonType.primary,
            onPressed: _handleSearch,
          )
        ]);
  }
}

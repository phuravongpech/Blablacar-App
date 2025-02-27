import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/model/ride/locations.dart';
import 'package:week_3_blabla_project/widgets/display/bla_divider.dart';
import '../../dummy_data/dummy_data.dart';
import '../../../theme/theme.dart';

class LocationPicker extends StatefulWidget {
  final Location? initialLocation;

  const LocationPicker({
    super.key,
    this.initialLocation,
  });

  @override
  State<LocationPicker> createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  String _searchText = '';
  List<Location> _filteredLocations = fakeLocations;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        TextEditingController(text: widget.initialLocation?.name ?? '');
    _controller.addListener(() {
      _filterLocations(_controller.text);
    });
    if (widget.initialLocation != null) {
      _searchText = widget.initialLocation!.name;
      _filterLocations(_searchText);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _filterLocations(String searchText) {
    setState(() {
      _searchText = searchText;
      if (searchText.isEmpty) {
        _filteredLocations = fakeLocations.take(5).toList();
      } else {
        _filteredLocations = fakeLocations
            .where((location) =>
                location.name
                    .toLowerCase()
                    .contains(searchText.toLowerCase()) ||
                location.country.name
                    .toLowerCase()
                    .contains(searchText.toLowerCase()))
            .take(5)
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BlaColors.greyLight,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
          BlaSpacings.radiusLarge,
        )),
        toolbarHeight: 60.0,
        titleSpacing: 2.0,
        title: TextField(
          autofocus: true,
          decoration: InputDecoration(
              hintText: 'Search location',
              border: InputBorder.none,
              hintStyle: TextStyle(color: BlaColors.neutralDark)),
          controller: _controller,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.clear,
              color: BlaColors.neutralDark,
            ),
            onPressed: () {
              _controller.clear();
              _filterLocations('');
            },
          ),
        ],
      ),
      body: _filteredLocations.isEmpty
          ? Center(
              child: Text(
                'No locations found',
                style: TextStyle(color: BlaColors.neutralLight),
              ),
            )
          : ListView.builder(
              itemCount: _filteredLocations.length,
              itemBuilder: (context, index) {
                final location = _filteredLocations[index];
                return LocationTile(location: location);
              },
            ),
    );
  }
}

//not sure where to store this locationtile widget
//is it in the ride_pref screen widgets
//or input/location_picker/widgets/location_tile.dart

class LocationTile extends StatelessWidget {
  const LocationTile({
    super.key,
    required this.location,
  });

  final Location location;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(
              location.name,
              style: BlaTextStyles.heading
                  .copyWith(fontSize: 16, color: BlaColors.neutralDark),
            ),
            subtitle: Text(location.country.name,
                style: BlaTextStyles.label
                    .copyWith(fontSize: 14, color: BlaColors.neutralLight)),
            onTap: () {
              Navigator.pop(context, location);
            },
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          ),
        ),
        const BlaDivider()
      ],
    );
  }
}

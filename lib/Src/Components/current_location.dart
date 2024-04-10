import 'dart:io';

import 'package:deegaamiye_2/Src/Controllers/location_controller.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class CurrentLocation extends StatefulWidget {
  @override
  _CurrentLocationState createState() => _CurrentLocationState();
}

class _CurrentLocationState extends State<CurrentLocation> {
  LocationController controller = Get.put(LocationController());
  Position? _currentPosition;
  String _currentCity = '';
  String _currentCountry = '';

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
  }

  // Check location permission
  void _checkLocationPermission() async {
    // Check if location permission is granted
    PermissionStatus permission = await Permission.location.request();
    if (permission == PermissionStatus.granted) {
      // Permission granted, get current location
      _getCurrentLocation();
    } else {
      // Permission not granted, handle accordingly (e.g., show error message)
      print('Location permission denied');
    }
  }

  // Get the current location
  void _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        _currentPosition = position;
      });
      await _getCityAndCountry(position.latitude, position.longitude);
    } catch (e) {
      print("error common $e");
    }
  }

  // Get the city and country based on latitude and longitude
  Future<void> _getCityAndCountry(double lat, double long) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
      Placemark place = placemarks[0];
      setState(() {
        _currentCity = place.locality ?? 'Unknown';
        _currentCountry = place.country ?? 'Unknown';
      });
      controller.updateCity(_currentCity);
      controller.updateCountry(_currentCountry);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        if (_currentPosition != null) ...[
          Text(
            '$_currentCity',
            style: TextStyle(fontSize: 18),
          ),
          Text(","),
          SizedBox(
            width: 10,
          ),
          Text(
            '$_currentCountry',
            style: TextStyle(fontSize: 18),
          ),
        ] else
          CircularProgressIndicator(),
      ],
    );
  }
}

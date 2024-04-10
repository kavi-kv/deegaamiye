import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  String _currentCity = '';
  String _currentCountry = '';

  String get currentCountry => _currentCountry;
  String get currentCity => _currentCity;

  void updateCity(String newCity) {
    _currentCity = newCity;
    print(_currentCity);
  }

  void updateCountry(String newCountry) {
    _currentCountry = newCountry;
    print(_currentCountry);
  }
}

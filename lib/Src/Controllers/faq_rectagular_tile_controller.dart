import 'package:get/get.dart';

class FaqController extends GetxController {
  bool _displayEvents = true;
  bool _displayForeCasts = false;
  bool _displayFaqs = false;

  bool get displayEvents => _displayEvents;
  bool get displayForeCasts => _displayForeCasts;
  bool get displayFaqs => _displayFaqs;

  void setDisplayEvents() {
    _displayForeCasts = false;
    _displayFaqs = false;
    _displayEvents = true;
    update();
  }

  void setDisplayForeCasts() {
    _displayForeCasts = true;
    _displayFaqs = false;
    _displayEvents = false;
    update();
  }

  void setDisplayFaqs() {
    _displayForeCasts = false;
    _displayFaqs = true;
    _displayEvents = false;
    update();
  }
}

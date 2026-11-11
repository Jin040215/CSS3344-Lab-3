import 'package:flutter/material.dart';
import '../models/cruise_model.dart';

class CruiseViewModel extends ChangeNotifier {
  late CruiseModel _cruiseModel;

  int _starCount = 41;
  bool _isStarred = false;
  DateTime? _selectedDate;
  String _selectedPackage = 'Private River Cruise';
  bool _isDarkMode = false;

  CruiseViewModel() {
    _cruiseModel = CruiseModel(
      title: 'Rajang River Cruise',
      location: 'Sibu, Sarawak, Malaysia',
      description:
          'Sibu is the primary commercial hub and river port for Sarawak\'s Sibu Economic Zone. '
          'To promote eco-tourism and heritage along Malaysia\'s longest river, the Rajang River Cruise '
          'offers a breathtaking journey through lush tropical rainforests, traditional Iban longhouses, '
          'and historic riverfront landmarks. Experience local riverboat schedules, rich indigenous culture, '
          'and serene sunset views along the majestic Rajang River.',
      imageUrl:
          'https://images.unsplash.com/photo-1544551763-46a013bb70d5?q=80&w=1000&auto=format&fit=crop',
      initialRating: 41,
      availablePackages: [
        'Private River Cruise',
        'Sunset Cruise',
        'Sunrise Cruise',
        'Rural Cruise',
        'SMI Park Cruise',
      ],
    );
    _starCount = _cruiseModel.initialRating;
    _selectedPackage = _cruiseModel.availablePackages.first;
  }

  // Getters
  CruiseModel get cruiseModel => _cruiseModel;
  int get starCount => _starCount;
  bool get isStarred => _isStarred;
  DateTime? get selectedDate => _selectedDate;
  String get selectedPackage => _selectedPackage;
  bool get isDarkMode => _isDarkMode;
  List<String> get availablePackages => _cruiseModel.availablePackages;

  // Actions
  void toggleStar() {
    _isStarred = !_isStarred;
    if (_isStarred) {
      _starCount++;
    } else {
      _starCount--;
    }
    notifyListeners();
  }

  void selectDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  void selectPackage(String package) {
    if (_cruiseModel.availablePackages.contains(package)) {
      _selectedPackage = package;
      notifyListeners();
    }
  }

  void toggleDarkMode(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }
}

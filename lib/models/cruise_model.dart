class CruiseModel {
  final String title;
  final String location;
  final String description;
  final String imageUrl;
  final int initialRating;
  final List<String> availablePackages;

  CruiseModel({
    required this.title,
    required this.location,
    required this.description,
    required this.imageUrl,
    required this.initialRating,
    required this.availablePackages,
  });
}

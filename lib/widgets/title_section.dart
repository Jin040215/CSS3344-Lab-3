import 'package:flutter/material.dart';
import '../viewmodels/cruise_viewmodel.dart';

class TitleSection extends StatelessWidget {
  final CruiseViewModel viewModel;

  const TitleSection({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    viewModel.cruiseModel.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Text(
                  viewModel.cruiseModel.location,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => viewModel.toggleStar(),
            icon: Icon(
              viewModel.isStarred ? Icons.star : Icons.star_border,
              color: Colors.red[500],
            ),
            tooltip: 'Rate / Favorite',
          ),
          Text(
            '${viewModel.starCount}',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

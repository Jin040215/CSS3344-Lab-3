import 'package:flutter/material.dart';
import '../viewmodels/cruise_viewmodel.dart';
import '../widgets/image_section.dart';
import '../widgets/title_section.dart';
import '../widgets/button_section.dart';
import '../widgets/text_section.dart';
import '../widgets/preference_section.dart';

class CruiseDetailScreen extends StatelessWidget {
  final CruiseViewModel viewModel;

  const CruiseDetailScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rajang River Cruise Details'),
        centerTitle: true,
        elevation: 2,
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.landscape) {
            // Landscape layout: Split pane (Row)
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left Pane: Header Image Banner
                Expanded(
                  flex: 5,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ImageSection(imageUrl: viewModel.cruiseModel.imageUrl),
                      ],
                    ),
                  ),
                ),

                // Right Pane: Details & Controls
                Expanded(
                  flex: 6,
                  child: ListView(
                    padding: const EdgeInsets.only(bottom: 24),
                    children: [
                      TitleSection(viewModel: viewModel),
                      const ButtonSection(),
                      TextSection(description: viewModel.cruiseModel.description),
                      PreferenceSection(viewModel: viewModel),
                    ],
                  ),
                ),
              ],
            );
          } else {
            // Portrait layout: Single column (ListView)
            return ListView(
              padding: const EdgeInsets.only(bottom: 24),
              children: [
                ImageSection(imageUrl: viewModel.cruiseModel.imageUrl),
                TitleSection(viewModel: viewModel),
                const ButtonSection(),
                TextSection(description: viewModel.cruiseModel.description),
                PreferenceSection(viewModel: viewModel),
              ],
            );
          }
        },
      ),
    );
  }
}

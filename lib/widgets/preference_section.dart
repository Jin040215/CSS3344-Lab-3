import 'package:flutter/material.dart';
import '../viewmodels/cruise_viewmodel.dart';

class PreferenceSection extends StatelessWidget {
  final CruiseViewModel viewModel;

  const PreferenceSection({super.key, required this.viewModel});

  Future<void> _pickDate(BuildContext context) async {
    final DateTime initialDate = viewModel.selectedDate ?? DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      viewModel.selectDate(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate = viewModel.selectedDate != null
        ? "${viewModel.selectedDate!.year}-${viewModel.selectedDate!.month.toString().padLeft(2, '0')}-${viewModel.selectedDate!.day.toString().padLeft(2, '0')}"
        : "Tap to select visit date";

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).dividerColor.withValues(alpha: 0.3),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Interactive Settings & Booking',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 16),

          // 1. Visit Date Picker Tile
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.calendar_today, color: Colors.teal),
            title: const Text(
              'Visit Date Picker',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
            subtitle: Text(
              formattedDate,
              style: TextStyle(
                color: viewModel.selectedDate != null
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey,
                fontWeight: viewModel.selectedDate != null
                    ? FontWeight.w500
                    : FontWeight.normal,
              ),
            ),
            trailing: OutlinedButton.icon(
              onPressed: () => _pickDate(context),
              icon: const Icon(Icons.date_range, size: 18),
              label: const Text('Pick Date'),
            ),
          ),

          const Divider(height: 24),

          // 2. Cruise Package Selection (Dropdown)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(Icons.directions_boat, color: Colors.teal),
                  SizedBox(width: 12),
                  Text(
                    'Cruise Package',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                ],
              ),
              DropdownButton<String>(
                value: viewModel.selectedPackage,
                icon: const Icon(Icons.arrow_drop_down),
                elevation: 16,
                underline: Container(
                  height: 2,
                  color: Theme.of(context).colorScheme.primary,
                ),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    viewModel.selectPackage(newValue);
                  }
                },
                items: viewModel.availablePackages
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),

          const Divider(height: 24),

          // 3. Dark Mode Theme Switch
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            secondary: Icon(
              viewModel.isDarkMode ? Icons.dark_mode : Icons.light_mode,
              color: viewModel.isDarkMode ? Colors.amber : Colors.orange,
            ),
            title: const Text(
              'Dark Mode Theme',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
            subtitle: Text(
              viewModel.isDarkMode ? 'Dark Theme Active' : 'Light Theme Active',
              style: const TextStyle(fontSize: 12),
            ),
            value: viewModel.isDarkMode,
            onChanged: (bool value) {
              viewModel.toggleDarkMode(value);
            },
          ),
        ],
      ),
    ),
    );
  }
}

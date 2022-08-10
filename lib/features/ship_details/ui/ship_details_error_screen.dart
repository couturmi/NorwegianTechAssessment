import 'package:flutter/material.dart';
import 'package:norwegian_tech_assessment/features/ship_details/provider/ship_details_view_model.dart';
import 'package:norwegian_tech_assessment/shared/app_strings.dart';
import 'package:provider/provider.dart';

class ShipDetailsErrorScreen extends StatelessWidget {
  const ShipDetailsErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(AppStrings.shipDetailsErrorTitle,
              style: theme.textTheme.headline3
                  ?.copyWith(color: theme.primaryColor)),
          const SizedBox(height: 8),
          Text(AppStrings.shipDetailsErrorMessage,
              style: theme.textTheme.subtitle1, textAlign: TextAlign.center),
          const SizedBox(height: 24),
          Row(
            children: [
              const Spacer(),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Attempt to retrieve the ship details again.
                    context.read<ShipDetailsViewModel>().retrieveShipDetails();
                  },
                  child: const Text(AppStrings.shipDetailsErrorRetryButton),
                ),
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}

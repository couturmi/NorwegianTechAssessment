import 'package:flutter/material.dart';
import 'package:norwegian_tech_assessment/features/ship_details/provider/ship_details_view_model.dart';
import 'package:norwegian_tech_assessment/features/ship_details/ui/ship_details_error_screen.dart';
import 'package:norwegian_tech_assessment/features/ship_details/ui/ship_details_screen.dart';
import 'package:provider/provider.dart';

/// Presenter class is responsible for handling different states.
class ShipDetailsPresenter extends StatefulWidget {
  const ShipDetailsPresenter({Key? key}) : super(key: key);

  @override
  State<ShipDetailsPresenter> createState() => _ShipDetailsPresenterState();
}

class _ShipDetailsPresenterState extends State<ShipDetailsPresenter> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Load the ship details immediately.
      context.read<ShipDetailsViewModel>().retrieveShipDetails();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ShipDetailsViewModel>(
      builder: (context, viewModel, _) {
        if (viewModel.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (viewModel.hasErrors) {
          return const ShipDetailsErrorScreen();
        } else {
          return ShipDetailsScreen(shipDetails: viewModel.shipDetails!);
        }
      },
    );
  }
}

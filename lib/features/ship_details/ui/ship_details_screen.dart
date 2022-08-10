import 'package:flutter/material.dart';
import 'package:norwegian_tech_assessment/features/ship_details/data/ship_details.dart';
import 'package:norwegian_tech_assessment/shared/app_strings.dart';
import 'package:norwegian_tech_assessment/shared/asset_constants.dart';

/// Screen is responsible for displaying content.
class ShipDetailsScreen extends StatelessWidget {
  final ShipDetails shipDetails;

  const ShipDetailsScreen({required this.shipDetails, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      color: Colors.lightBlue[200],
      child: Stack(
        children: [
          // Set wave image in background.
          Positioned.fill(
            child: Image.asset(
              AssetConstants.wavesBorderPath,
              fit: BoxFit.fitWidth,
              alignment: Alignment.bottomLeft,
            ),
          ),
          Column(
            children: [
              _headerImage(context),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 24.0),
                      child: Text(
                        shipDetails.shipName,
                        style: theme.textTheme.headline3?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    _detailRow(
                        "${AppStrings.shipDetailsInauguralDateLabel} ${shipDetails.inauguralDate}",
                        context),
                    _detailRow(
                        "${AppStrings.shipDetailsCapacityLabel} ${shipDetails.passengerCapacity}",
                        context),
                    _detailRow(
                        "${AppStrings.shipDetailsCrewLabel} ${shipDetails.crewCount}",
                        context),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
                      child: Text(
                        AppStrings.shipDetailsHighlightsTitle,
                        style: theme.textTheme.headline5,
                      ),
                    ),
                    ...shipDetails.highlights
                        .map((highlight) => _bulletedRow(highlight))
                        .toList(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Displays the ships image as the page header.
  Widget _headerImage(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 150,
      child: Image.network(
        shipDetails.imagePath,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return Container(
            color: Colors.grey[300],
            constraints: const BoxConstraints.expand(),
            child: Center(
              child: CircularProgressIndicator(
                  value: progress.expectedTotalBytes != null
                      ? progress.cumulativeBytesLoaded /
                          progress.expectedTotalBytes!
                      : null),
            ),
          );
        },
        errorBuilder: (context, _, __) {
          return Container(
            color: Colors.grey[300],
            constraints: const BoxConstraints.expand(),
            child: Center(
                child: Text(
              AppStrings.imageLoadError,
              style: Theme.of(context).textTheme.caption,
            )),
          );
        },
      ),
    );
  }

  Widget _detailRow(String text, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(text,
          style: Theme.of(context)
              .textTheme
              .subtitle1
              ?.copyWith(fontWeight: FontWeight.bold)),
    );
  }

  Widget _bulletedRow(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text("\u2022 $text"),
    );
  }
}

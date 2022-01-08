import 'package:flutter/material.dart';

class LocationAppBar extends StatelessWidget {
  final String stationName;

  const LocationAppBar({
    Key? key,
    required this.stationName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // Make children pack at center
        children: [
          Icon(
            Icons.place_rounded,
            color: Theme.of(context).textTheme.headline6!.color,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              stationName,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Icon(
            Icons.arrow_drop_down_rounded,
            color: Theme.of(context).textTheme.headline6!.color,
          ),
        ],
      ),
    );
  }
}

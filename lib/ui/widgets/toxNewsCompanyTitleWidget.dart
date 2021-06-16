import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'fla_widet.dart';

class ToxNewsCompanyTitleWidget extends StatelessWidget {
  const ToxNewsCompanyTitleWidget({
    required this.name,
    required this.country,
    required this.city,
  });
  final String name;
  final String country;
  final String city;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(name.toUpperCase(),
          style: TextStyle(color: Theme.of(context).primaryColor , fontSize: 18),
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        SizedBox(width: 10,),
        Icon(Icons.location_on_outlined, color: Theme.of(context).primaryColor,),
        SizedBox(width: 5,),
        FlagWidet(country),
        SizedBox(width: 2.5,),
        Text(city,
          style: TextStyle(color: Theme.of(context).primaryColor , fontSize: 14),
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ],
    );
  }
}
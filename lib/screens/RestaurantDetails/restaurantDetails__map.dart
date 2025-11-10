import 'package:flutter/material.dart';
import 'package:restaurants/constants/contansts.dart';

class RestaurantdetailMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.width * 0.05,
      ),
      color: fifthColor,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.30,
    );
  }
}

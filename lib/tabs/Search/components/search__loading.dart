import 'package:flutter/material.dart';
import 'package:restaurants/constants/contansts.dart';

class LoadingSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.40,
      ),
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: fourthColor,
          strokeWidth: 4,
        ),
      ),
    );
  }
}

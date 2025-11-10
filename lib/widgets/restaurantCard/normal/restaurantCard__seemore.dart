import 'package:flutter/material.dart';
import 'package:restaurants/constants/contansts.dart';

class RestaurantCardSeeMore extends StatelessWidget {
  final Function? goRestaurantDetails;
  final bool? selected;
  const RestaurantCardSeeMore({
    Key? key,
    this.goRestaurantDetails,
    this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalWidth = MediaQuery.of(context).size.width;
    return Container(
      width: totalWidth,
      child: Align(
        alignment: Alignment.bottomRight,
        child: MaterialButton(
          padding: EdgeInsets.zero,
          onPressed: () => goRestaurantDetails!(),
          color: selected!
              ? Theme.of(context).primaryColorLight
              : fourthColor,
          elevation: 0,
          child: Text(
            'See more',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: selected!
                      ? fourthColor
                      : Theme.of(context).primaryColorLight,
                  fontWeight: FontWeight.w500,
                ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}

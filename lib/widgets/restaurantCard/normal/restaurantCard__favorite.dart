import 'package:flutter/material.dart';
// import 'package:restaurants/interfaces/Restaurants.dart';
import 'package:restaurants/widgets/Button_roundWithIcon.dart';
import 'package:restaurants/constants/contansts.dart';

class RestaurantCardFavorite extends StatelessWidget {
  final Function? addToFavorites;
  final bool? selected;
  final bool? favorite;
  const RestaurantCardFavorite({
    Key? key,
    this.addToFavorites,
    this.selected,
    this.favorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalWidth = MediaQuery.of(context).size.width;
    return Container(
      width: totalWidth * 0.12,
      child: CircleIconButton(
        icon: Icons.favorite,
        color: selected! && favorite!
            ? fourthColor
            : favorite!
                ? fourthColor
                : Theme.of(context).primaryColorLight,
        bgColor: selected! && favorite!
            ? Theme.of(context).primaryColorLight
            : favorite!
                ? Theme.of(context).primaryColorLight
                : fourthColor,
        // trigger: selected! ? null : addToFavorites,
        trigger: () => addToFavorites!(),
      ),
    );
  }
}

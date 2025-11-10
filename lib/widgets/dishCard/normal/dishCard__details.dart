import 'package:flutter/material.dart';
import 'package:restaurants/interfaces/Dishes.dart';
import 'package:restaurants/widgets/Card__CustomChip.dart';
import 'package:restaurants/constants/contansts.dart';

class DishCardDetails extends StatelessWidget {
  final Dishes? dish;
  final Function? addToCar;
  const DishCardDetails({
    Key? key,
    this.dish,
    this.addToCar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 90,
        margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.04,
        ),
        child: Stack(
          children: <Widget>[
            Container(
              child: Text(
                dish!.name!,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColorDark,
                    ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.width * 0.015,
                ),
                child: Text(
                  dish!.details!.substring(0, 80) + '...',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.03,
                ),
                child: Row(
                  children: <Widget>[
                    CustomChip(
                      text: '${dish!.rating} Votes',
                      textColor: Theme.of(context).primaryColorDark,
                      textSize: 12,
                      icon: Icons.star,
                      iconColor: fourthColor,
                      iconSize: 16,
                    ),
                    Spacer(),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () => addToCar!(dish!),
                        splashColor: fourthColor,
                        child: CustomChip(
                          text: '\$${dish!.price!.toInt()}', //\$
                          textColor: Theme.of(context).primaryColorDark,
                          textSize: 12,
                          icon: Icons.add_shopping_cart,
                          iconColor: fourthColor,
                          iconSize: 16,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

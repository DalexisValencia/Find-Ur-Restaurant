import 'package:restaurants/blocs/bloc/cart/bloc/cart_bloc.dart';
import 'package:restaurants/blocs/bloc/discovery/bloc/discovery_bloc.dart';
import 'package:restaurants/blocs/bloc/favorites/bloc/favorites_bloc.dart';
import 'package:restaurants/blocs/bloc/search/bloc/search_bloc.dart';
import 'package:restaurants/tabs/Bookings/bookings.dart';
import 'package:restaurants/tabs/Cart/cart.dart';
import 'package:restaurants/tabs/Favorites/favorites.dart';
import 'package:restaurants/tabs/Home/home.dart';
import 'package:restaurants/tabs/TabsNavigation/tabs__bottomNavigationBar.dart';
import 'package:restaurants/tabs/Search/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainTabsWrapper extends StatefulWidget {
  @override
  _MainTabsWrapperState createState() => _MainTabsWrapperState();
}

class _MainTabsWrapperState extends State<MainTabsWrapper>
    with TickerProviderStateMixin {
  // late CartBloc cartBloc;
  // late FavoritesBloc favoriteBloc;
  int tabsIndex = 0;

  void goToTab(int tab) {
    setState(() {
      tabsIndex = tab;
    });
  }

  @override
  void initState() {
    // cartBloc = BlocProvider.of<CartBloc>(context);
    // favoriteBloc = BlocProvider.of<FavoritesBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
        /* MultiBlocProvider(
      providers: [
        BlocProvider<DiscoveryBloc>(
          create: (BuildContext context) => DiscoveryBloc(),
        ),
        BlocProvider<CartBloc>(
          create: (BuildContext context) => cartBloc,
        ),
        BlocProvider<FavoritesBloc>(
          create: (BuildContext context) => favoriteBloc,
        )
      ],
      child: */
        Scaffold(
      body: <Widget>[
        HomePage(
          animateScreen: true,
        ),
        ScaffoldSearch(
          from: 'tabs',
        ),
        /* BlocProvider(
            create: (BuildContext context) => SearchBloc()
              ..add(
                SearchInit(findIn: 'all'),
              ),
            child: ScaffoldSearch(
              from: 'tabs',
            ),
          ),*/
        BookingsScreen(),
        FavoritesScreen(
          from: 'tabs',
        ),
        ScreenCart(),
      ][tabsIndex],
      bottomNavigationBar: NavigationBar(
        // labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        onDestinationSelected: (int index) {
          goToTab(index);
        },
        backgroundColor: Colors.white,
        indicatorColor: const Color.fromARGB(0, 168, 20, 20),
        selectedIndex: tabsIndex,
        destinations: <Widget>[
          const NavigationDestination(
            selectedIcon: Icon(Icons.home_filled),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          const NavigationDestination(
            selectedIcon: Icon(Icons.restaurant),
            icon: Icon(Icons.restaurant_outlined),
            label: 'Delicious',
          ),
          const NavigationDestination(
            selectedIcon: Icon(Icons.class_),
            icon: Icon(Icons.class_outlined),
            label: 'Bookings',
          ),
          const NavigationDestination(
            selectedIcon: Icon(Icons.favorite),
            icon: Icon(Icons.favorite_outline),
            label: 'Favs',
          ),
          const NavigationDestination(
            selectedIcon: Icon(Icons.shopping_cart),
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
        ],
      ),
    );
    // );
  }
}

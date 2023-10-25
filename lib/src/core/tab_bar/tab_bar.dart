import 'package:flutter/material.dart';
import 'package:hermes/src/ui/favorites_list.dart';
import 'package:hermes/src/ui/news_list.dart';
import 'package:hermes/src/ui/stocks_list.dart';

class HermesTabBar extends StatelessWidget {
  const HermesTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          bottomNavigationBar: bottomMenu(),
          body: const TabBarView(
            children: [
              NewsList(),
              StokcsList(),
              FavoritesList(),
            ],
          ),
        ));
  }

  Widget bottomMenu() {
    return const TabBar(tabs: [
      Tab(
        icon: Icon(Icons.newspaper),
        text: 'News',
      ),
      Tab(
        icon: Icon(Icons.attach_money),
        text: 'Stocks',
      ),
      Tab(
        icon: Icon(Icons.star),
        text: 'Companies',
      )
    ]);
  }
}

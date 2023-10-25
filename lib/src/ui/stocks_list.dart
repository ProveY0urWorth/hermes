import 'package:flutter/material.dart';
import 'package:hermes/src/blocs/stocks_bloc.dart';
import 'package:hermes/src/core/styles/text_styles.dart';
import 'package:hermes/src/models/stock_item_model.dart';
import 'package:hermes/src/ui/components/search_bar.dart';
import 'package:hermes/src/ui/components/stock_component.dart';

class StokcsList extends StatelessWidget {
  const StokcsList({super.key});

  @override
  Widget build(BuildContext context) {
    stocksBloc.fetchStoksList();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search'),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(
                      context: context, delegate: HermesSearchBarDelegate());
                },
                icon: const Icon(Icons.search))
          ],
        ),
        body: RefreshIndicator(
          child: StreamBuilder(
            stream: stocksBloc.stocks,
            builder: (context, AsyncSnapshot<List<StockItemModel>> snapshot) {
              if (snapshot.hasData) {
                return buildList(snapshot, stocksBloc.names);
              } else if (snapshot.hasError) {
                return Text(
                  snapshot.error.toString(),
                  style: TextStyler.error,
                );
              } else if (!snapshot.hasData) {
                return const Center(
                  child: Text(
                    'No following stocks found !',
                    style: TextStyler.bold,
                  ),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
          onRefresh: () async {
            stocksBloc.fetchStoksList();
          },
        ));
  }

  Widget buildList(
      AsyncSnapshot<List<StockItemModel>> snapshot, List<String> names) {
    return ListView.builder(
        itemCount: snapshot.data!.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          var currentElement = snapshot.data?[index];
          return StockComponent(
              symbol: names[index],
              percentChange: currentElement!.percentChange,
              highPrice: currentElement.highPrice,
              lowPrice: currentElement.lowPrice,
              openPrice: currentElement.openPrice,
              previousClosePrice: currentElement.previousClosePrice,
              dateTime: currentElement.time);
        });
  }
}

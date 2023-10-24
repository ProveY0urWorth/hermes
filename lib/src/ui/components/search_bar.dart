import 'package:flutter/material.dart';
import 'package:hermes/src/blocs/search_bloc.dart';
import 'package:hermes/src/core/styles/text_styles.dart';
import 'package:hermes/src/models/symbol_lookup_item_model.dart';
import 'package:hermes/src/models/symbol_lookup_responde_model.dart';
import 'package:hermes/src/ui/company_data.dart';

class HermesSearchBarDelegate extends SearchDelegate {
  SymbolLookupItemModel resultData = SymbolLookupItemModel(
      description: '', displaySymbol: '', symbol: '', type: '');

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            onPressed: () {
              if (query.isEmpty) {
                close(context, null);
              } else {
                query = '';
              }
            },
            icon: const Icon(Icons.clear))
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back));

  @override
  Widget buildResults(BuildContext context) => Center(
        child: CompanyData(dataModel: resultData),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    searchBloc.fetchSearchResults(query).timeout(const Duration(seconds: 5));
    if (query.isNotEmpty) {
      return StreamBuilder(
          stream: searchBloc.search,
          builder:
              (context, AsyncSnapshot<SymbolLookupRespondeModel> snapshot) {
            if (snapshot.hasData) {
              List<SymbolLookupItemModel> resultsList = snapshot.data!.results;
              int count = snapshot.data!.count;
              return ListView.builder(
                itemCount: count,
                itemBuilder: (context, index) {
                  final result = resultsList[index];
                  return ListTile(
                    title: Text(
                      'Symbol: ${result.symbol} Description: ${result.description} ${result.type}',
                      style: TextStyler.regular,
                    ),
                    onTap: () {
                      resultData = SymbolLookupItemModel(
                          description: result.description,
                          displaySymbol: result.displaySymbol,
                          symbol: result.symbol,
                          type: result.type);
                      showResults(context);
                    },
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text(
                snapshot.error.toString(),
                style: TextStyler.error,
              );
            }
            return const Center(child: CircularProgressIndicator());
          });
    } else {
      return Container();
    }
  }
}

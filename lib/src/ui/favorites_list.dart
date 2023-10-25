import 'package:flutter/material.dart';
import 'package:hermes/src/blocs/favorites_bloc.dart';
import 'package:hermes/src/core/styles/text_styles.dart';
import 'package:hermes/src/models/company_info_model.dart';
import 'package:hermes/src/ui/components/company_list_component.dart';
import 'package:hermes/src/ui/components/search_bar.dart';

class FavoritesList extends StatelessWidget {
  const FavoritesList({super.key});

  @override
  Widget build(BuildContext context) {
    favoritesBloc.fetchCompaniesList();

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
      body: StreamBuilder(
        stream: favoritesBloc.favorites,
        builder: (context, AsyncSnapshot<List<CompanyInfoModel>> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(
              snapshot.error.toString(),
              style: TextStyler.error,
            );
          } else if (!snapshot.hasData) {
            return const Center(
              child: Text(
                'No following companies found !',
                style: TextStyler.bold,
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<List<CompanyInfoModel>> snapshot) {
    return ListView.builder(
        itemCount: snapshot.data?.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          var currentElement = snapshot.data?[index];

          return CompanyListComponent(
            name: currentElement!.name,
            industry: currentElement.finnhubIndustry,
            logo: currentElement.logo,
            ticker: currentElement.ticker,
            website: currentElement.weburl,
          );
        });
  }
}

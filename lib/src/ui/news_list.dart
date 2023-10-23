import 'package:flutter/material.dart';
import 'package:hermes/src/blocs/news_bloc.dart';
import 'package:hermes/src/core/enums/finhub_enums.dart';
import 'package:hermes/src/core/styles/text_styles.dart';
import 'package:hermes/src/models/market_news_response_model.dart';
import 'package:hermes/src/ui/components/news_list_component.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key});

  @override
  Widget build(BuildContext context) {
    newsBloc.fetchGeneralNews();
    return Scaffold(
      appBar: newsAppBar(),
      body: StreamBuilder(
        stream: newsBloc.news,
        builder: (context, AsyncSnapshot<MarketNewsResponseModel> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(
              snapshot.error.toString(),
              style: TextStyler.error,
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  AppBar newsAppBar() {
    return AppBar(
      title: const Text('News'),
      actions: [
        PopupMenuButton<String>(
          icon: const Icon(Icons.filter_list),
          onSelected: (String result) {
            switch (result) {
              case 'general':
                newsBloc.fetchGeneralNews();
                break;
              case 'crypto':
                newsBloc.fetchCryptoNews();
                break;
              case 'forex':
                newsBloc.fetchForexNews();
                break;
              case 'merger':
                newsBloc.fetchMergerNews();
                break;
              default:
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            PopupMenuItem<String>(
              value: NewsType.general.stringType,
              child: const Text('General News'),
            ),
            PopupMenuItem<String>(
              value: NewsType.crypto.stringType,
              child: const Text('Crypto News'),
            ),
            PopupMenuItem<String>(
              value: NewsType.forex.stringType,
              child: const Text('Forex News'),
            ),
            PopupMenuItem<String>(
              value: NewsType.merger.stringType,
              child: const Text('Merger News'),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildList(AsyncSnapshot<MarketNewsResponseModel> snapshot) {
    return ListView.builder(
        itemCount: snapshot.data?.totalResults,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          var currentElement = snapshot.data?.results[index];
          return NewsListComponent(
              headline: currentElement!.headline,
              image: currentElement.image,
              source: currentElement.source,
              category: currentElement.category,
              summary: currentElement.summary,
              arcticleUrl: currentElement.articleUrl,
              date: currentElement.date);
        });
  }
}

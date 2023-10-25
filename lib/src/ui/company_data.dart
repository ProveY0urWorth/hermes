import 'package:flutter/material.dart';
import 'package:hermes/src/blocs/company_data_bloc.dart';
import 'package:hermes/src/blocs/stocks_bloc.dart';
import 'package:hermes/src/core/styles/text_styles.dart';
import 'package:hermes/src/models/company_info_model.dart';
import 'package:hermes/src/models/market_news_response_model.dart';
import 'package:hermes/src/models/symbol_lookup_item_model.dart';
import 'package:hermes/src/ui/components/news_list_component.dart';
import 'package:hermes/src/ui/simple_components/link_component.dart';
import 'package:hermes/src/ui/simple_components/network_asset_svg.dart';
import 'package:hermes/src/ui/simple_components/text_with_label.dart';

class CompanyData extends StatelessWidget {
  const CompanyData({super.key, required this.dataModel});

  final SymbolLookupItemModel dataModel;

  @override
  Widget build(BuildContext context) {
    companyDataBloc.fetchCompanyData(dataModel.symbol);
    companyDataBloc.fetchCompanyNews(dataModel.symbol);
    return StreamBuilder(
      stream: companyDataBloc.companyData,
      builder: (context, AsyncSnapshot<CompanyInfoModel> snapshot) {
        if (snapshot.hasData) {
          return buildData(snapshot);
        } else if (snapshot.hasError) {
          return Text(
            snapshot.error.toString(),
            style: TextStyler.error,
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget buildData(AsyncSnapshot<CompanyInfoModel> snapshot) {
    var data = snapshot.data;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: StreamBuilder(
        stream: companyDataBloc.companyNews,
        builder: (context, AsyncSnapshot<MarketNewsResponseModel> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot, data);
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

  Widget buildList(AsyncSnapshot<MarketNewsResponseModel> snapshot, data) {
    return ListView.builder(
        itemCount: snapshot.data?.totalResults,
        //physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          var currentElement = snapshot.data?.results[index];
          if (index == 0) {
            return Column(children: [
              Column(
                children: [
                  NetworkSVGAsset(
                    imageUrl: data!.logo,
                  ),
                  Wrap(
                    runSpacing: 10,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            data.name,
                            textAlign: TextAlign.start,
                            style: TextStyler.largeBold,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextWithLabel(label: 'Country: ', text: data.country),
                          const SizedBox(
                            height: 5,
                          ),
                          TextWithLabel(
                              label: 'Category: ', text: data.finnhubIndustry),
                          const SizedBox(
                            height: 5,
                          ),
                          TextWithLabel(
                              label: 'Currency: ', text: data.currency),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextWithLabel(label: 'Phone: ', text: data.phone),
                          LinkComponent(webUrl: data.weburl, title: 'Website'),
                        ],
                      ),
                      StreamBuilder<bool>(
                          stream: companyDataBloc.isLiked,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return IconButton(
                                  onPressed: () {
                                    if (snapshot.data == true) {
                                      stocksBloc
                                          .removeStockFromDB(dataModel.symbol);

                                      companyDataBloc.changeIsLiked();
                                    } else {
                                      stocksBloc.addStockToDB(dataModel);
                                      companyDataBloc.changeIsLiked();
                                    }
                                  },
                                  icon: Icon(
                                    Icons.favorite,
                                    color: snapshot.data == true
                                        ? Colors.cyan
                                        : Colors.white,
                                  ));
                            } else {
                              return Container();
                            }
                          }),
                    ],
                  ),
                ],
              ),
              NewsListComponent(
                  headline: currentElement!.headline,
                  image: currentElement.image,
                  source: currentElement.source,
                  category: currentElement.category,
                  summary: currentElement.summary,
                  arcticleUrl: currentElement.articleUrl,
                  date: currentElement.date)
            ]);
          }
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

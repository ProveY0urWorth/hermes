import 'package:flutter/material.dart';
import 'package:hermes/src/blocs/company_data_bloc.dart';
import 'package:hermes/src/blocs/stocks_bloc.dart';
import 'package:hermes/src/core/styles/text_styles.dart';
import 'package:hermes/src/models/company_info_model.dart';
import 'package:hermes/src/models/symbol_lookup_item_model.dart';
import 'package:hermes/src/ui/simple_components/link_component.dart';
import 'package:hermes/src/ui/simple_components/network_asset_svg.dart';
import 'package:hermes/src/ui/simple_components/text_with_label.dart';

class CompanyData extends StatelessWidget {
  const CompanyData({super.key, required this.dataModel});

  final SymbolLookupItemModel dataModel;

  @override
  Widget build(BuildContext context) {
    companyDataBloc.fetchCompanyData(dataModel.symbol);
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
      child: Column(
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
                  Text(
                    data.currency,
                    style: TextStyler.regular,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LinkComponent(webUrl: data.weburl, title: 'Source'),
                  Text(
                    data.phone,
                    style: TextStyler.large,
                  ),
                ],
              ),
              StreamBuilder<bool>(
                  stream: companyDataBloc.isLiked,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return IconButton(
                          onPressed: () {
                            if (snapshot.data == true) {
                              stocksBloc.removeStockFromDB(dataModel.symbol);

                              companyDataBloc.changeIsLiked();
                            } else {
                              stocksBloc.addStockToDB(dataModel);
                              companyDataBloc.changeIsLiked();
                            }
                          },
                          icon: Icon(
                            Icons.favorite,
                            color: snapshot.data == true
                                ? Colors.redAccent
                                : Colors.white,
                          ));
                    } else {
                      return Container();
                    }
                  }),
            ],
          )
        ],
      ),
    );
  }

  Widget buildTabBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(10),
        ),
      ),
    );
  }
}

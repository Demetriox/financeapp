import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:talentscode/constants/responsive_helper.dart';
import 'package:talentscode/models/stock_model.dart';
import 'package:talentscode/services/stock_api.dart';
import 'package:talentscode/ui/widgets/charts_close.dart';

class LastTenDaysScreen extends StatefulWidget {
  const LastTenDaysScreen({Key? key}) : super(key: key);

  @override
  _LastTenDaysScreenState createState() => _LastTenDaysScreenState();
}

class _LastTenDaysScreenState extends State<LastTenDaysScreen> {
  @override
  Widget build(BuildContext context) {
    final nameStock = ModalRoute.of(context)?.settings.arguments;
    var query = ApiStocks();
    String newName = nameStock.toString().replaceAll('%5E', '^');
    final List<TimeSeriesSales> data = [];

    return Scaffold(
      appBar: AppBar(
        title: Text(newName),
        toolbarHeight: 120, // Set this height
        flexibleSpace: Container(
          color: Colors.orange,
          child: Column(
            children: [
              Text('Trading'),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: ResponsiveSize(context).heightResp(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            FutureBuilder(
                future: query.stockInfo(nameStock.toString()),
                builder: (BuildContext context,
                    AsyncSnapshot<Map<String, StockDays>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return const Text('Error');
                    } else if (snapshot.hasData) {
                      int i = snapshot.data![newName]!.close!.length;

                      for (int j = 0; j < i - 1; j++) {
                        data.add(TimeSeriesSales(
                            DateTime.fromMillisecondsSinceEpoch(
                                snapshot.data![newName]!.timestamp![j] * 1000),
                            snapshot.data![newName]!.close![j]));
                      }

                      if (i > 10) {
                        return Column(
                          children: [
                            ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [Text(newName)],
                              ),
                            ),
                            Text(
                              DateTime.fromMillisecondsSinceEpoch(
                                      snapshot.data![newName]!.timestamp![0] *
                                          1000)
                                  .toString(),
                            ),
                            Text(
                              "Valor Inicial: " +
                                  snapshot.data![newName]!.close![0].toString(),
                            ),
                            Text(
                              "Valor Final : " +
                                  snapshot.data![newName]!.close![10 - 1]
                                      .toString(),
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width,
                                height: ResponsiveSize(context).heightResp(30),
                                child: TimeSeriesRangeAnnotationChart
                                    .withSampleData(data)),
                          ],
                        );
                      } else {
                        return Column(
                          children: [
                            ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [Text(newName)],
                              ),
                            ),
                            Text(
                              DateTime.fromMillisecondsSinceEpoch(
                                      snapshot.data![newName]!.timestamp![0] *
                                          1000)
                                  .toString(),
                            ),
                            Text(
                              "Valor Inicial : " +
                                  snapshot.data![newName]!.close![0].toString(),
                            ),
                            Text(
                              "Valor Final : " +
                                  snapshot.data![newName]!.close![i - 1]
                                      .toString(),
                            ),
                          ],
                        );
                      }
                    } else {
                      return const Text('Empty data');
                    }
                  } else {
                    return Text('State: ${snapshot.connectionState}');
                  }
                }),
          ],
        ),
      ),
    );
  }
}

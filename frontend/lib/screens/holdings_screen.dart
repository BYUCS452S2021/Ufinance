import 'package:flutter/material.dart';
import 'package:frontend/data_models/holding.dart';
import 'package:frontend/data_models/user.dart';
import 'package:openapi/api.dart';

class HoldingsScreen extends StatefulWidget {
  final User currUser;
  HoldingsScreen({Key key, @required this.currUser}) : super(key: key);
  // HoldingsScreen({Key key, this.title}) : super(key: key);
  // final String title;

  @override
  _HoldingScreen createState() => _HoldingScreen(currUser);
}

class _HoldingScreen extends State<HoldingsScreen> {
  TextEditingController editingController = TextEditingController();

  //This should be replaced with the list of holdings that the user will have.
  final duplicateItems = List<String>.generate(10000, (i) => "Item $i");
  List<String> items = [];
  User _currUser;

  _HoldingScreen(User currUser) {
    this._currUser = currUser;
  }

  @override
  void initState() {
    items.addAll(duplicateItems);
    super.initState();
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = [];
    dummySearchList.addAll(duplicateItems);
    if (query.isNotEmpty) {
      List<String> dummyListData = [];
      dummySearchList.forEach((item) {
        if (item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicateItems);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print(_currUser.emailAddress);
    return new Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                onChanged: (value) {
                  filterSearchResults(value);
                },
                controller: editingController,
                decoration: InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            Expanded(
                child: FutureBuilder(
                    future: fetchHoldings(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                    padding:
                                        EdgeInsets.fromLTRB(40.0, 0, 40.0, 0),
                                    height: 80.0,
                                    child: Center(
                                        child: ListTile(
                                            leading: Text(
                                              '${snapshot.data[index].ticker}          ',
                                              style: TextStyle(
                                                  fontSize: 30.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            title: Text(
                                                '${snapshot.data[index].price} per share',
                                                style:
                                                    TextStyle(fontSize: 20.0)),
                                            trailing: Text(
                                              "Shares owned: ${snapshot.data[index].numShares}",
                                              style: TextStyle(fontSize: 20.0),
                                            )))),
                                Divider(color: Colors.black)
                              ],
                            );
                          },
                        );
                      } else {
                        return Center(child: LinearProgressIndicator());
                      }
                    })),
          ],
        ),
      ),
    );
  }

  Future<List<Holding>> fetchHoldings() async {
    List<Holding> myHoldings = [];
    final apiInstance = UsersApi();

    try {
      final result =
          apiInstance.usersUserIdHoldingsGet(_currUser.userId, _currUser.token);
      var response = await result;

      for (int i = 0; i < response.holdings.length; ++i) {
        var priceData = await fetchStockPrice(response.holdings[i].stockTicker);
        myHoldings.add(Holding(
            ticker: response.holdings[i].stockTicker,
            numShares: response.holdings[i].numberOfShares,
            price: priceData));
      }
      return myHoldings;
    } catch (e) {
      print(
          'Exception when calling UsersApi->apiInstance.usersUserIdHoldingsGet(): $e\n');
      return null;
    }
  }

  Future<String> fetchStockPrice(String stockTicker) async {
    final stockApi = StockStatisticsApi();

    try {
      final result = stockApi.stockStatisticsStockTickerGet(stockTicker);
      var response = await result;
      return response.currentPrice;
    } catch (e) {
      print(
          'Exception when calling StockStatisticsApi->stockApi.getStatStockTickerGet(): $e\n');
      return null;
    }
  }
}

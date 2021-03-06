import 'package:flutter/material.dart';
import 'package:frontend/components/rounded_button.dart';
import 'package:frontend/data/server_proxy.dart';
import 'package:frontend/data_models/holding.dart';
import 'package:frontend/data_models/user.dart';
import 'package:frontend/data_models/user_info.dart';
import 'package:openapi/api.dart';

class HoldingsScreen extends StatefulWidget {
  // HoldingsScreen({Key key, this.title}) : super(key: key);
  // final String title;

  @override
  _HoldingScreen createState() => _HoldingScreen();
}

class _HoldingScreen extends State<HoldingsScreen> {
  TextEditingController editingController = TextEditingController();

  //This should be replaced with the list of holdings that the user will have.
  final duplicateItems = List<String>.generate(10000, (i) => "Item $i");
  List<String> items = [];
  UserInfo _currUser;
  Future<List<Holding>> _futureHoldings;

  _HoldingScreen() {
    this._currUser = ActiveUser().getUserInfo();
  }

  @override
  void initState() {
    items.addAll(duplicateItems);
    super.initState();
    _futureHoldings = fetchHoldings();
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
            Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Row(
                  children: [
                    Text('Name'),
                    Spacer(),
                    Text('Price per share'),
                    Spacer(),
                    Text('My shares'),
                  ],
                )),
            Divider(thickness: 2, color: Colors.black),
            Expanded(
                child: FutureBuilder(
                    future: _futureHoldings,
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
                                        EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
                                    height: 80.0,
                                    child: Center(
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                          Text(
                                            '${snapshot.data[index].ticker}          ',
                                            style: TextStyle(
                                                fontSize: 30.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            width: 160,
                                            child: Text(
                                                '\$${snapshot.data[index].price}',
                                                style:
                                                    TextStyle(fontSize: 20.0)),
                                          ),
                                          Container(
                                              child: Row(children: [
                                            Text(
                                              "${snapshot.data[index].numShares}",
                                              style: TextStyle(fontSize: 20.0),
                                            ),
                                            SizedBox(width: 15),
                                            Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          _futureHoldings =
                                                              updateHolding(
                                                                  'buy',
                                                                  snapshot
                                                                      .data[
                                                                          index]
                                                                      .ticker,
                                                                  snapshot
                                                                      .data[
                                                                          index]
                                                                      .numShares);
                                                        });
                                                      },
                                                      child: const Text('Buy',
                                                          style: TextStyle(
                                                              fontSize: 12.0))),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          _futureHoldings =
                                                              updateHolding(
                                                                  'sell',
                                                                  snapshot
                                                                      .data[
                                                                          index]
                                                                      .ticker,
                                                                  snapshot
                                                                      .data[
                                                                          index]
                                                                      .numShares);
                                                        });
                                                      },
                                                      child: const Text('Sell',
                                                          style: TextStyle(
                                                              fontSize: 12.0)))
                                                ])
                                          ]))
                                        ]))),
                                Divider(color: Colors.grey)
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

  Future<List<Holding>> updateHolding(
      String transaction, String stockTicker, int oldValue) async {
    int newValue;
    if (transaction == 'buy') {
      newValue = oldValue + 1;
    } else {
      newValue = oldValue - 1;
    }
    await ServerProxy.updateUserStock(stockTicker, newValue);
    return await fetchHoldings();
  }

  Future<List<Holding>> fetchHoldings() async {
    try {
      List<Holding> myHoldings = await ServerProxy.getUserHoldings();
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

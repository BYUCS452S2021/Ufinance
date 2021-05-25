# openapi.api.StockStatisticsApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**stockStatisticsGet**](StockStatisticsApi.md#stockstatisticsget) | **GET** /stock_statistics | Get stock statistics
[**stockStatisticsStockTickerGet**](StockStatisticsApi.md#stockstatisticsstocktickerget) | **GET** /stock_statistics/{stock_ticker} | Get stock statistics for a stock ticker


# **stockStatisticsGet**
> InlineResponse2002 stockStatisticsGet()

Get stock statistics

### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = StockStatisticsApi();

try { 
    final result = api_instance.stockStatisticsGet();
    print(result);
} catch (e) {
    print('Exception when calling StockStatisticsApi->stockStatisticsGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**InlineResponse2002**](InlineResponse2002.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **stockStatisticsStockTickerGet**
> InlineResponse2002StockStatistics stockStatisticsStockTickerGet(stockTicker)

Get stock statistics for a stock ticker

### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = StockStatisticsApi();
final stockTicker = stockTicker_example; // String | 

try { 
    final result = api_instance.stockStatisticsStockTickerGet(stockTicker);
    print(result);
} catch (e) {
    print('Exception when calling StockStatisticsApi->stockStatisticsStockTickerGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **stockTicker** | **String**|  | 

### Return type

[**InlineResponse2002StockStatistics**](InlineResponse2002StockStatistics.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


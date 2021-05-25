# openapi.api.StrategiesApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**strategiesGet**](StrategiesApi.md#strategiesget) | **GET** /strategies | Get strategies
[**strategiesInvestmentStrategyIdGet**](StrategiesApi.md#strategiesinvestmentstrategyidget) | **GET** /strategies/{investment_strategy_id} | Get strategy


# **strategiesGet**
> InlineResponse2002 strategiesGet()

Get strategies

### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = StrategiesApi();

try { 
    final result = api_instance.strategiesGet();
    print(result);
} catch (e) {
    print('Exception when calling StrategiesApi->strategiesGet: $e\n');
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

# **strategiesInvestmentStrategyIdGet**
> InlineResponse2002Strategies strategiesInvestmentStrategyIdGet(investmentStrategyId)

Get strategy

### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = StrategiesApi();
final investmentStrategyId = 56; // int | 

try { 
    final result = api_instance.strategiesInvestmentStrategyIdGet(investmentStrategyId);
    print(result);
} catch (e) {
    print('Exception when calling StrategiesApi->strategiesInvestmentStrategyIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **investmentStrategyId** | **int**|  | 

### Return type

[**InlineResponse2002Strategies**](InlineResponse2002Strategies.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


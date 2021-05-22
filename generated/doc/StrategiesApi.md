# openapi.api.StrategiesApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**strategiesGet**](StrategiesApi.md#strategiesget) | **GET** /strategies | Get strategies
[**strategiesInvestmentStrategyGet**](StrategiesApi.md#strategiesinvestmentstrategyget) | **GET** /strategies/{investment_strategy} | Get strategy


# **strategiesGet**
> InlineResponse2001 strategiesGet()

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

[**InlineResponse2001**](InlineResponse2001.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **strategiesInvestmentStrategyGet**
> InlineResponse2001Strategies strategiesInvestmentStrategyGet(investmentStrategy)

Get strategy

### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = StrategiesApi();
final investmentStrategy = 56; // int | 

try { 
    final result = api_instance.strategiesInvestmentStrategyGet(investmentStrategy);
    print(result);
} catch (e) {
    print('Exception when calling StrategiesApi->strategiesInvestmentStrategyGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **investmentStrategy** | **int**|  | 

### Return type

[**InlineResponse2001Strategies**](InlineResponse2001Strategies.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


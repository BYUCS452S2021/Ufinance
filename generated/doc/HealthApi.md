# openapi.api.HealthApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**healthGet**](HealthApi.md#healthget) | **GET** /health | Healthcheck


# **healthGet**
> InlineResponse200 healthGet()

Healthcheck

Healthcheck - Will respond in [this format](https://tools.ietf.org/id/draft-inadarei-api-health-check-04.html), but with `application/json`

### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = HealthApi();

try { 
    final result = api_instance.healthGet();
    print(result);
} catch (e) {
    print('Exception when calling HealthApi->healthGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**InlineResponse200**](InlineResponse200.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


# openapi.api.TimeApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**timeGet**](TimeApi.md#timeget) | **GET** /time | Get time


# **timeGet**
> InlineResponse2004 timeGet()

Get time

Get time from the database, to prove that we can connect to it

### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = TimeApi();

try { 
    final result = api_instance.timeGet();
    print(result);
} catch (e) {
    print('Exception when calling TimeApi->timeGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**InlineResponse2004**](InlineResponse2004.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


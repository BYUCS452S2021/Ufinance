# openapi.api.LoginApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**loginPost**](LoginApi.md#loginpost) | **POST** /login | Login


# **loginPost**
> InlineResponse2001 loginPost(inlineObject)

Login

### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = LoginApi();
final inlineObject = InlineObject(); // InlineObject | 

try { 
    final result = api_instance.loginPost(inlineObject);
    print(result);
} catch (e) {
    print('Exception when calling LoginApi->loginPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **inlineObject** | [**InlineObject**](InlineObject.md)|  | [optional] 

### Return type

[**InlineResponse2001**](InlineResponse2001.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


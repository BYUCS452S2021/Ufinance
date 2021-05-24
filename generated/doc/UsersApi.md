# openapi.api.UsersApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**usersPost**](UsersApi.md#userspost) | **POST** /users | Register
[**usersUserIdGet**](UsersApi.md#usersuseridget) | **GET** /users/{user_id} | Get user
[**usersUserIdHoldingsGet**](UsersApi.md#usersuseridholdingsget) | **GET** /users/{user_id}/holdings | Get user


# **usersPost**
> InlineResponse201 usersPost(inlineObject1)

Register

### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = UsersApi();
final inlineObject1 = InlineObject1(); // InlineObject1 | 

try { 
    final result = api_instance.usersPost(inlineObject1);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->usersPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **inlineObject1** | [**InlineObject1**](InlineObject1.md)|  | [optional] 

### Return type

[**InlineResponse201**](InlineResponse201.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **usersUserIdGet**
> InlineResponse2001 usersUserIdGet(userId, token)

Get user

### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = UsersApi();
final userId = 56; // int | 
final token = token_example; // String | 

try { 
    final result = api_instance.usersUserIdGet(userId, token);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->usersUserIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **int**|  | 
 **token** | **String**|  | 

### Return type

[**InlineResponse2001**](InlineResponse2001.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **usersUserIdHoldingsGet**
> InlineResponse2004 usersUserIdHoldingsGet(userId, token)

Get user

### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = UsersApi();
final userId = 56; // int | 
final token = token_example; // String | 

try { 
    final result = api_instance.usersUserIdHoldingsGet(userId, token);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->usersUserIdHoldingsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **int**|  | 
 **token** | **String**|  | 

### Return type

[**InlineResponse2004**](InlineResponse2004.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


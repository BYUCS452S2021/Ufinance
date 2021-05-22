//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class HealthApi {
  HealthApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Healthcheck
  ///
  /// Healthcheck - Will respond in [this format](https://tools.ietf.org/id/draft-inadarei-api-health-check-04.html), but with `application/json`
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> healthGetWithHttpInfo() async {
    final path = r'/health';

    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    final contentTypes = <String>[];
    final nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    final authNames = <String>[];


    return await apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      nullableContentType,
      authNames,
    );
  }

  /// Healthcheck
  ///
  /// Healthcheck - Will respond in [this format](https://tools.ietf.org/id/draft-inadarei-api-health-check-04.html), but with `application/json`
  Future<InlineResponse200> healthGet() async {
    final response = await healthGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'InlineResponse200',) as InlineResponse200;
        }
    return Future<InlineResponse200>.value(null);
  }
}

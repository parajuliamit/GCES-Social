// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assignment_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _AssignmentApi implements AssignmentApi {
  _AssignmentApi(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<Assignment>> getAssignments(batch) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<Assignment>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'assignment/$batch/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Assignment.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<ViewAssignment> getAssignment(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ViewAssignment>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'assignment/view/$id/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ViewAssignment.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}

import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class FetchAllProductsCall {
  static Future<ApiCallResponse> call({
    String? url = 'azr.storebz.com',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Fetch All Products',
      apiUrl: 'https://azpartsdz.com/api/products',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? allProducts(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class FetchAllCategoriesCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Fetch All Categories',
      apiUrl: 'https://azpartsdz.com/api/categories',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? cats(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class FetchAllFilterCategoriesCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Fetch All Filter Categories',
      apiUrl: 'https://azpartsdz.com/api/filterCategories',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? cats(dynamic response) => (getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class FetchAttributesThatBelongToGivenCategoryByNameCall {
  static Future<ApiCallResponse> call({
    String? category = 'all',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Fetch Attributes That Belong To Given Category by name',
      apiUrl: 'https://azpartsdz.com/api/attributes/by_category/$category',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? attributes(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class FetchProductDataByIDCall {
  static Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Fetch Product Data by ID',
      apiUrl: 'https://azpartsdz.com/api/products/$id',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? originalGallery(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].gallery.original''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? thumbGallery(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].gallery.thumb''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? thumb400Gallery(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].gallery.thumb400''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class POSTFetchFilteredProductsCall {
  static Future<ApiCallResponse> call({
    String? category = '',
    List<int>? filtersList,
    String? search = '',
    double? tolerance,
  }) async {
    final filters = _serializeList(filtersList);

    return ApiManager.instance.makeApiCall(
      callName: 'POST Fetch Filtered Products ',
      apiUrl: 'https://azpartsdz.com/api/filter',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'category': category,
        'filters': filters,
        'search': search,
        'tolerance': tolerance,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? aaa(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class FetchAllBrandsCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Fetch All Brands',
      apiUrl: 'https://azpartsdz.com/api/brands',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: true,
      alwaysAllowBody: false,
    );
  }
}

class PrepareCARTCall {
  static Future<ApiCallResponse> call({
    List<String>? cartIdsList,
    List<int>? cartQtysList,
  }) async {
    final cartIds = _serializeList(cartIdsList);
    final cartQtys = _serializeList(cartQtysList);

    return ApiManager.instance.makeApiCall(
      callName: 'Prepare CART',
      apiUrl: 'https://azpartsdz.com/api/cart',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'cartIds': cartIds,
        'cartQtys': cartQtys,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CalculateCartTotalCall {
  static Future<ApiCallResponse> call({
    List<double>? pricesList,
  }) async {
    final prices = _serializeList(pricesList);

    return ApiManager.instance.makeApiCall(
      callName: 'Calculate Cart Total',
      apiUrl: 'https://azpartsdz.com/api/cart/total',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'prices': prices,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ChekoutCall {
  static Future<ApiCallResponse> call({
    String? firstName = '',
    String? lastName = '',
    String? phone = '',
    String? address = '',
    List<String>? cartIdsList,
    List<int>? cartQtysList,
    String? uuid = '',
  }) async {
    final cartIds = _serializeList(cartIdsList);
    final cartQtys = _serializeList(cartQtysList);

    return ApiManager.instance.makeApiCall(
      callName: 'Chekout',
      apiUrl: 'https://azpartsdz.com/api/checkout',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'firstName': firstName,
        'lastName': lastName,
        'phone': phone,
        'address': address,
        'cartIds': cartIds,
        'cartQtys': cartQtys,
        'uuid': uuid,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class FetchOrdersHistoryCall {
  static Future<ApiCallResponse> call({
    List<String>? historyList,
  }) async {
    final history = _serializeList(historyList);

    return ApiManager.instance.makeApiCall(
      callName: 'Fetch Orders History',
      apiUrl: 'https://azpartsdz.com/api/history',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'history': history,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class FetchOrderByOrderCodeCall {
  static Future<ApiCallResponse> call({
    String? code = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Fetch Order By OrderCode',
      apiUrl: 'https://azpartsdz.com/api/orderDetails/$code',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class OrderNotificationsCall {
  static Future<ApiCallResponse> call({
    List<String>? historyList,
  }) async {
    final history = _serializeList(historyList);

    return ApiManager.instance.makeApiCall(
      callName: 'Order Notifications',
      apiUrl: 'https://azpartsdz.com/api/notifications',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'history': history,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class AppSettingsCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'App Settings',
      apiUrl: 'https://azpartsdz.com/api/settings',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class FetchProductsByCategoryIDCall {
  static Future<ApiCallResponse> call({
    int? id,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Fetch Products By Category ID',
      apiUrl: 'https://azpartsdz.com/api/products/category/$id',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class FetchLatestProductsNewArrivalsCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Fetch Latest Products New Arrivals',
      apiUrl: 'https://azpartsdz.com/api/products/latest',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class FetchOrdersHistoryByStatusCall {
  static Future<ApiCallResponse> call({
    int? status,
    List<String>? historyList,
  }) async {
    final history = _serializeList(historyList);

    return ApiManager.instance.makeApiCall(
      callName: 'Fetch Orders History By Status',
      apiUrl: 'https://azpartsdz.com/api/history/$status',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'history': history,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class FetchFavoritedProductsCall {
  static Future<ApiCallResponse> call({
    List<String>? favoritesList,
  }) async {
    final favorites = _serializeList(favoritesList);

    return ApiManager.instance.makeApiCall(
      callName: 'Fetch Favorited Products',
      apiUrl: 'https://azpartsdz.com/api/favorites',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'favorites': favorites,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class FetchRootCategoriesCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Fetch Root Categories',
      apiUrl: 'https://azpartsdz.com/api/categories/no_parent',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class FetchSubCategoriesOfACategoryByIDCall {
  static Future<ApiCallResponse> call({
    int? id,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Fetch Sub Categories of a Category by ID',
      apiUrl: 'https://azpartsdz.com/api/categories/parent/$id',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? subCats(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetWilayasCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Wilayas',
      apiUrl: 'https://azpartsdz.com/api/wilayas',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      alwaysAllowBody: false,
    );
  }

  static List? wilayas(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class DeliveryFeesCall {
  static Future<ApiCallResponse> call({
    String? wilaya = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'delivery fees',
      apiUrl: 'azpartsdz.com/api/fees',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'wilaya': wilaya,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static int? stopdeskfee(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].desk_fee''',
      ));
  static int? homefee(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].home_fee''',
      ));
}

class CalculateTotalFeesCall {
  static Future<ApiCallResponse> call({
    List<String>? cartIdsList,
    List<int>? cartQtysList,
    String? firstname = '',
    String? lastname = '',
    String? phone = '',
    String? wilaya = '',
    String? commune = '',
    bool? isStopdesk,
    String? stopdesk = '',
  }) async {
    final cartIds = _serializeList(cartIdsList);
    final cartQtys = _serializeList(cartQtysList);

    return ApiManager.instance.makeApiCall(
      callName: 'Calculate Total Fees',
      apiUrl: 'azpartsdz.com/api/weightFees',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'cartIds': cartIds,
        'cartQtys': cartQtys,
        'firstname': firstname,
        'lastname': lastname,
        'phone': phone,
        'wilaya': wilaya,
        'commune': commune,
        'is_stopdesk': isStopdesk,
        'stopdesk': stopdesk,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? orderData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static int? deliveryFees(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data[0].delivery_fee''',
      ));
}

class GetCommunesByWilayaNameCall {
  static Future<ApiCallResponse> call({
    String? wilaya = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'get Communes By Wilaya Name',
      apiUrl: 'azpartsdz.com/api/communes',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'wilaya': wilaya,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? communes(dynamic response) => (getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetCentersCall {
  static Future<ApiCallResponse> call({
    String? wilaya = '',
    String? commune = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Centers',
      apiUrl: 'azpartsdz.com/api/centers',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'wilaya': wilaya,
        'commune': commune,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? centers(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetAllCommunesCall {
  static Future<ApiCallResponse> call({
    String? wilaya = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'get All Communes',
      apiUrl: 'azpartsdz.com/api/all_communes',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'wilaya': wilaya,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? allCommunes(dynamic response) => (getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}

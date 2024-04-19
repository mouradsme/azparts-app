import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => appStateNotifier.showSplashImage
          ? Builder(
              builder: (context) => Container(
                color: Colors.black,
                child: Image.asset(
                  'assets/images/Default.png',
                  fit: BoxFit.scaleDown,
                ),
              ),
            )
          : const NavBarPage(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.showSplashImage
              ? Builder(
                  builder: (context) => Container(
                    color: Colors.black,
                    child: Image.asset(
                      'assets/images/Default.png',
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                )
              : const NavBarPage(),
          routes: [
            FFRoute(
              name: 'HomePage',
              path: 'homePage',
              builder: (context, params) => params.isEmpty
                  ? const NavBarPage(initialPage: 'HomePage')
                  : const HomePageWidget(),
            ),
            FFRoute(
              name: 'CartPage',
              path: 'cartPage',
              builder: (context, params) => params.isEmpty
                  ? const NavBarPage(initialPage: 'CartPage')
                  : const CartPageWidget(),
            ),
            FFRoute(
              name: 'NotificationsPage',
              path: 'notificationsPage',
              builder: (context, params) => params.isEmpty
                  ? const NavBarPage(initialPage: 'NotificationsPage')
                  : const NotificationsPageWidget(),
            ),
            FFRoute(
              name: 'ProfilePage',
              path: 'profilePage',
              builder: (context, params) => params.isEmpty
                  ? const NavBarPage(initialPage: 'ProfilePage')
                  : const ProfilePageWidget(),
            ),
            FFRoute(
              name: 'ProductPage',
              path: 'productPage',
              builder: (context, params) => ProductPageWidget(
                productId: params.getParam(
                  'productId',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'CheckoutPage',
              path: 'checkoutPage',
              builder: (context, params) => CheckoutPageWidget(
                deFee: params.getParam(
                  'deFee',
                  ParamType.double,
                ),
              ),
            ),
            FFRoute(
              name: 'PaymentPage',
              path: 'paymentPage',
              builder: (context, params) => const PaymentPageWidget(),
            ),
            FFRoute(
              name: 'FilterResultsPage',
              path: 'filterResultsPage',
              builder: (context, params) => FilterResultsPageWidget(
                category: params.getParam(
                  'category',
                  ParamType.String,
                ),
                filterValues: params.getParam<int>(
                  'filterValues',
                  ParamType.int,
                  true,
                ),
                searchQuery: params.getParam(
                  'searchQuery',
                  ParamType.String,
                ),
                toleance: params.getParam(
                  'toleance',
                  ParamType.double,
                ),
              ),
            ),
            FFRoute(
              name: 'ProfilePersonalDetailsPage',
              path: 'profilePersonalDetailsPage',
              builder: (context, params) => const ProfilePersonalDetailsPageWidget(),
            ),
            FFRoute(
              name: 'ShimmerCartItemComponent',
              path: 'shimmerCartItemComponent',
              builder: (context, params) => const ShimmerCartItemComponentWidget(),
            ),
            FFRoute(
              name: 'OrderDetailsPage',
              path: 'orderDetailsPage',
              builder: (context, params) => OrderDetailsPageWidget(
                orderCode: params.getParam(
                  'orderCode',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'OrdersHistoryPage',
              path: 'ordersHistoryPage',
              builder: (context, params) => const OrdersHistoryPageWidget(),
            ),
            FFRoute(
              name: 'ProductsByCategoryPage',
              path: 'products_by_category',
              builder: (context, params) => ProductsByCategoryPageWidget(
                category: params.getParam(
                  'category',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: 'ProductsPage',
              path: 'productsPage',
              builder: (context, params) => const ProductsPageWidget(),
            ),
            FFRoute(
              name: 'NotificationsShimmer',
              path: 'notificationsShimmer',
              builder: (context, params) => const NotificationsShimmerWidget(),
            ),
            FFRoute(
              name: 'settingsPage',
              path: 'settingsPage',
              builder: (context, params) => const SettingsPageWidget(),
            ),
            FFRoute(
              name: 'ProductFavoritesPage',
              path: 'productFavoritesPage',
              builder: (context, params) => const ProductFavoritesPageWidget(),
            ),
            FFRoute(
              name: 'PrivacyPolicyPage',
              path: 'privacyPolicyPage',
              builder: (context, params) => const PrivacyPolicyPageWidget(),
            ),
            FFRoute(
              name: 'StoresListPage',
              path: 'storesListPage',
              builder: (context, params) => const StoresListPageWidget(),
            ),
            FFRoute(
              name: 'StoresProfilepage',
              path: 'storesProfilepage',
              builder: (context, params) => const StoresProfilepageWidget(),
            ),
            FFRoute(
              name: 'deliveryinfos',
              path: 'deliveryinfos',
              builder: (context, params) => const DeliveryinfosWidget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(
        hasTransition: true,
        transitionType: PageTransitionType.fade,
        duration: Duration(milliseconds: 0),
      );
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

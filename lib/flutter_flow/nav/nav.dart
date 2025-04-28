import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sparke_kaleo/main_screens/books/search_book_page/search_book_page_widget.dart';

import '/auth/base_auth_user_provider.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import '/main.dart';

export 'package:go_router/go_router.dart';

export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      // debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : AuthWelcomeWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : AuthWelcomeWidget(),
          routes: [
            FFRoute(
              name: HeirloomSecretPg1Widget.routeName,
              path: HeirloomSecretPg1Widget.routePath,
              requireAuth: true,
              builder: (context, params) => HeirloomSecretPg1Widget(),
            ),
            FFRoute(
              name: HeirloomSecretPg2Widget.routeName,
              path: HeirloomSecretPg2Widget.routePath,
              requireAuth: true,
              builder: (context, params) => HeirloomSecretPg2Widget(),
            ),
            FFRoute(
              name: HeirloomSecretPg3Widget.routeName,
              path: HeirloomSecretPg3Widget.routePath,
              requireAuth: true,
              builder: (context, params) => HeirloomSecretPg3Widget(),
            ),
            FFRoute(
              name: HeirloomSecretPg4Widget.routeName,
              path: HeirloomSecretPg4Widget.routePath,
              requireAuth: true,
              builder: (context, params) => HeirloomSecretPg4Widget(),
            ),
            FFRoute(
              name: HeirloomSecretCh2pg5Widget.routeName,
              path: HeirloomSecretCh2pg5Widget.routePath,
              requireAuth: true,
              builder: (context, params) => HeirloomSecretCh2pg5Widget(),
            ),
            FFRoute(
              name: HeirloomSecretCh2pg6Widget.routeName,
              path: HeirloomSecretCh2pg6Widget.routePath,
              requireAuth: true,
              builder: (context, params) => HeirloomSecretCh2pg6Widget(),
            ),
            FFRoute(
              name: HeirloomSecretCh2pg7Widget.routeName,
              path: HeirloomSecretCh2pg7Widget.routePath,
              requireAuth: true,
              builder: (context, params) => HeirloomSecretCh2pg7Widget(),
            ),
            FFRoute(
              name: HeirloomSecretCh2pg8Widget.routeName,
              path: HeirloomSecretCh2pg8Widget.routePath,
              requireAuth: true,
              builder: (context, params) => HeirloomSecretCh2pg8Widget(),
            ),
            FFRoute(
              name: HeirloomSecretCh2pg9Widget.routeName,
              path: HeirloomSecretCh2pg9Widget.routePath,
              requireAuth: true,
              builder: (context, params) => HeirloomSecretCh2pg9Widget(),
            ),
            FFRoute(
              name: HeirloomSecretCh3pg10Widget.routeName,
              path: HeirloomSecretCh3pg10Widget.routePath,
              requireAuth: true,
              builder: (context, params) => HeirloomSecretCh3pg10Widget(),
            ),
            FFRoute(
              name: HeirloomSecretCh3pg11Widget.routeName,
              path: HeirloomSecretCh3pg11Widget.routePath,
              requireAuth: true,
              builder: (context, params) => HeirloomSecretCh3pg11Widget(),
            ),
            FFRoute(
              name: HeirloomSecretCh3pg12Widget.routeName,
              path: HeirloomSecretCh3pg12Widget.routePath,
              requireAuth: true,
              builder: (context, params) => HeirloomSecretCh3pg12Widget(),
            ),
            FFRoute(
              name: HeirloomSecretCh3pg13Widget.routeName,
              path: HeirloomSecretCh3pg13Widget.routePath,
              requireAuth: true,
              builder: (context, params) => HeirloomSecretCh3pg13Widget(),
            ),
            FFRoute(
              name: HeirloomSecretCh3pg14Widget.routeName,
              path: HeirloomSecretCh3pg14Widget.routePath,
              requireAuth: true,
              builder: (context, params) => HeirloomSecretCh3pg14Widget(),
            ),
            FFRoute(
              name: HeirloomSecretCh3pg15Widget.routeName,
              path: HeirloomSecretCh3pg15Widget.routePath,
              requireAuth: true,
              builder: (context, params) => HeirloomSecretCh3pg15Widget(),
            ),
            FFRoute(
              name: HeirloomSecretCh4pg16Widget.routeName,
              path: HeirloomSecretCh4pg16Widget.routePath,
              requireAuth: true,
              builder: (context, params) => HeirloomSecretCh4pg16Widget(),
            ),
            FFRoute(
              name: HeirloomSecretCh4pg17Widget.routeName,
              path: HeirloomSecretCh4pg17Widget.routePath,
              requireAuth: true,
              builder: (context, params) => HeirloomSecretCh4pg17Widget(),
            ),
            FFRoute(
              name: HeirloomSecretCh4pg18Widget.routeName,
              path: HeirloomSecretCh4pg18Widget.routePath,
              requireAuth: true,
              builder: (context, params) => HeirloomSecretCh4pg18Widget(),
            ),
            FFRoute(
              name: HeirloomSecretCh4pg19Widget.routeName,
              path: HeirloomSecretCh4pg19Widget.routePath,
              requireAuth: true,
              builder: (context, params) => HeirloomSecretCh4pg19Widget(),
            ),
            FFRoute(
              name: HeirloomSecretCh4pg20Widget.routeName,
              path: HeirloomSecretCh4pg20Widget.routePath,
              requireAuth: true,
              builder: (context, params) => HeirloomSecretCh4pg20Widget(),
            ),
            FFRoute(
              name: HeirloomSecretCh4pg21Widget.routeName,
              path: HeirloomSecretCh4pg21Widget.routePath,
              requireAuth: true,
              builder: (context, params) => HeirloomSecretCh4pg21Widget(),
            ),
            FFRoute(
              name: HeirloomSecretCh5pg22Widget.routeName,
              path: HeirloomSecretCh5pg22Widget.routePath,
              requireAuth: true,
              builder: (context, params) => HeirloomSecretCh5pg22Widget(),
            ),
            FFRoute(
              name: UpgradeCoinShopWidget.routeName,
              path: UpgradeCoinShopWidget.routePath,
              requireAuth: true,
              builder: (context, params) => UpgradeCoinShopWidget(),
            ),
            FFRoute(
              name: HeirloomSecretCh5pg22EnoughCoinsWidget.routeName,
              path: HeirloomSecretCh5pg22EnoughCoinsWidget.routePath,
              requireAuth: true,
              builder: (context, params) =>
                  HeirloomSecretCh5pg22EnoughCoinsWidget(),
            ),
            FFRoute(
              name: HeirloomSecretCh5pg23Widget.routeName,
              path: HeirloomSecretCh5pg23Widget.routePath,
              requireAuth: true,
              builder: (context, params) => HeirloomSecretCh5pg23Widget(),
            ),
            FFRoute(
              name: AuthWelcomeWidget.routeName,
              path: AuthWelcomeWidget.routePath,
              builder: (context, params) => AuthWelcomeWidget(),
            ),
            FFRoute(
              name: AuthMainWidget.routeName,
              path: AuthMainWidget.routePath,
              builder: (context, params) => AuthMainWidget(
                showBack: params.getParam(
                  'showBack',
                  ParamType.bool,
                ),
                uid: params.getParam(
                  'uid',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: MainLibraryWidget.routeName,
              path: MainLibraryWidget.routePath,
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'main_library')
                  : MainLibraryWidget(),
            ),
            FFRoute(
              name: MainTropesWidget.routeName,
              path: MainTropesWidget.routePath,
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'main_tropes')
                  : NavBarPage(
                      initialPage: 'main_tropes',
                      page: MainTropesWidget(),
                    ),
            ),
            FFRoute(
              name: MainHomeWidget.routeName,
              path: MainHomeWidget.routePath,
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'main_home')
                  : NavBarPage(
                      initialPage: 'main_home',
                      page: MainHomeWidget(),
                    ),
            ),
            FFRoute(
              name: OnboardingUserWidget.routeName,
              path: OnboardingUserWidget.routePath,
              requireAuth: true,
              builder: (context, params) => OnboardingUserWidget(
                createProfile: params.getParam(
                  'createProfile',
                  ParamType.bool,
                ),
              ),
            ),
            FFRoute(
              name: BookCommentsWidget.routeName,
              path: BookCommentsWidget.routePath,
              requireAuth: true,
              builder: (context, params) => BookCommentsWidget(
                bookRef: params.getParam<BooksRow>(
                  'bookRef',
                  ParamType.SupabaseRow,
                ),
              ),
            ),
            FFRoute(
              name: MainProfileWidget.routeName,
              path: MainProfileWidget.routePath,
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'main_profile')
                  : MainProfileWidget(),
            ),
            FFRoute(
              name: ProfileNotificationSettingsWidget.routeName,
              path: ProfileNotificationSettingsWidget.routePath,
              requireAuth: true,
              builder: (context, params) => ProfileNotificationSettingsWidget(),
            ),
            FFRoute(
              name: ProfileEditWidget.routeName,
              path: ProfileEditWidget.routePath,
              requireAuth: true,
              builder: (context, params) => ProfileEditWidget(),
            ),
            FFRoute(
              name: ProfileTransactionsWidget.routeName,
              path: ProfileTransactionsWidget.routePath,
              requireAuth: true,
              builder: (context, params) => ProfileTransactionsWidget(),
            ),
            FFRoute(
              name: ProfileSettingsWidget.routeName,
              path: ProfileSettingsWidget.routePath,
              requireAuth: true,
              builder: (context, params) => ProfileSettingsWidget(),
            ),
            FFRoute(
              name: PaymentmethodsWidget.routeName,
              path: PaymentmethodsWidget.routePath,
              requireAuth: true,
              builder: (context, params) => PaymentmethodsWidget(),
            ),
            FFRoute(
              name: TropesPageNoResultsWidget.routeName,
              path: TropesPageNoResultsWidget.routePath,
              requireAuth: true,
              builder: (context, params) => TropesPageNoResultsWidget(),
            ),
            FFRoute(
              name: TropesPageSearchResultsWidget.routeName,
              path: TropesPageSearchResultsWidget.routePath,
              requireAuth: true,
              builder: (context, params) => TropesPageSearchResultsWidget(),
            ),
            FFRoute(
              name: TropeMafiaWidget.routeName,
              path: TropeMafiaWidget.routePath,
              requireAuth: true,
              builder: (context, params) => TropeMafiaWidget(),
            ),
            FFRoute(
              name: TropesViewAllWidget.routeName,
              path: TropesViewAllWidget.routePath,
              requireAuth: true,
              builder: (context, params) => TropesViewAllWidget(
                selectedTrope: params.getParam(
                  'selectedTrope',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: TropeAlphaWidget.routeName,
              path: TropeAlphaWidget.routePath,
              requireAuth: true,
              builder: (context, params) => TropeAlphaWidget(),
            ),
            FFRoute(
              name: ProfileBecomeAuthorWidget.routeName,
              path: ProfileBecomeAuthorWidget.routePath,
              requireAuth: true,
              builder: (context, params) => ProfileBecomeAuthorWidget(),
            ),
            FFRoute(
              name: BookEndRecommendWidget.routeName,
              path: BookEndRecommendWidget.routePath,
              requireAuth: true,
              builder: (context, params) => BookEndRecommendWidget(
                userBook: params.getParam<UserBooksRow>(
                  'userBook',
                  ParamType.SupabaseRow,
                ),
                bookDoc: params.getParam<BooksRow>(
                  'bookDoc',
                  ParamType.SupabaseRow,
                ),
                userBookData: params.getParam(
                  'userBookData',
                  ParamType.DataStruct,
                  isList: false,
                  structBuilder: UserBooksDataStruct.fromSerializableMap,
                ),
              ),
            ),
            FFRoute(
              name: HeirloomSecretPg1MenuShowingWidget.routeName,
              path: HeirloomSecretPg1MenuShowingWidget.routePath,
              requireAuth: true,
              builder: (context, params) =>
                  HeirloomSecretPg1MenuShowingWidget(),
            ),
            FFRoute(
              name: HomePageNewUserWidget.routeName,
              path: HomePageNewUserWidget.routePath,
              requireAuth: true,
              builder: (context, params) => HomePageNewUserWidget(),
            ),
            FFRoute(
              name: HeirloomSecretCh5pg22NewUserWidget.routeName,
              path: HeirloomSecretCh5pg22NewUserWidget.routePath,
              requireAuth: true,
              builder: (context, params) =>
                  HeirloomSecretCh5pg22NewUserWidget(),
            ),
            FFRoute(
              name: HeirloomSecretCh5pg22DailyPassUsedWidget.routeName,
              path: HeirloomSecretCh5pg22DailyPassUsedWidget.routePath,
              requireAuth: true,
              builder: (context, params) =>
                  HeirloomSecretCh5pg22DailyPassUsedWidget(),
            ),
            FFRoute(
              name: HeirloomSecretCh5pg22LowCoinsWidget.routeName,
              path: HeirloomSecretCh5pg22LowCoinsWidget.routePath,
              requireAuth: true,
              builder: (context, params) =>
                  HeirloomSecretCh5pg22LowCoinsWidget(),
            ),
            FFRoute(
              name: UpgradeAcccountAltWidget.routeName,
              path: UpgradeAcccountAltWidget.routePath,
              requireAuth: true,
              builder: (context, params) => UpgradeAcccountAltWidget(),
            ),
            FFRoute(
              name: BookMainArchiveWidget.routeName,
              path: BookMainArchiveWidget.routePath,
              requireAuth: true,
              builder: (context, params) => BookMainArchiveWidget(
                pageNumber: params.getParam(
                  'pageNumber',
                  ParamType.int,
                ),
                percentageComplete: params.getParam(
                  'percentageComplete',
                  ParamType.double,
                ),
                totalPages: params.getParam(
                  'totalPages',
                  ParamType.int,
                ),
                bookRef: params.getParam<BooksRow>(
                  'bookRef',
                  ParamType.SupabaseRow,
                ),
                readingMode: params.getParam(
                  'readingMode',
                  ParamType.bool,
                ),
              ),
            ),
            FFRoute(
              name: ForgotPasswordWidget.routeName,
              path: ForgotPasswordWidget.routePath,
              requireAuth: true,
              builder: (context, params) => ForgotPasswordWidget(),
            ),
            FFRoute(
              name: MainNotificationsListWidget.routeName,
              path: MainNotificationsListWidget.routePath,
              requireAuth: true,
              builder: (context, params) => MainNotificationsListWidget(),
            ),
            FFRoute(
              name: ProfileDeleteAccountWidget.routeName,
              path: ProfileDeleteAccountWidget.routePath,
              requireAuth: true,
              builder: (context, params) => ProfileDeleteAccountWidget(),
            ),
            FFRoute(
              name: CoinRedeemWidget.routeName,
              path: CoinRedeemWidget.routePath,
              requireAuth: true,
              builder: (context, params) => CoinRedeemWidget(
                redemptionCode: params.getParam(
                  'redemptionCode',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: BookMainArchived02Widget.routeName,
              path: BookMainArchived02Widget.routePath,
              requireAuth: true,
              builder: (context, params) => BookMainArchived02Widget(
                currentPageNumber: params.getParam(
                  'currentPageNumber',
                  ParamType.int,
                ),
                percentageComplete: params.getParam(
                  'percentageComplete',
                  ParamType.double,
                ),
                totalPages: params.getParam(
                  'totalPages',
                  ParamType.int,
                ),
                bookRef: params.getParam<BooksRow>(
                  'bookRef',
                  ParamType.SupabaseRow,
                ),
                readingMode: params.getParam(
                  'readingMode',
                  ParamType.bool,
                ),
                userBookRef: params.getParam<UserBooksRow>(
                  'userBookRef',
                  ParamType.SupabaseRow,
                ),
                currentChapterIndex: params.getParam(
                  'currentChapterIndex',
                  ParamType.int,
                ),
                currentChapter: params.getParam(
                  'currentChapter',
                  ParamType.int,
                ),
                chaptersUnlocked: params.getParam(
                  'chaptersUnlocked',
                  ParamType.int,
                ),
                userbookData: params.getParam(
                  'userbookData',
                  ParamType.DataStruct,
                  isList: false,
                  structBuilder: UserBooksDataStruct.fromSerializableMap,
                ),
              ),
            ),
            FFRoute(
              name: BookDetailsWithoutScrollWidget.routeName,
              path: BookDetailsWithoutScrollWidget.routePath,
              requireAuth: true,
              builder: (context, params) => BookDetailsWithoutScrollWidget(
                userbookData: params.getParam(
                  'userbookData',
                  ParamType.DataStruct,
                  isList: false,
                  structBuilder: UserBooksDataStruct.fromSerializableMap,
                ),
                isFromSparkeBooks: params.getParam(
                  'isFromSparkeBooks',
                  ParamType.bool,
                ),
              ),
            ),
            FFRoute(
              name: PermissionsNotificationsWidget.routeName,
              path: PermissionsNotificationsWidget.routePath,
              requireAuth: true,
              builder: (context, params) => PermissionsNotificationsWidget(),
            ),
            FFRoute(
              name: SparkeBooksWidget.routeName,
              path: SparkeBooksWidget.routePath,
              requireAuth: true,
              builder: (context, params) => SparkeBooksWidget(
                bookId: params.getParam(
                  'bookId',
                  ParamType.int,
                ),
                chapterId: params.getParam(
                  'chapterId',
                  ParamType.int,
                ),
                isFromDeepLink: params.getParam(
                  'isFromDeepLink',
                  ParamType.bool,
                ),
              ),
            ),
            FFRoute(
              name: SearchBookPageWidget.routeName,
              path: SearchBookPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => SearchBookPageWidget(),
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
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

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

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
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
      (state.allParams.length == 1 &&
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
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
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
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
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
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth &&
              !appStateNotifier.loggedIn &&
              // allow reading books without being logged in, if e.g arriving from a deep link
              name != SparkeBooksWidget.routeName &&
              name != BookDetailsWithoutScrollWidget.routeName) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/authWelcome';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/sparke_splash.png',
                    fit: BoxFit.cover,
                  ),
                )
              : PushNotificationsHandler(child: page);

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

  static TransitionInfo appDefault() => TransitionInfo(
        hasTransition: true,
        transitionType: PageTransitionType.rightToLeft,
        duration: Duration(milliseconds: 300),
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

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_smartlook/flutter_smartlook.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sparke_kaleo/branch_handler.dart';

import '/backend/supabase/supabase.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/flutter_flow_theme.dart';
import 'ad_mob.dart';
import 'auth/firebase_auth/auth_util.dart';
import 'auth/firebase_auth/firebase_user_provider.dart';
import 'backend/firebase/firebase_config.dart';
import 'backend/push_notifications/push_notifications_util.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'index.dart';
import 'new_components/rewards/src/handlers/create_account_reward_handler.dart';

late final SharedPreferences sharedPreferences;
late final AdMob? adMob;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FlutterBranchSdk.init(enableLogging: kDebugMode);
  await FlutterBranchSdk.requestTrackingAuthorization();
  // FlutterBranchSdk.validateSDKIntegration();

  sharedPreferences = await SharedPreferences.getInstance();
  adMob = kIsWeb ? null : AdMob();

  GoRouter.optionURLReflectsImperativeAPIs = true;
  usePathUrlStrategy();

  final environmentValues = FFDevEnvironmentValues();
  await environmentValues.initialize();

  await initFirebase();

  await SupaFlow.initialize();

  await FlutterFlowTheme.initialize();

  final appState = FFAppState(); // Initialize FFAppState
  await appState.initializePersistedState();

  await revenue_cat.initialize(
    "appl_FOyqPEdWYQAXtjOBSBAcXExSftO",
    "goog_slYoGPbrUWzswzDqFOdttIDNqur",
    debugLogEnabled: true,
    loadDataAfterLaunch: true,
  );

  final Smartlook smartlook = Smartlook.instance;

  smartlook.start();
  smartlook.preferences
      .setProjectKey('44224deda9b0ac7989939e37f05242ecf88a0fb5');

  runApp(ChangeNotifierProvider(
    create: (context) => appState,
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class MyAppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;
  String getRoute([RouteMatch? routeMatch]) {
    final RouteMatch lastMatch =
        routeMatch ?? _router.routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : _router.routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }

  List<String> getRouteStack() =>
      _router.routerDelegate.currentConfiguration.matches
          .map((e) => getRoute(e))
          .toList();

  late Stream<BaseAuthUser> userStream;

  final authUserSub = authenticatedUserStream.listen((user) {
    revenue_cat.login(user?.uid);
  });
  final fcmTokenSub = fcmTokenUserStream.listen((_) {});

  @override
  void initState() {
    super.initState();

    adMob?.initialize();
    _appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(_appStateNotifier);
    userStream = sparkeKaleoFirebaseUserStream()
      ..listen((user) {
        _appStateNotifier.update(user);
      });
    jwtTokenStream.listen((_) {});
    Future.delayed(
      Duration(milliseconds: 1000),
      () => _appStateNotifier.stopShowingSplashImage(),
    );
  }

  @override
  void dispose() {
    authUserSub.cancel();
    fcmTokenSub.cancel();
    super.dispose();
  }

  void setThemeMode(ThemeMode mode) => safeSetState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    final router = _router;

    return BranchLinksHandler(
      router: router,
      child: SmartlookRecordingWidget(
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Sparke-Kaleo',
          scrollBehavior: MyAppScrollBehavior(),
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('en', '')],
          theme: ThemeData(
            brightness: Brightness.light,
            scrollbarTheme: ScrollbarThemeData(
              thumbVisibility: WidgetStateProperty.all(true),
              trackVisibility: WidgetStateProperty.all(false),
              interactive: true,
              thickness: WidgetStateProperty.all(8.0),
              radius: Radius.circular(4.0),
              trackColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.hovered)) {
                  return Color(4286808963);
                }
                return Color(4289440683);
              }),
              trackBorderColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.hovered)) {
                  return Color(4288059030);
                }
                return Color(4287598479);
              }),
              thumbColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.dragged)) {
                  return Color(2988187181);
                }
                if (states.contains(WidgetState.hovered)) {
                  return Color(2988187181);
                }
                return Color(4292928487);
              }),
            ),
            useMaterial3: false,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            scrollbarTheme: ScrollbarThemeData(
              thumbVisibility: WidgetStateProperty.all(true),
              trackVisibility: WidgetStateProperty.all(false),
              interactive: true,
              thickness: WidgetStateProperty.all(8.0),
              radius: Radius.circular(4.0),
              trackColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.hovered)) {
                  return Color(4286808963);
                }
                return Color(4289440683);
              }),
              trackBorderColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.hovered)) {
                  return Color(4288059030);
                }
                return Color(4287598479);
              }),
              thumbColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.dragged)) {
                  return Color(2988187181);
                }
                if (states.contains(WidgetState.hovered)) {
                  return Color(2988187181);
                }
                return Color(4281612112);
              }),
            ),
            useMaterial3: false,
          ),
          themeMode: _themeMode,
          routerConfig: _router,
          builder: (context, child) =>
              CreateAccountRewardHandler(child: child!),
        ),
      ),
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key? key, this.initialPage, this.page}) : super(key: key);

  final String? initialPage;
  final Widget? page;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPageName = 'main_home';
  late Widget? _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPageName = widget.initialPage ?? _currentPageName;
    _currentPage = widget.page;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'main_home': MainHomeWidget(),
      'main_library': MainLibraryWidget(),
      'main_tropes': MainTropesWidget(),
      'main_profile': MainProfileWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPageName);

    return Scaffold(
      body: _currentPage ?? tabs[_currentPageName],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i) => safeSetState(() {
          _currentPage = null;
          _currentPageName = tabs.keys.toList()[i];
        }),
        backgroundColor: Colors.white,
        selectedItemColor: FlutterFlowTheme.of(context).primary,
        unselectedItemColor: FlutterFlowTheme.of(context).gray800,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              FFIcons.khomeSmile,
              size: 24.0,
            ),
            label: 'Home',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FFIcons.kbookOpen01,
              size: 24.0,
            ),
            label: 'Library',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FFIcons.kstars01,
              size: 24.0,
            ),
            label: 'Tropes',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FFIcons.kuserCircle,
              size: 24.0,
            ),
            label: 'Profile',
            tooltip: '',
          )
        ],
      ),
    );
  }
}

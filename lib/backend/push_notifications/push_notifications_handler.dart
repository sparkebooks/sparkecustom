import 'dart:async';

import 'serialization_util.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        if (mounted) {
          context.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        } else {
          appNavigatorKey.currentContext?.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        }
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/sparke_splash.png',
            fit: BoxFit.cover,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'HeirloomSecretPg1': ParameterData.none(),
  'HeirloomSecretPg2': ParameterData.none(),
  'HeirloomSecretPg3': ParameterData.none(),
  'HeirloomSecretPg4': ParameterData.none(),
  'HeirloomSecretCh2pg5': ParameterData.none(),
  'HeirloomSecretCh2pg6': ParameterData.none(),
  'HeirloomSecretCh2pg7': ParameterData.none(),
  'HeirloomSecretCh2pg8': ParameterData.none(),
  'HeirloomSecretCh2pg9': ParameterData.none(),
  'HeirloomSecretCh3pg10': ParameterData.none(),
  'HeirloomSecretCh3pg11': ParameterData.none(),
  'HeirloomSecretCh3pg12': ParameterData.none(),
  'HeirloomSecretCh3pg13': ParameterData.none(),
  'HeirloomSecretCh3pg14': ParameterData.none(),
  'HeirloomSecretCh3pg15': ParameterData.none(),
  'HeirloomSecretCh4pg16': ParameterData.none(),
  'HeirloomSecretCh4pg17': ParameterData.none(),
  'HeirloomSecretCh4pg18': ParameterData.none(),
  'HeirloomSecretCh4pg19': ParameterData.none(),
  'HeirloomSecretCh4pg20': ParameterData.none(),
  'HeirloomSecretCh4pg21': ParameterData.none(),
  'HeirloomSecretCh5pg22': ParameterData.none(),
  'upgrade_coin_shop': ParameterData.none(),
  'HeirloomSecretCh5pg22EnoughCoins': ParameterData.none(),
  'HeirloomSecretCh5pg23': ParameterData.none(),
  'auth_welcome': ParameterData.none(),
  'auth_main': (data) async => ParameterData(
        allParams: {
          'showBack': getParameter<bool>(data, 'showBack'),
          'uid': getParameter<String>(data, 'uid'),
        },
      ),
  'main_library': ParameterData.none(),
  'main_tropes': ParameterData.none(),
  'main_home': ParameterData.none(),
  'onboarding_user': (data) async => ParameterData(
        allParams: {
          'createProfile': getParameter<bool>(data, 'createProfile'),
        },
      ),
  'book_comments': (data) async => ParameterData(
        allParams: <String, dynamic>{},
      ),
  'main_profile': ParameterData.none(),
  'profile_notification_settings': ParameterData.none(),
  'profile_edit': ParameterData.none(),
  'profile_transactions': ParameterData.none(),
  'profile_settings': ParameterData.none(),
  'paymentmethods': ParameterData.none(),
  'TropesPageNoResults': ParameterData.none(),
  'TropesPageSearchResults': ParameterData.none(),
  'TropeMafia': ParameterData.none(),
  'Tropes_View_all': (data) async => ParameterData(
        allParams: {
          'selectedTrope': getParameter<String>(data, 'selectedTrope'),
        },
      ),
  'TropeAlpha': ParameterData.none(),
  'profile_become_author': ParameterData.none(),
  'book_end_recommend': (data) async => ParameterData(
        allParams: <String, dynamic>{},
      ),
  'HeirloomSecretPg1MenuShowing': ParameterData.none(),
  'HomePageNewUser': ParameterData.none(),
  'HeirloomSecretCh5pg22NewUser': ParameterData.none(),
  'HeirloomSecretCh5pg22DailyPassUsed': ParameterData.none(),
  'HeirloomSecretCh5pg22LowCoins': ParameterData.none(),
  'upgrade_acccount_alt': ParameterData.none(),
  'book_main_archive': (data) async => ParameterData(
        allParams: {
          'pageNumber': getParameter<int>(data, 'pageNumber'),
          'percentageComplete':
              getParameter<double>(data, 'percentageComplete'),
          'totalPages': getParameter<int>(data, 'totalPages'),
          'readingMode': getParameter<bool>(data, 'readingMode'),
        },
      ),
  'forgot_password': ParameterData.none(),
  'main_notifications_list': ParameterData.none(),
  'profile_delete_account': ParameterData.none(),
  'coin_redeem': (data) async => ParameterData(
        allParams: {
          'redemptionCode': getParameter<String>(data, 'redemptionCode'),
        },
      ),
  'book_main_archived_02': (data) async => ParameterData(
        allParams: {
          'currentPageNumber': getParameter<int>(data, 'currentPageNumber'),
          'percentageComplete':
              getParameter<double>(data, 'percentageComplete'),
          'totalPages': getParameter<int>(data, 'totalPages'),
          'readingMode': getParameter<bool>(data, 'readingMode'),
          'currentChapterIndex': getParameter<int>(data, 'currentChapterIndex'),
          'currentChapter': getParameter<int>(data, 'currentChapter'),
          'chaptersUnlocked': getParameter<int>(data, 'chaptersUnlocked'),
        },
      ),
  'book_details_without_scroll': (data) async => ParameterData(
        allParams: {
          'isFromSparkeBooks': getParameter<bool>(data, 'isFromSparkeBooks'),
        },
      ),
  'permissions_notifications': ParameterData.none(),
  'sparkeBooks': (data) async => ParameterData(
        allParams: {
          'bookId': getParameter<int>(data, 'bookId'),
          'chapterId': getParameter<int>(data, 'chapterId'),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}

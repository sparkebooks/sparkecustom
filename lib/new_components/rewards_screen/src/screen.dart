import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sparke_kaleo/flutter_flow/flutter_flow_theme.dart';
import 'package:sparke_kaleo/flutter_flow/flutter_flow_util.dart';
import 'package:sparke_kaleo/main.dart';
import 'package:sparke_kaleo/main_screens/create_account/auth_main/auth_main_widget.dart';
import 'package:sparke_kaleo/new_components/rewards_screen/src/config.dart';
import 'package:sparke_kaleo/new_components/rewards_screen/src/handlers/create_account_reward_handler.dart';

import 'bloc.dart';
import 'data/social_media_connection_repo.dart/state.dart';
import 'state.dart';
import 'utils/show_snack_bar.dart';

class RewardsScreen extends StatelessWidget {
  final Bloc Function() blocBuilder;

  const RewardsScreen({super.key, required this.blocBuilder});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => blocBuilder(),
      child: _Theme(child: _Content()),
    );
  }
}

extension on BuildContext {
  Bloc get bloc => read();
  UiState get state => watch<Bloc>().state;
}

class _Theme extends StatelessWidget {
  final Widget child;

  const _Theme({required this.child});

  @override
  Widget build(BuildContext context) {
    final data = Theme.of(context);
    return Theme(
      data: data.copyWith(
        textTheme: TextTheme.of(context).apply(
          fontFamily: 'FfUntitledui',
        ),
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          centerTitle: true,
          titleTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                fontFamily: FFAppState().selectedFontFamily,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
        ),
      ),
      child: child,
    );
  }
}

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    final state = context.state;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          sharedPreferences.clear();
        },
      ),
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Earn Rewards'),
      ),
      body: switch (state.dataStatus) {
        DataStatus.loading => _LoadingBody(),
        DataStatus.error => _ErrorBody(dataError: state.dataError!),
        DataStatus.loaded => Provider.value(
            value: state.data!,
            child: _Body(),
          ),
      },
    );
  }
}

class _LoadingBody extends StatelessWidget {
  const _LoadingBody();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _ErrorBody extends StatelessWidget {
  final Object dataError;
  const _ErrorBody({required this.dataError});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Center(
        child: Text(
          'Unexpected error\n$dataError',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

extension on BuildContext {
  Data get data => watch();
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final data = context.data;
    return SingleChildScrollView(
      child: SafeArea(
        minimum: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _CoinBalance(),
            _CheckInStreak(),
            _WatchAd(),
            if (!data.isConnectedOnSocialMedia(SocialMedia.facebook))
              _ConnectOnSocialMedia(socialMedia: SocialMedia.facebook),
            if (data.isAnonymousUser) _CreateAccount(),
            // _InviteFriend(),
          ].divide(SizedBox(height: 16)),
        ),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
          width: 2.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Watch 2 ads to unlock',
                        textAlign: TextAlign.center,
                        style:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Figtree',
                                  letterSpacing: 0.0,
                                ),
                      ),
                    ].divide(SizedBox(width: 8.0)),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '{state.nWatchedAds}/2',
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily: 'Figtree',
                              letterSpacing: 0.0,
                            ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 2),
                        child: Image.asset(
                          'assets/images/ads_icon.png',
                          width: 30,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ].divide(SizedBox(width: 8)),
                  ),
                ].divide(SizedBox(height: 4.0)),
              ),
            ),
            Text('Trailing'),
          ].divide(SizedBox(width: 2.0)),
        ),
      ),
    );
  }
}

class _CoinBalance extends StatelessWidget {
  const _CoinBalance();

  @override
  Widget build(BuildContext context) {
    final data = context.data;
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Current balance: '),
          AnimatedFlipCounter(
            duration: Duration(seconds: 2),
            value: data.coinBalance,
            textStyle: DefaultTextStyle.of(context).style,
          ),
        ],
      ),
    );
  }
}

class _CheckInStreak extends StatefulWidget {
  const _CheckInStreak();

  @override
  State<_CheckInStreak> createState() => _CheckInStreakState();
}

class _CheckInStreakState extends State<_CheckInStreak> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final data = context.data.streakData;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Check-In Streak: ${data.nDays}'),
        Text('Check in daily to maintain your streak'),
        ElevatedButton(
          onPressed: _isLoading || data.didCheckInToday ? null : _onPressed,
          child: _isLoading
              ? _ButtonProgressIndicator()
              : data.didCheckInToday
                  ? Text('Check in again tomorrow')
                  : Text(
                      'Check in now (+${checkInStreakReward(streakDays: data.nDays)} coins)',
                    ),
        ),
      ],
    );
  }

  void _onPressed() async {
    if (_isLoading) return;
    setState(() => _isLoading = true);
    try {
      final reward = await context.bloc.reportStreakCheckIn();
      if (!mounted) return;
      if (reward > 0) {
        showRewardSuccessSnackBar(context: context, nCoins: reward);
      }
    } catch (e) {
      if (!mounted) return;
      showUnexpectedErrorStackBar(context: context, error: e);
    }
    setState(() => _isLoading = false);
  }
}

class _ButtonProgressIndicator extends StatelessWidget {
  const _ButtonProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(dimension: 20, child: CircularProgressIndicator());
  }
}

class _WatchAd extends StatefulWidget {
  const _WatchAd();

  @override
  State<_WatchAd> createState() => _WatchAdState();
}

class _WatchAdState extends State<_WatchAd> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: _isLoading ? null : _onPressed,
      icon: _isLoading
          ? _ButtonProgressIndicator()
          : SizedBox.square(
              dimension: 30, child: Image.asset('assets/images/ads_icon.png')),
      label: Text('Watch an ad (+$watchAdReward coins)'),
    );
  }

  void _onPressed() async {
    if (_isLoading) return;
    setState(() => _isLoading = true);
    try {
      final res = await context.bloc.watchAd();
      if (!mounted) return;
      if (res) {
        showRewardSuccessSnackBar(context: context, nCoins: watchAdReward);
      }
    } catch (e) {
      if (!mounted) return;
      showUnexpectedErrorStackBar(context: context, error: e);
    }
    setState(() => _isLoading = false);
  }
}

class _ConnectOnSocialMedia extends StatefulWidget {
  final SocialMedia socialMedia;

  const _ConnectOnSocialMedia({required this.socialMedia});

  @override
  State<_ConnectOnSocialMedia> createState() => _ConnectOnSocialMediaState();
}

class _ConnectOnSocialMediaState extends State<_ConnectOnSocialMedia> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final data = context.data;
    return ElevatedButton(
      onPressed: _isLoading || data.isConnectedOnSocialMedia(widget.socialMedia)
          ? null
          : _onPressed,
      child: _isLoading
          ? _ButtonProgressIndicator()
          : Text(
              '${widget.socialMedia.connectText()} (+$connectOnSocialMediaReward coins)'),
    );
  }

  void _onPressed() async {
    if (_isLoading) return;
    setState(() => _isLoading = true);
    try {
      await context.bloc.connectOnSocialMedia(widget.socialMedia);
      if (!mounted) return;
      showRewardSuccessSnackBar(
          context: context, nCoins: connectOnSocialMediaReward);
    } catch (e) {
      if (!mounted) return;
      showUnexpectedErrorStackBar(context: context, error: e);
    }
    setState(() => _isLoading = false);
  }
}

extension on SocialMedia {
  String connectText() => switch (this) {
        SocialMedia.facebook => 'Follow us on Facebook ',
        SocialMedia.instagram => 'Follow us on Instagram',
        SocialMedia.tikTok => 'Follow us on TikTok',
        SocialMedia.youTube => 'Subscribe to us on YouTube',
      };
}

class _CreateAccount extends StatelessWidget {
  const _CreateAccount();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        CreateAccountRewardHandler.isEnabled = true;
        GoRouter.of(context).pushNamed(AuthMainWidget.routeName);
      },
      child: Text('Create account (+$createAccountReward coins)'),
    );
  }
}

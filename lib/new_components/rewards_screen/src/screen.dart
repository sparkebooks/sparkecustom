import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sparke_kaleo/flutter_flow/flutter_flow_theme.dart';
import 'package:sparke_kaleo/flutter_flow/flutter_flow_util.dart';
import 'package:sparke_kaleo/main_screens/create_account/auth_main/auth_main_widget.dart';
import 'package:sparke_kaleo/new_components/rewards_screen/src/config.dart';
import 'package:sparke_kaleo/new_components/rewards_screen/src/handlers/create_account_reward_handler.dart';

import 'bloc.dart';
import 'data/social_media_connection_repo.dart/state.dart';
import 'state.dart';
import 'utils/coin_icon.dart';
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
        textTheme: GoogleFonts.ptSerifTextTheme(),
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          centerTitle: true,
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
      // floatingActionButton:
      //     FloatingActionButton(onPressed: () => sharedPreferences.clear()),
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
            if (data.isAnonymousUser) _CreateAccount(),
            // _InviteFriend(),
            if (!data.isConnectedOnSocialMedia(SocialMedia.facebook))
              _ConnectOnSocialMedia(socialMedia: SocialMedia.facebook),
          ].divide(SizedBox(height: 16)),
        ),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  final Widget child;

  const _Card({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
          width: 2.0,
        ),
      ),
      child: child,
    );
  }
}

class _CoinBalance extends StatelessWidget {
  const _CoinBalance();

  @override
  Widget build(BuildContext context) {
    final data = context.data;
    return Center(
      child: Column(
        children: [
          Text('Current Balance'),
          Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 4,
            children: [
              AnimatedFlipCounter(
                duration: Duration(seconds: 2),
                value: data.coinBalance,
                textStyle: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox.square(dimension: 35, child: CoinIcon()),
            ],
          ),
        ],
      ),
    );
  }
}

class _CoinIncreaseButton extends StatelessWidget {
  final int nCoins;
  final Function()? onPressed;
  final bool isLoading;
  const _CoinIncreaseButton(
      {required this.nCoins, required this.onPressed, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: onPressed,
        child: isLoading
            ? _ButtonProgressIndicator()
            : Row(
                spacing: 4,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AutoSizeText('+$nCoins'),
                  SizedBox.square(dimension: 25, child: CoinIcon()),
                ],
              ),
      ),
    );
  }
}

class _ButtonProgressIndicator extends StatelessWidget {
  const _ButtonProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(dimension: 20, child: CircularProgressIndicator());
  }
}

final _tilePadding = EdgeInsets.all(12);

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
    return _Card(
      child: ListTile(
        contentPadding: _tilePadding,
        title: AutoSizeText(
          'Check-In Streak: ${data.nDays} ${data.nDays == 1 ? 'day' : 'days'}',
          maxLines: 1,
        ),
        subtitle: AutoSizeText(
          data.didCheckInToday
              ? 'Check in again tomorrow'
              : 'Check in daily to maintain your streak',
          maxLines: 2,
        ),
        trailing: _CoinIncreaseButton(
          nCoins: checkInStreakReward(streakDays: data.nDays),
          onPressed: _isLoading || data.didCheckInToday ? null : _onPressed,
          isLoading: _isLoading,
        ),
      ),
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

class _WatchAd extends StatefulWidget {
  const _WatchAd();

  @override
  State<_WatchAd> createState() => _WatchAdState();
}

class _WatchAdState extends State<_WatchAd> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return _Card(
      child: ListTile(
        contentPadding: _tilePadding,
        title: Row(
          spacing: 8,
          children: [
            Flexible(
              child: AutoSizeText('Watch an ad', maxLines: 1),
            ),
            SizedBox.square(
                dimension: 30,
                child: Image.asset('assets/images/ads_icon.png')),
          ],
        ),
        trailing: _CoinIncreaseButton(
          nCoins: watchAdReward,
          isLoading: _isLoading,
          onPressed: _isLoading ? null : _onPressed,
        ),
      ),
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
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ad not available right now, please try later')),
      );
    }
    setState(() => _isLoading = false);
  }
}

class _CreateAccount extends StatelessWidget {
  const _CreateAccount();

  @override
  Widget build(BuildContext context) {
    return _Card(
      child: ListTile(
        contentPadding: _tilePadding,
        title: Text('Create an account'),
        trailing: _CoinIncreaseButton(
          nCoins: createAccountReward,
          onPressed: () {
            CreateAccountRewardHandler.isEnabled = true;
            GoRouter.of(context).pushNamed(AuthMainWidget.routeName);
          },
        ),
      ),
    );
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
    return _Card(
      child: ListTile(
        contentPadding: _tilePadding,
        title: AutoSizeText(
          widget.socialMedia.connectText(),
          maxLines: 1,
        ),
        trailing: _CoinIncreaseButton(
          nCoins: connectOnSocialMediaReward,
          onPressed:
              _isLoading || data.isConnectedOnSocialMedia(widget.socialMedia)
                  ? null
                  : _onPressed,
          isLoading: _isLoading,
        ),
      ),
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

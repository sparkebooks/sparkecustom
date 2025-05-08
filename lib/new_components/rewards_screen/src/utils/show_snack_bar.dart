import 'package:flutter/material.dart';
import 'package:sparke_kaleo/new_components/rewards_screen/src/utils/coin_icon.dart';

void showRewardSuccessSnackBar({
  required BuildContext context,
  required int nCoins,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        spacing: 4,
        children: [
          SizedBox.square(dimension: 25, child: CoinIcon()),
          Expanded(
            child: Text(
                "You've got a reward of $nCoins ${nCoins == 1 ? 'coin' : 'coins'}"),
          ),
        ],
      ),
    ),
  );
}

void showUnexpectedErrorStackBar({
  required BuildContext context,
  required Object error,
}) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Unexpected error\n$error')),
  );
}

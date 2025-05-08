import 'package:flutter/material.dart';

void showRewardSuccessSnackBar({
  required BuildContext context,
  required int nCoins,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
          'You got a reward of $nCoins ${nCoins == 1 ? 'coin' : 'coins'}!'),
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

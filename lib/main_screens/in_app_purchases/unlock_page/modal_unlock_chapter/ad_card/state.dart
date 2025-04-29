import 'package:equatable/equatable.dart';

class UiState extends Equatable {
  final bool isLoadingOrDisplayingAd;
  final int nWatchedAds;
  final Object? error;

  const UiState({
    required this.isLoadingOrDisplayingAd,
    required this.nWatchedAds,
    this.error,
  });

  @override
  List<Object?> get props => [isLoadingOrDisplayingAd, nWatchedAds];

  UiState copyWith(
          {bool? isLoadingOrDisplayingAd,
          int? nWatchedAds,
          Object? Function()? error}) =>
      UiState(
        isLoadingOrDisplayingAd:
            isLoadingOrDisplayingAd ?? this.isLoadingOrDisplayingAd,
        nWatchedAds: nWatchedAds ?? this.nWatchedAds,
        error: error == null ? this.error : error(),
      );
}

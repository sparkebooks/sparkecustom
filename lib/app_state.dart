import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _userBooksLastFetched = prefs.containsKey('ff_userBooksLastFetched')
          ? DateTime.fromMillisecondsSinceEpoch(
              prefs.getInt('ff_userBooksLastFetched')!)
          : _userBooksLastFetched;
    });
    _safeInit(() {
      _userBooksData = prefs
              .getStringList('ff_userBooksData')
              ?.map((x) {
                try {
                  return UserBooksDataStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _userBooksData;
    });
    _safeInit(() {
      _selectedTropes =
          prefs.getStringList('ff_selectedTropes') ?? _selectedTropes;
    });
    _safeInit(() {
      _age = prefs.getString('ff_age') ?? _age;
    });
    _safeInit(() {
      _selectedTypographyFamily =
          prefs.containsKey('ff_selectedTypographyFamily')
              ? deserializeEnum<SelectedTypography>(
                  prefs.getString('ff_selectedTypographyFamily'))
              : _selectedTypographyFamily;
    });
    _safeInit(() {
      _defaultTextSize =
          prefs.getDouble('ff_defaultTextSize') ?? _defaultTextSize;
    });
    _safeInit(() {
      _ageOptions = prefs.getStringList('ff_ageOptions') ?? _ageOptions;
    });
    _safeInit(() {
      _readingMode = prefs.getBool('ff_readingMode') ?? _readingMode;
    });
    _safeInit(() {
      _lastReadNotification = prefs.containsKey('ff_lastReadNotification')
          ? DateTime.fromMillisecondsSinceEpoch(
              prefs.getInt('ff_lastReadNotification')!)
          : _lastReadNotification;
    });
    _safeInit(() {
      _selectedFontFamily =
          prefs.getString('ff_selectedFontFamily') ?? _selectedFontFamily;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  DateTime? _userBooksLastFetched =
      DateTime.fromMillisecondsSinceEpoch(1731294420000);
  DateTime? get userBooksLastFetched => _userBooksLastFetched;
  set userBooksLastFetched(DateTime? value) {
    _userBooksLastFetched = value;
    value != null
        ? prefs.setInt('ff_userBooksLastFetched', value.millisecondsSinceEpoch)
        : prefs.remove('ff_userBooksLastFetched');
  }

  List<UserBooksDataStruct> _userBooksData = [];
  List<UserBooksDataStruct> get userBooksData => _userBooksData;
  set userBooksData(List<UserBooksDataStruct> value) {
    _userBooksData = value;
    prefs.setStringList(
        'ff_userBooksData', value.map((x) => x.serialize()).toList());
  }

  void addToUserBooksData(UserBooksDataStruct value) {
    userBooksData.add(value);
    prefs.setStringList(
        'ff_userBooksData', _userBooksData.map((x) => x.serialize()).toList());
  }

  void removeFromUserBooksData(UserBooksDataStruct value) {
    userBooksData.remove(value);
    prefs.setStringList(
        'ff_userBooksData', _userBooksData.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromUserBooksData(int index) {
    userBooksData.removeAt(index);
    prefs.setStringList(
        'ff_userBooksData', _userBooksData.map((x) => x.serialize()).toList());
  }

  void updateUserBooksDataAtIndex(
    int index,
    UserBooksDataStruct Function(UserBooksDataStruct) updateFn,
  ) {
    userBooksData[index] = updateFn(_userBooksData[index]);
    prefs.setStringList(
        'ff_userBooksData', _userBooksData.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInUserBooksData(int index, UserBooksDataStruct value) {
    userBooksData.insert(index, value);
    prefs.setStringList(
        'ff_userBooksData', _userBooksData.map((x) => x.serialize()).toList());
  }

  List<String> _selectedTropes = [];
  List<String> get selectedTropes => _selectedTropes;
  set selectedTropes(List<String> value) {
    _selectedTropes = value;
    prefs.setStringList('ff_selectedTropes', value);
  }

  void addToSelectedTropes(String value) {
    selectedTropes.add(value);
    prefs.setStringList('ff_selectedTropes', _selectedTropes);
  }

  void removeFromSelectedTropes(String value) {
    selectedTropes.remove(value);
    prefs.setStringList('ff_selectedTropes', _selectedTropes);
  }

  void removeAtIndexFromSelectedTropes(int index) {
    selectedTropes.removeAt(index);
    prefs.setStringList('ff_selectedTropes', _selectedTropes);
  }

  void updateSelectedTropesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    selectedTropes[index] = updateFn(_selectedTropes[index]);
    prefs.setStringList('ff_selectedTropes', _selectedTropes);
  }

  void insertAtIndexInSelectedTropes(int index, String value) {
    selectedTropes.insert(index, value);
    prefs.setStringList('ff_selectedTropes', _selectedTropes);
  }

  String _age = 'N/A';
  String get age => _age;
  set age(String value) {
    _age = value;
    prefs.setString('ff_age', value);
  }

  SelectedTypography? _selectedTypographyFamily = SelectedTypography.Figtree;
  SelectedTypography? get selectedTypographyFamily => _selectedTypographyFamily;
  set selectedTypographyFamily(SelectedTypography? value) {
    _selectedTypographyFamily = value;
    value != null
        ? prefs.setString('ff_selectedTypographyFamily', value.serialize())
        : prefs.remove('ff_selectedTypographyFamily');
  }

  double _defaultTextSize = 18.0;
  double get defaultTextSize => _defaultTextSize;
  set defaultTextSize(double value) {
    _defaultTextSize = value;
    prefs.setDouble('ff_defaultTextSize', value);
  }

  List<String> _ageOptions = [
    '18 - 24 years old',
    '25 - 34 years old',
    '35 - 44 years old',
    '45 - 54 years old',
    '54 - 64 years old',
    '65+ years old'
  ];
  List<String> get ageOptions => _ageOptions;
  set ageOptions(List<String> value) {
    _ageOptions = value;
    prefs.setStringList('ff_ageOptions', value);
  }

  void addToAgeOptions(String value) {
    ageOptions.add(value);
    prefs.setStringList('ff_ageOptions', _ageOptions);
  }

  void removeFromAgeOptions(String value) {
    ageOptions.remove(value);
    prefs.setStringList('ff_ageOptions', _ageOptions);
  }

  void removeAtIndexFromAgeOptions(int index) {
    ageOptions.removeAt(index);
    prefs.setStringList('ff_ageOptions', _ageOptions);
  }

  void updateAgeOptionsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    ageOptions[index] = updateFn(_ageOptions[index]);
    prefs.setStringList('ff_ageOptions', _ageOptions);
  }

  void insertAtIndexInAgeOptions(int index, String value) {
    ageOptions.insert(index, value);
    prefs.setStringList('ff_ageOptions', _ageOptions);
  }

  bool _readingMode = false;
  bool get readingMode => _readingMode;
  set readingMode(bool value) {
    _readingMode = value;
    prefs.setBool('ff_readingMode', value);
  }

  List<PagesStruct> _currentChapterPages = [];
  List<PagesStruct> get currentChapterPages => _currentChapterPages;
  set currentChapterPages(List<PagesStruct> value) {
    _currentChapterPages = value;
  }

  void addToCurrentChapterPages(PagesStruct value) {
    currentChapterPages.add(value);
  }

  void removeFromCurrentChapterPages(PagesStruct value) {
    currentChapterPages.remove(value);
  }

  void removeAtIndexFromCurrentChapterPages(int index) {
    currentChapterPages.removeAt(index);
  }

  void updateCurrentChapterPagesAtIndex(
    int index,
    PagesStruct Function(PagesStruct) updateFn,
  ) {
    currentChapterPages[index] = updateFn(_currentChapterPages[index]);
  }

  void insertAtIndexInCurrentChapterPages(int index, PagesStruct value) {
    currentChapterPages.insert(index, value);
  }

  DateTime? _lastReadNotification;
  DateTime? get lastReadNotification => _lastReadNotification;
  set lastReadNotification(DateTime? value) {
    _lastReadNotification = value;
    value != null
        ? prefs.setInt('ff_lastReadNotification', value.millisecondsSinceEpoch)
        : prefs.remove('ff_lastReadNotification');
  }

  List<int> _alreadyCalculatedImpressionsID = [];
  List<int> get alreadyCalculatedImpressionsID =>
      _alreadyCalculatedImpressionsID;
  set alreadyCalculatedImpressionsID(List<int> value) {
    _alreadyCalculatedImpressionsID = value;
  }

  void addToAlreadyCalculatedImpressionsID(int value) {
    alreadyCalculatedImpressionsID.add(value);
  }

  void removeFromAlreadyCalculatedImpressionsID(int value) {
    alreadyCalculatedImpressionsID.remove(value);
  }

  void removeAtIndexFromAlreadyCalculatedImpressionsID(int index) {
    alreadyCalculatedImpressionsID.removeAt(index);
  }

  void updateAlreadyCalculatedImpressionsIDAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    alreadyCalculatedImpressionsID[index] =
        updateFn(_alreadyCalculatedImpressionsID[index]);
  }

  void insertAtIndexInAlreadyCalculatedImpressionsID(int index, int value) {
    alreadyCalculatedImpressionsID.insert(index, value);
  }

  List<int> _alreadyFetchedABTestCoverAndBlurbIds = [];
  List<int> get alreadyFetchedABTestCoverAndBlurbIds =>
      _alreadyFetchedABTestCoverAndBlurbIds;
  set alreadyFetchedABTestCoverAndBlurbIds(List<int> value) {
    _alreadyFetchedABTestCoverAndBlurbIds = value;
  }

  void addToAlreadyFetchedABTestCoverAndBlurbIds(int value) {
    alreadyFetchedABTestCoverAndBlurbIds.add(value);
  }

  void removeFromAlreadyFetchedABTestCoverAndBlurbIds(int value) {
    alreadyFetchedABTestCoverAndBlurbIds.remove(value);
  }

  void removeAtIndexFromAlreadyFetchedABTestCoverAndBlurbIds(int index) {
    alreadyFetchedABTestCoverAndBlurbIds.removeAt(index);
  }

  void updateAlreadyFetchedABTestCoverAndBlurbIdsAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    alreadyFetchedABTestCoverAndBlurbIds[index] =
        updateFn(_alreadyFetchedABTestCoverAndBlurbIds[index]);
  }

  void insertAtIndexInAlreadyFetchedABTestCoverAndBlurbIds(
      int index, int value) {
    alreadyFetchedABTestCoverAndBlurbIds.insert(index, value);
  }

  String _selectedFontFamily = 'PT Serif';
  String get selectedFontFamily => _selectedFontFamily;
  set selectedFontFamily(String value) {
    _selectedFontFamily = value;
    prefs.setString('ff_selectedFontFamily', value);
  }

  bool _isBottomSheetOpen = false;
  bool get isBottomSheetOpen => _isBottomSheetOpen;
  set isBottomSheetOpen(bool value) {
    _isBottomSheetOpen = value;
  }

  bool _notificationScheduled = false;
  bool get notificationScheduled => _notificationScheduled;
  set notificationScheduled(bool value) {
    _notificationScheduled = value;
  }

  final _tropesManager = FutureRequestManager<List<TropesRow>>();
  Future<List<TropesRow>> tropes({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<TropesRow>> Function() requestFn,
  }) =>
      _tropesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearTropesCache() => _tropesManager.clear();
  void clearTropesCacheKey(String? uniqueKey) =>
      _tropesManager.clearRequest(uniqueKey);

  final _chaptersQueryManager = FutureRequestManager<List<ChaptersRow>>();
  Future<List<ChaptersRow>> chaptersQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<ChaptersRow>> Function() requestFn,
  }) =>
      _chaptersQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearChaptersQueryCache() => _chaptersQueryManager.clear();
  void clearChaptersQueryCacheKey(String? uniqueKey) =>
      _chaptersQueryManager.clearRequest(uniqueKey);

  final _bookQueriesManager = FutureRequestManager<List<BooksRow>>();
  Future<List<BooksRow>> bookQueries({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<BooksRow>> Function() requestFn,
  }) =>
      _bookQueriesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearBookQueriesCache() => _bookQueriesManager.clear();
  void clearBookQueriesCacheKey(String? uniqueKey) =>
      _bookQueriesManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

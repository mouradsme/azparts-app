import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      _cartItemsIds = prefs.getStringList('ff_cartItemsIds') ?? _cartItemsIds;
    });
    _safeInit(() {
      _cartItemsQtys =
          prefs.getStringList('ff_cartItemsQtys')?.map(int.parse).toList() ??
              _cartItemsQtys;
    });
    _safeInit(() {
      _FirstName = prefs.getString('ff_FirstName') ?? _FirstName;
    });
    _safeInit(() {
      _LastName = prefs.getString('ff_LastName') ?? _LastName;
    });
    _safeInit(() {
      _PhoneNumber = prefs.getString('ff_PhoneNumber') ?? _PhoneNumber;
    });
    _safeInit(() {
      _Address = prefs.getString('ff_Address') ?? _Address;
    });
    _safeInit(() {
      _image = prefs.getString('ff_image') ?? _image;
    });
    _safeInit(() {
      _history = prefs.getStringList('ff_history') ?? _history;
    });
    _safeInit(() {
      _notifCount = prefs.getInt('ff_notifCount') ?? _notifCount;
    });
    _safeInit(() {
      _favorits = prefs.getBool('ff_favorits') ?? _favorits;
    });
    _safeInit(() {
      _darkMode = prefs.getBool('ff_darkMode') ?? _darkMode;
    });
    _safeInit(() {
      _myFavorites = prefs.getStringList('ff_myFavorites') ?? _myFavorites;
    });
    _safeInit(() {
      _uuid = prefs.getString('ff_uuid') ?? _uuid;
    });
    _safeInit(() {
      _selectedWilaya = prefs.getString('ff_selectedWilaya') ?? _selectedWilaya;
    });
    _safeInit(() {
      _selectedCommune =
          prefs.getString('ff_selectedCommune') ?? _selectedCommune;
    });
    _safeInit(() {
      _selectedStopdesk =
          prefs.getString('ff_selectedStopdesk') ?? _selectedStopdesk;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _showClientDataPrompt = true;
  bool get showClientDataPrompt => _showClientDataPrompt;
  set showClientDataPrompt(bool value) {
    _showClientDataPrompt = value;
  }

  bool _T3 = false;
  bool get T3 => _T3;
  set T3(bool value) {
    _T3 = value;
  }

  bool _T4 = false;
  bool get T4 => _T4;
  set T4(bool value) {
    _T4 = value;
  }

  String _SelectedCategory = '';
  String get SelectedCategory => _SelectedCategory;
  set SelectedCategory(String value) {
    _SelectedCategory = value;
  }

  List<dynamic> _searchResults = [];
  List<dynamic> get searchResults => _searchResults;
  set searchResults(List<dynamic> value) {
    _searchResults = value;
  }

  void addToSearchResults(dynamic value) {
    _searchResults.add(value);
  }

  void removeFromSearchResults(dynamic value) {
    _searchResults.remove(value);
  }

  void removeAtIndexFromSearchResults(int index) {
    _searchResults.removeAt(index);
  }

  void updateSearchResultsAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    _searchResults[index] = updateFn(_searchResults[index]);
  }

  void insertAtIndexInSearchResults(int index, dynamic value) {
    _searchResults.insert(index, value);
  }

  dynamic _searchresultspage;
  dynamic get searchresultspage => _searchresultspage;
  set searchresultspage(dynamic value) {
    _searchresultspage = value;
  }

  List<String> _searchFiltersValues = [];
  List<String> get searchFiltersValues => _searchFiltersValues;
  set searchFiltersValues(List<String> value) {
    _searchFiltersValues = value;
  }

  void addToSearchFiltersValues(String value) {
    _searchFiltersValues.add(value);
  }

  void removeFromSearchFiltersValues(String value) {
    _searchFiltersValues.remove(value);
  }

  void removeAtIndexFromSearchFiltersValues(int index) {
    _searchFiltersValues.removeAt(index);
  }

  void updateSearchFiltersValuesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _searchFiltersValues[index] = updateFn(_searchFiltersValues[index]);
  }

  void insertAtIndexInSearchFiltersValues(int index, String value) {
    _searchFiltersValues.insert(index, value);
  }

  List<String> _cartItemsIdsNotPersisted = [];
  List<String> get cartItemsIdsNotPersisted => _cartItemsIdsNotPersisted;
  set cartItemsIdsNotPersisted(List<String> value) {
    _cartItemsIdsNotPersisted = value;
  }

  void addToCartItemsIdsNotPersisted(String value) {
    _cartItemsIdsNotPersisted.add(value);
  }

  void removeFromCartItemsIdsNotPersisted(String value) {
    _cartItemsIdsNotPersisted.remove(value);
  }

  void removeAtIndexFromCartItemsIdsNotPersisted(int index) {
    _cartItemsIdsNotPersisted.removeAt(index);
  }

  void updateCartItemsIdsNotPersistedAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _cartItemsIdsNotPersisted[index] =
        updateFn(_cartItemsIdsNotPersisted[index]);
  }

  void insertAtIndexInCartItemsIdsNotPersisted(int index, String value) {
    _cartItemsIdsNotPersisted.insert(index, value);
  }

  List<int> _cartItemsQtysNotPersisted = [];
  List<int> get cartItemsQtysNotPersisted => _cartItemsQtysNotPersisted;
  set cartItemsQtysNotPersisted(List<int> value) {
    _cartItemsQtysNotPersisted = value;
  }

  void addToCartItemsQtysNotPersisted(int value) {
    _cartItemsQtysNotPersisted.add(value);
  }

  void removeFromCartItemsQtysNotPersisted(int value) {
    _cartItemsQtysNotPersisted.remove(value);
  }

  void removeAtIndexFromCartItemsQtysNotPersisted(int index) {
    _cartItemsQtysNotPersisted.removeAt(index);
  }

  void updateCartItemsQtysNotPersistedAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    _cartItemsQtysNotPersisted[index] =
        updateFn(_cartItemsQtysNotPersisted[index]);
  }

  void insertAtIndexInCartItemsQtysNotPersisted(int index, int value) {
    _cartItemsQtysNotPersisted.insert(index, value);
  }

  List<String> _cartItemsIds = [];
  List<String> get cartItemsIds => _cartItemsIds;
  set cartItemsIds(List<String> value) {
    _cartItemsIds = value;
    prefs.setStringList('ff_cartItemsIds', value);
  }

  void addToCartItemsIds(String value) {
    _cartItemsIds.add(value);
    prefs.setStringList('ff_cartItemsIds', _cartItemsIds);
  }

  void removeFromCartItemsIds(String value) {
    _cartItemsIds.remove(value);
    prefs.setStringList('ff_cartItemsIds', _cartItemsIds);
  }

  void removeAtIndexFromCartItemsIds(int index) {
    _cartItemsIds.removeAt(index);
    prefs.setStringList('ff_cartItemsIds', _cartItemsIds);
  }

  void updateCartItemsIdsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _cartItemsIds[index] = updateFn(_cartItemsIds[index]);
    prefs.setStringList('ff_cartItemsIds', _cartItemsIds);
  }

  void insertAtIndexInCartItemsIds(int index, String value) {
    _cartItemsIds.insert(index, value);
    prefs.setStringList('ff_cartItemsIds', _cartItemsIds);
  }

  List<int> _cartItemsQtys = [];
  List<int> get cartItemsQtys => _cartItemsQtys;
  set cartItemsQtys(List<int> value) {
    _cartItemsQtys = value;
    prefs.setStringList(
        'ff_cartItemsQtys', value.map((x) => x.toString()).toList());
  }

  void addToCartItemsQtys(int value) {
    _cartItemsQtys.add(value);
    prefs.setStringList(
        'ff_cartItemsQtys', _cartItemsQtys.map((x) => x.toString()).toList());
  }

  void removeFromCartItemsQtys(int value) {
    _cartItemsQtys.remove(value);
    prefs.setStringList(
        'ff_cartItemsQtys', _cartItemsQtys.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromCartItemsQtys(int index) {
    _cartItemsQtys.removeAt(index);
    prefs.setStringList(
        'ff_cartItemsQtys', _cartItemsQtys.map((x) => x.toString()).toList());
  }

  void updateCartItemsQtysAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    _cartItemsQtys[index] = updateFn(_cartItemsQtys[index]);
    prefs.setStringList(
        'ff_cartItemsQtys', _cartItemsQtys.map((x) => x.toString()).toList());
  }

  void insertAtIndexInCartItemsQtys(int index, int value) {
    _cartItemsQtys.insert(index, value);
    prefs.setStringList(
        'ff_cartItemsQtys', _cartItemsQtys.map((x) => x.toString()).toList());
  }

  String _FirstName = '';
  String get FirstName => _FirstName;
  set FirstName(String value) {
    _FirstName = value;
    prefs.setString('ff_FirstName', value);
  }

  String _LastName = '';
  String get LastName => _LastName;
  set LastName(String value) {
    _LastName = value;
    prefs.setString('ff_LastName', value);
  }

  String _PhoneNumber = '';
  String get PhoneNumber => _PhoneNumber;
  set PhoneNumber(String value) {
    _PhoneNumber = value;
    prefs.setString('ff_PhoneNumber', value);
  }

  String _Address = '';
  String get Address => _Address;
  set Address(String value) {
    _Address = value;
    prefs.setString('ff_Address', value);
  }

  String _searchQuery = '';
  String get searchQuery => _searchQuery;
  set searchQuery(String value) {
    _searchQuery = value;
  }

  String _image = '';
  String get image => _image;
  set image(String value) {
    _image = value;
    prefs.setString('ff_image', value);
  }

  List<double> _itemTotalPrices = [];
  List<double> get itemTotalPrices => _itemTotalPrices;
  set itemTotalPrices(List<double> value) {
    _itemTotalPrices = value;
  }

  void addToItemTotalPrices(double value) {
    _itemTotalPrices.add(value);
  }

  void removeFromItemTotalPrices(double value) {
    _itemTotalPrices.remove(value);
  }

  void removeAtIndexFromItemTotalPrices(int index) {
    _itemTotalPrices.removeAt(index);
  }

  void updateItemTotalPricesAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    _itemTotalPrices[index] = updateFn(_itemTotalPrices[index]);
  }

  void insertAtIndexInItemTotalPrices(int index, double value) {
    _itemTotalPrices.insert(index, value);
  }

  List<double> _updatedCart = [];
  List<double> get updatedCart => _updatedCart;
  set updatedCart(List<double> value) {
    _updatedCart = value;
  }

  void addToUpdatedCart(double value) {
    _updatedCart.add(value);
  }

  void removeFromUpdatedCart(double value) {
    _updatedCart.remove(value);
  }

  void removeAtIndexFromUpdatedCart(int index) {
    _updatedCart.removeAt(index);
  }

  void updateUpdatedCartAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    _updatedCart[index] = updateFn(_updatedCart[index]);
  }

  void insertAtIndexInUpdatedCart(int index, double value) {
    _updatedCart.insert(index, value);
  }

  bool _CartUpdated = false;
  bool get CartUpdated => _CartUpdated;
  set CartUpdated(bool value) {
    _CartUpdated = value;
  }

  List<int> _itemTotalQtys = [];
  List<int> get itemTotalQtys => _itemTotalQtys;
  set itemTotalQtys(List<int> value) {
    _itemTotalQtys = value;
  }

  void addToItemTotalQtys(int value) {
    _itemTotalQtys.add(value);
  }

  void removeFromItemTotalQtys(int value) {
    _itemTotalQtys.remove(value);
  }

  void removeAtIndexFromItemTotalQtys(int index) {
    _itemTotalQtys.removeAt(index);
  }

  void updateItemTotalQtysAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    _itemTotalQtys[index] = updateFn(_itemTotalQtys[index]);
  }

  void insertAtIndexInItemTotalQtys(int index, int value) {
    _itemTotalQtys.insert(index, value);
  }

  List<String> _itemTotalIds = [];
  List<String> get itemTotalIds => _itemTotalIds;
  set itemTotalIds(List<String> value) {
    _itemTotalIds = value;
  }

  void addToItemTotalIds(String value) {
    _itemTotalIds.add(value);
  }

  void removeFromItemTotalIds(String value) {
    _itemTotalIds.remove(value);
  }

  void removeAtIndexFromItemTotalIds(int index) {
    _itemTotalIds.removeAt(index);
  }

  void updateItemTotalIdsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _itemTotalIds[index] = updateFn(_itemTotalIds[index]);
  }

  void insertAtIndexInItemTotalIds(int index, String value) {
    _itemTotalIds.insert(index, value);
  }

  List<String> _history = [];
  List<String> get history => _history;
  set history(List<String> value) {
    _history = value;
    prefs.setStringList('ff_history', value);
  }

  void addToHistory(String value) {
    _history.add(value);
    prefs.setStringList('ff_history', _history);
  }

  void removeFromHistory(String value) {
    _history.remove(value);
    prefs.setStringList('ff_history', _history);
  }

  void removeAtIndexFromHistory(int index) {
    _history.removeAt(index);
    prefs.setStringList('ff_history', _history);
  }

  void updateHistoryAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _history[index] = updateFn(_history[index]);
    prefs.setStringList('ff_history', _history);
  }

  void insertAtIndexInHistory(int index, String value) {
    _history.insert(index, value);
    prefs.setStringList('ff_history', _history);
  }

  int _lastvi = 1;
  int get lastvi => _lastvi;
  set lastvi(int value) {
    _lastvi = value;
  }

  int _notifCount = 0;
  int get notifCount => _notifCount;
  set notifCount(int value) {
    _notifCount = value;
    prefs.setInt('ff_notifCount', value);
  }

  List<int> _NavHistory = [1, 1];
  List<int> get NavHistory => _NavHistory;
  set NavHistory(List<int> value) {
    _NavHistory = value;
  }

  void addToNavHistory(int value) {
    _NavHistory.add(value);
  }

  void removeFromNavHistory(int value) {
    _NavHistory.remove(value);
  }

  void removeAtIndexFromNavHistory(int index) {
    _NavHistory.removeAt(index);
  }

  void updateNavHistoryAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    _NavHistory[index] = updateFn(_NavHistory[index]);
  }

  void insertAtIndexInNavHistory(int index, int value) {
    _NavHistory.insert(index, value);
  }

  bool _favorits = false;
  bool get favorits => _favorits;
  set favorits(bool value) {
    _favorits = value;
    prefs.setBool('ff_favorits', value);
  }

  bool _darkMode = false;
  bool get darkMode => _darkMode;
  set darkMode(bool value) {
    _darkMode = value;
    prefs.setBool('ff_darkMode', value);
  }

  List<String> _myFavorites = [];
  List<String> get myFavorites => _myFavorites;
  set myFavorites(List<String> value) {
    _myFavorites = value;
    prefs.setStringList('ff_myFavorites', value);
  }

  void addToMyFavorites(String value) {
    _myFavorites.add(value);
    prefs.setStringList('ff_myFavorites', _myFavorites);
  }

  void removeFromMyFavorites(String value) {
    _myFavorites.remove(value);
    prefs.setStringList('ff_myFavorites', _myFavorites);
  }

  void removeAtIndexFromMyFavorites(int index) {
    _myFavorites.removeAt(index);
    prefs.setStringList('ff_myFavorites', _myFavorites);
  }

  void updateMyFavoritesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _myFavorites[index] = updateFn(_myFavorites[index]);
    prefs.setStringList('ff_myFavorites', _myFavorites);
  }

  void insertAtIndexInMyFavorites(int index, String value) {
    _myFavorites.insert(index, value);
    prefs.setStringList('ff_myFavorites', _myFavorites);
  }

  bool _OnboardingAccessed = false;
  bool get OnboardingAccessed => _OnboardingAccessed;
  set OnboardingAccessed(bool value) {
    _OnboardingAccessed = value;
  }

  int _cartLastDeleted = 0;
  int get cartLastDeleted => _cartLastDeleted;
  set cartLastDeleted(int value) {
    _cartLastDeleted = value;
  }

  int _cartCurrentDeleted = 0;
  int get cartCurrentDeleted => _cartCurrentDeleted;
  set cartCurrentDeleted(int value) {
    _cartCurrentDeleted = value;
  }

  String _uuid = '';
  String get uuid => _uuid;
  set uuid(String value) {
    _uuid = value;
    prefs.setString('ff_uuid', value);
  }

  int _feesStopDesk = 0;
  int get feesStopDesk => _feesStopDesk;
  set feesStopDesk(int value) {
    _feesStopDesk = value;
  }

  int _feesHome = 0;
  int get feesHome => _feesHome;
  set feesHome(int value) {
    _feesHome = value;
  }

  bool _placeorderbutton = false;
  bool get placeorderbutton => _placeorderbutton;
  set placeorderbutton(bool value) {
    _placeorderbutton = value;
  }

  double _DeliveryFees = 0.0;
  double get DeliveryFees => _DeliveryFees;
  set DeliveryFees(double value) {
    _DeliveryFees = value;
  }

  bool _T1 = true;
  bool get T1 => _T1;
  set T1(bool value) {
    _T1 = value;
  }

  bool _isStopDesk = true;
  bool get isStopDesk => _isStopDesk;
  set isStopDesk(bool value) {
    _isStopDesk = value;
  }

  bool _T2 = false;
  bool get T2 => _T2;
  set T2(bool value) {
    _T2 = value;
  }

  String _selectedWilaya = 'Adrar';
  String get selectedWilaya => _selectedWilaya;
  set selectedWilaya(String value) {
    _selectedWilaya = value;
    prefs.setString('ff_selectedWilaya', value);
  }

  String _selectedCommune = 'Adrar';
  String get selectedCommune => _selectedCommune;
  set selectedCommune(String value) {
    _selectedCommune = value;
    prefs.setString('ff_selectedCommune', value);
  }

  String _selectedStopdesk = 'Agence de Adrar';
  String get selectedStopdesk => _selectedStopdesk;
  set selectedStopdesk(String value) {
    _selectedStopdesk = value;
    prefs.setString('ff_selectedStopdesk', value);
  }
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

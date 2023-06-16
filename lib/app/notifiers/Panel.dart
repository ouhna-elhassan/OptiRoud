import 'package:provider/provider.dart'; 
import 'package:flutter/material.dart';
import '../models/order.dart';
import '../const/consts.dart';

class CartModel extends ChangeNotifier {
  /// Internal, private state of the cart.
  final List<Order> _items = [];
  List<Map<String,dynamic>> searchedList = [];
  String _searchValue = '';
  final List<Map<String,dynamic>> _busList = ListBus;
  List<Map<String,dynamic>> _tramList = tram;
  List<Map<String,dynamic>> _taxiList = taxi;
  /// An unmodifiable view of the items in the cart.
  //UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  /// The current total price of all items (assuming all items cost $42).
  int get totalPrice => _items.length * 42;
  int get len => _items.length;
  List get orders => _items;
  int get total => _total();
  String get searchValue => _searchValue;
  List<Map<String, dynamic>> get getsearchedList => searchedList;
  /// Adds [item] to cart. This and [removeAll] are the only ways to modify the
  /// cart from the outside.
  void add(Order item) {
    _items.add(item);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  set searchValue(String search) {
    _searchValue = search;
    notifyListeners();
  }

  void setSearchedList(String search, int type) {
    searchedList = [];
    if(search == '') {
      print('#########################');
      if(type==1){searchedList = _busList;}
      else if(type==2){searchedList = _tramList;}
      else{searchedList = _taxiList;}
    } 
    else {
      print('#########################1');
      if(type==1){
        
        _busList.forEach((product) {
          if((product["origine"].toLowerCase().contains(search.toLowerCase())) || (product["Terminus"].toLowerCase().contains(search.toLowerCase()))) {
            searchedList.add(product);
          }
        });
      }
      else if(type==2){
        _tramList.forEach((product) {
          if((product["origine"].toLowerCase().contains(search.toLowerCase())) || (product["Terminus"].toLowerCase().contains(search.toLowerCase()))) {
            searchedList.add(product);
          }
        });
      }
      else{
        _taxiList.forEach((product) {
          if((product["origine"].toLowerCase().contains(search.toLowerCase())) || (product["Terminus"].toLowerCase().contains(search.toLowerCase()))) {
            searchedList.add(product);
          }
        });
      }
      
    }
    notifyListeners();
  }

  /// Removes all items from the cart.
  void removeAll() {
    _items.clear();
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  int _total(){
    int t = 0;
    for(int i = 0;i<_items.length;i++){
      t+=_items[i].total;
    }
    return t;
  }

  void update(Order order){
    _items.remove(order);
    notifyListeners();
  }
  void updateO(int index, int t){
    _items[index].tickets = t;
    notifyListeners();
  }
}
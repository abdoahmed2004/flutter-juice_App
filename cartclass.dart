import 'package:flutter/material.dart';

class CartItem {
  final String name;
  final double price;
  int quantity;

  CartItem({required this.name, required this.price, this.quantity = 1});
}

class CartModel extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(CartItem item) {
    // Check if the item already exists in the cart
    for (var existingItem in _items) {
      if (existingItem.name == item.name) {
        existingItem.quantity ++;
        notifyListeners();
        return;
      }
    }
     _items.add(item);
    notifyListeners();
  }
void removeItem(CartItem item) {
  for (var existingItem in _items) {
    if (existingItem.name == item.name) {
      if (existingItem.quantity > 1) {
        existingItem.quantity--;
      } else if(existingItem.quantity <= 1) {
        _items.remove(existingItem);
      }
      notifyListeners();
      return;
    }
  }
}
  double get totalPrice =>
      _items.fold(0, (total, item) => total + item.price * item.quantity);
}

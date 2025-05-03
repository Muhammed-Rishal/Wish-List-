import 'package:flutter/material.dart';

class TaskProvider extends ChangeNotifier {
  List<String> fruitImageUrls = [
    "https://cdn.pixabay.com/photo/2017/06/27/22/21/banana-2449019_640.jpg",
    "https://cdn.pixabay.com/photo/2017/01/20/15/06/oranges-1995056_640.jpg",
    "https://cdn.pixabay.com/photo/2016/11/30/15/00/apples-1872997_640.jpg",
    "https://cdn.pixabay.com/photo/2018/04/29/11/54/strawberries-3359755_640.jpg",
    "https://cdn.pixabay.com/photo/2016/03/05/22/18/food-1239241_640.jpg",
    "https://cdn.pixabay.com/photo/2017/02/05/12/31/lemons-2039830_640.jpg",
    "https://cdn.pixabay.com/photo/2016/01/05/13/58/apple-1122537_640.jpg",
    "https://www.debon.co.in/cdn/shop/files/FreshBlueberry_9f77e069-246f-46ac-9c0b-9625111fc42e.png?v=1688018229",
    "https://m.media-amazon.com/images/I/71cs5TNn-LL._AC_UF1000,1000_QL80_.jpg"
  ];

  List<String> fruits = [
    " Banana",
    " Orange",
    " Apple",
    " Strawberry",
    " Mango",
    " Lemon",
    " Green Apple",
    " Blueberry",
    " Avocado"
  ];


  List<int> _wishlist = [];

  List<int> get wishlist => _wishlist;

  void toggleWishlist(int index) {
    if (_wishlist.contains(index)) {
      _wishlist.remove(index);
    } else {
      _wishlist.add(index);
    }
    notifyListeners();
  }

  bool isInWishlist(int index) {
    return _wishlist.contains(index);
  }
}

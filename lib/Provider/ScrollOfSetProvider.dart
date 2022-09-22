
import 'package:flutter/cupertino.dart';

class ScrollOfSetProvider extends ChangeNotifier{
  double _scrollofset=0.0;
  double get scrollofset=>_scrollofset;

  void setOffset(double offset){
    _scrollofset=offset;
    notifyListeners();
  }
}
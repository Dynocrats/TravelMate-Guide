import 'package:flutter/material.dart';

class PostViewBloc extends ChangeNotifier{
  String guiderPlaceName, guiderPrice, guiderDesc, guiderLocation, guiderPlaceImageUrl;

  setPostViewBloc({String guiderPlaceName, String guiderPrice, String guiderDesc, String guiderLocation, String guiderPlaceImageUrl}){
    this.guiderPlaceName = guiderPlaceName;
    this.guiderPrice = guiderPrice;
    this.guiderDesc = guiderDesc;
    this.guiderPlaceImageUrl = guiderPlaceImageUrl;
    this.guiderLocation = guiderLocation;
    notifyListeners();
  }

  changePostViewBloc({String guiderPlaceName, String guiderPrice, String guiderDesc, String guiderLocation, String guiderPlaceImageUrl}){
    this.guiderPlaceName = guiderPlaceName;
    this.guiderPrice = guiderPrice;
    this.guiderDesc = guiderDesc;
    this.guiderPlaceImageUrl = guiderPlaceImageUrl;
    this.guiderLocation = guiderLocation;
    notifyListeners();
  }

  getGuiderPlaceName() => guiderPlaceName;
  getGuiderPrice() => guiderPrice;
  getGuiderDesc() => guiderDesc;
  getGuiderPlaceImageUrl() => guiderPlaceImageUrl;
  getGuiderLocation() => guiderLocation;
  
}
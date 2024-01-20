part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState{}

// ignore: must_be_immutable
class HomeSuccess extends HomeState{
  List<ProductModel> productList;

  HomeSuccess({required this.productList});

}

class HomeError extends HomeState{}
import 'package:bloc/bloc.dart';
import 'package:fake_product/scr/api/product_repository.dart';
import 'package:flutter/material.dart';

import '../api/product_model.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<HomeLoadingData>((event, emit) async {
      emit(HomeLoading());
      try {
        final result = await ProductRepository().getProduct();
        if(result != []){
          emit(HomeSuccess(productList: result));
        }else{
          emit(HomeError());
        }
      } catch (e) {
        emit(HomeError());
      }
    });
  }
}

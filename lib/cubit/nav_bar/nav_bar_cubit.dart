import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:recycling_machine/constants/assets.dart';
import 'package:recycling_machine/views/home_view.dart';
import 'package:recycling_machine/views/map_view.dart';
import 'package:recycling_machine/views/qr_view.dart';

part 'nav_bar_state.dart';

class NavBarCubit extends Cubit<NavBarState> {
  NavBarCubit() : super(NavBarInitial());

  static NavBarCubit get(context)=>BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems=const[
    BottomNavigationBarItem(icon: Icon(Icons.info_outline,),label:"Home"),
    BottomNavigationBarItem(icon: Icon(Icons.location_on_outlined,),label: 'Map'),
    BottomNavigationBarItem(icon: Icon(Icons.qr_code,),label: 'QR'),
  ];

 List<Widget> screen=[
   HomeView(),
   MapView(),
   QRScannerView()
 ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(NewsBottomNavState());
  }

}

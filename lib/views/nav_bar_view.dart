
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants/app_colors.dart';
import '../cubit/nav_bar/nav_bar_cubit.dart';


class NavBarView extends StatelessWidget {
  const NavBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavBarCubit,NavBarState>(listener: (context,state){},builder: (context,state){
      var cubit=NavBarCubit.get(context);
      return Scaffold(
        backgroundColor: Colors.green[100],
        body: cubit.screen[cubit.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 30,
          unselectedIconTheme:const IconThemeData(
            color: AppColors.kMainColor
          ),
          backgroundColor:AppColors.whiteBlue,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          currentIndex: cubit.currentIndex,
          onTap: (index){
            cubit.changeBottomNavBar(index);
          },
          items: cubit.bottomItems,
        ),
      );
    } );
  }
}

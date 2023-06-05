import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recycling_machine/cubit/authentication/authentication_cubit.dart';
import 'package:recycling_machine/cubit/nav_bar/nav_bar_cubit.dart';
import 'package:recycling_machine/service/dio_helper/dio_helper.dart';
import 'package:recycling_machine/service/sp_helper/sp_helper.dart';
import 'package:recycling_machine/views/splash_view.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await SharedPreferenceHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
    minTextAdapt: true,
    splitScreenMode: true,

    builder: (context,child){
     return MultiBlocProvider(
       providers: [
         BlocProvider(create: (context)=>AuthenticationCubit()),
         BlocProvider(create: (context)=>NavBarCubit()),
       ],
       child: MaterialApp(
         theme: ThemeData(
           useMaterial3: true
         ),
         debugShowCheckedModeBanner: false,
        home: SplashView(),
    ),
     );
  },
    );
  }
  }

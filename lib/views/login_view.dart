import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recycling_machine/components/custome_text_field.dart';
import 'package:recycling_machine/components/main_button.dart';
import 'package:recycling_machine/constants/app_colors.dart';
import 'package:recycling_machine/constants/assets.dart';
import 'package:recycling_machine/cubit/authentication/authentication_cubit.dart';
import 'package:recycling_machine/views/nav_bar_view.dart';
import 'package:recycling_machine/views/register_view.dart';

import '../utils/toast.dart';
import '../utils/toast_states.dart';


class LoginView extends StatelessWidget {
   LoginView({Key? key}) : super(key: key);

  final GlobalKey<FormState>_globalKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit,AuthenticationState>(listener:(context,state){
      if(state is AuthenticationLoginError){
        ToastConfig.showToast(msg: 'enter a valid data', toastStates: ToastStates.Error);
      }
      if(state is AuthenticationLoginSuccess){
        ToastConfig.showToast(msg: 'Login success', toastStates: ToastStates.Success);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const NavBarView()));
      }
    },builder: (context,state){
      var cubit=AuthenticationCubit.get(context);
      return SafeArea(
        child: Scaffold(
          body: Form(
            key: _globalKey,
            child:SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20.h,),
                  Image.asset(logo,height: 150.r,),
                  CustomeTextField(label: 'Email', controller:cubit.emailController , icon:Icons.email),
                  CustomeTextField(label: 'Password', controller:cubit.passwordController , icon:Icons.password,isPassword: true),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10.0.w,vertical: 5.h),
                    child:const Align(alignment: Alignment.bottomRight,child: Text('Forgot Password?')),
                  ),
                  state is AuthenticationLoginLoading?const CircularProgressIndicator(color: AppColors.kMainColor,):
                  MainButton(label:'Sign up', function: (){
                   _globalKey.currentState?.validate();
                    cubit.login();
                  }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [const Text('Don\'t have an account yet?'),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterView()));
                      }, child:const Text('Register Now'))],
                  )
                ],
              ),
            ) ,

          ),
        ),
      );
    });
  }
}

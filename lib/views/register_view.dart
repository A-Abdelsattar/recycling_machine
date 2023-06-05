import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recycling_machine/components/custome_text_field.dart';
import 'package:recycling_machine/components/main_button.dart';
import 'package:recycling_machine/constants/app_colors.dart';
import 'package:recycling_machine/constants/assets.dart';
import 'package:recycling_machine/cubit/authentication/authentication_cubit.dart';
import 'package:recycling_machine/utils/toast.dart';
import 'package:recycling_machine/utils/toast_states.dart';
import 'package:recycling_machine/views/login_view.dart';
import 'package:recycling_machine/views/nav_bar_view.dart';


class RegisterView extends StatelessWidget {
   RegisterView({Key? key}) : super(key: key);

  final GlobalKey<FormState>_globalKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit,AuthenticationState>(listener:(context,state){
      if(state is AuthenticationRegisterError){
        ToastConfig.showToast(msg: 'enter a valid data', toastStates: ToastStates.Error);
      }
      if(state is AuthenticationRegisterSuccess){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const NavBarView()));
        ToastConfig.showToast(msg: 'Register Success', toastStates: ToastStates.Success);

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
                  CustomeTextField(label: 'User Name', controller:cubit.nameController , icon:Icons.person),
                  CustomeTextField(label: 'Email', controller:cubit.emailController , icon:Icons.email),
                  CustomeTextField(label: 'Password', controller:cubit.passwordController , icon:Icons.password,isPassword: true,),

                  CustomeTextField(label: 'Phone number', controller:cubit.phoneController , icon:Icons.phone_outlined),
                  state is AuthenticationRegisterLoading?const CircularProgressIndicator(color: AppColors.kMainColor,):
                  MainButton(label: 'Sign up', function: (){
                    _globalKey.currentState?.validate();
                    cubit.register();
                  }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [const Text('Already have an account?'),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginView()));
                    }, child:const Text('Sign in'))],
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

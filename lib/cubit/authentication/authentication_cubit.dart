import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/end_points.dart';
import '../../models/authentication_model.dart';
import '../../service/dio_helper/dio_helper.dart';
import '../../service/sp_helper/sp_helper.dart';
import '../../service/sp_helper/sp_keys.dart';


part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());

  static AuthenticationCubit get(context) => BlocProvider.of(context);
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState>globalKey=GlobalKey<FormState>();


  AuthenticationModel? authenticationModel;

  register() {
    emit(AuthenticationRegisterLoading());
    DioHelper.postData(url: registerEndPoint, data: {
      "name": nameController.text,
      "email": emailController.text,
      "password": passwordController.text
    }).then((value) {
      authenticationModel = AuthenticationModel.fromJson(value.data);
      SharedPreferenceHelper.saveData(
          key: SharedPreferencesKeys.token,
          value: authenticationModel!.authorisation!.token);
      emit(AuthenticationRegisterSuccess());
      nameController.clear();
      emailController.clear();
      passwordController.clear();
    }).catchError((error) {
      emit(AuthenticationRegisterError());
      print(error);
    });
  }

  login() {
    emit(AuthenticationLoginLoading());
    DioHelper.postData(url: 'login', data: {
      "email": emailController.text,
      "password": passwordController.text
    }).then((value) {
      authenticationModel = AuthenticationModel.fromJson(value.data);
      SharedPreferenceHelper.saveData(
          key: SharedPreferencesKeys.token,
          value: authenticationModel!.authorisation!.token);
      emit(AuthenticationLoginSuccess());
      emailController.clear();
      passwordController.clear();
    }).catchError((error){
      print(error);
      emit(AuthenticationLoginError());
    });
  }


}

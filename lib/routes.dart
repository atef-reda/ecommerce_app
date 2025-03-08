import 'package:ecommerce_app/core/middleware/mymiddleware.dart';
import 'package:ecommerce_app/view/screen/auth/login.dart';
import 'package:ecommerce_app/view/screen/auth/signup.dart';
import 'package:ecommerce_app/view/screen/forget_password/success_resetpassword.dart';
import 'package:ecommerce_app/view/screen/auth/success_signup.dart';
import 'package:ecommerce_app/view/screen/auth/verifycodesignup.dart';
import 'package:ecommerce_app/view/screen/homescreen.dart';
import 'package:ecommerce_app/view/screen/language.dart';
import 'package:ecommerce_app/view/screen/onboarding.dart';
import 'package:get/get.dart';
import 'core/constant/routes.dart';
import 'view/screen/auth/checkemail.dart';
import 'view/screen/forget_password/forgetpassword.dart';
import 'view/screen/forget_password/resetpassword.dart';
import 'view/screen/forget_password/verifycode.dart';

List<GetPage<dynamic>>? getPages =[
  //OnBording
  GetPage(name: AppRoutes.language, page:()=> const Language(),middlewares: [Mymiddleware()]),
  GetPage(name: AppRoutes.onBoarding, page:()=> const OnBoarding()),
  //Auth
  GetPage(name: AppRoutes.login, page:()=> const Login()),
  GetPage(name: AppRoutes.signUp, page:()=> const Signup()),
  GetPage(name: AppRoutes.resetPassword, page:()=> const ResetPassword()),
  GetPage(name: AppRoutes.forgetPassword, page:()=> const ForgetPassword()),
  GetPage(name: AppRoutes.verifyCode, page:()=> const VerifyCode()),
  GetPage(name: AppRoutes.successResetPassword, page:()=> const SuccessResetpassword()),
  GetPage(name: AppRoutes.successSignUp, page:()=> const SuccessSignup()),
  GetPage(name: AppRoutes.checkEmail, page:()=> const CheckEmail()),
  GetPage(name: AppRoutes.verifyCodeSignUp, page:()=> const VerifyCodeSignUp()),
  //App
  GetPage(name: AppRoutes.homepage, page:()=>  HomeScreen()),
];

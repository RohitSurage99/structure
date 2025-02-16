// import 'package:flutter/gestures.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gib_leads_web/screens/social_login/google_sign_in_button.dart';
// import '../../components/app_button.dart';
// import '../../components/common_widgets.dart';
// import '../../components/loading_indicator.dart';
// import '../../components/responsive_widget.dart';
// import '../../components/text_fiels.dart';
// import '../../cubits/sign_in/sign_in_cubit.dart';
// import '../../export.dart';
// import '../../routes/routes_name.dart';
// import '../common_widgets/footer.dart';
// import '../common_widgets/header.dart';
// import '../common_widgets/header_banner_widget.dart';
// import '../common_widgets/header_without_tabs.dart';
//
// class SignInScreen extends StatefulWidget {
//   const SignInScreen({super.key});
//
//   @override
//   State<SignInScreen> createState() => _SignInScreenState();
// }
//
// class _SignInScreenState extends State<SignInScreen> {
//   bool isWebView = false;
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final FocusNode emailFocusNode = FocusNode();
//   final FocusNode passwordFocusNode = FocusNode();
//   bool rememberMe = false;
//   bool isGoogleLoading = false;
//
//   @override
//   Widget build(BuildContext context) {
//     isWebView = MediaQuery.of(context).size.width > minimumScreenWidth;
//     return Scaffold(
//       body: ListView(
//         children: [
//            //const SiteHeader(page: Pages.signIn),
//           const SiteHeaderWithTabs(page: Pages.signIn),
//           HeaderBannerWidget(pageName: StringHelper.signIn,isWebView: isWebView),
//           vGap(30),
//           ResponsiveWidget(largeScreen: Row(
//             children: [
//               const Spacer(),
//               Expanded(flex: 2,
//                   child: formAllView()),
//               const Spacer(),
//             ],
//           ),
//               mediumScreen:  Row(
//             children: [
//               const Spacer(),
//               Expanded(
//                   flex: 2,
//                   child: formAllView()),
//               const Spacer(),
//             ],
//           ),
//               smallScreen: formAllView()),
//           SiteFooter(),
//         ],
//       ),
//     );
//   }
//
//   formAllView(){
//     return Column(
//       children: [
//
//         Text(
//           StringHelper.signin,
//           style: primary35_700(),
//           textAlign: TextAlign.center,
//         ),
//         vGap(26),
//         signupLink(),
//         vGap(50),
//         SizedBox(
//         //  width: isWebView ? minimumScreenWidth - 800 : null,
//           child: _form(),
//         ),
//         vGap(50),
//         _socialLogins()
//       ],
//     );
//   }
//
//   _form() {
//     return Form(
//       key: _formKey,
//       autovalidateMode: AutovalidateMode.disabled,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           TextView(
//             StringHelper.email,
//             style: hintTextColor18_600().copyWith(color: blackSimilar),
//           ),
//           vGap(8),
//
//          EmailTextField(
//              controller: emailController,
//            currentFocus: emailFocusNode,
//            nextFocus: passwordFocusNode,
//          ),
//           vGap(24),
//           TextView(
//             StringHelper.password,
//             style: hintTextColor18_600().copyWith(color: blackSimilar),
//           ),
//           vGap(8),
//
//           PasswordTextField(
//               controller: passwordController,
//           currentFocus: passwordFocusNode,),
//
//
//           vGap(18),
//           StatefulBuilder(builder: (context, setStatee) {
//             return Row(
//               children: [
//                 hGap(6.0),
//                 Container(
//                   height: 15,
//                   width: 15,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(3),
//                       color: rememberMe ? primaryColor : whiteColor,
//                       border: rememberMe
//                           ? null
//                           : Border.all(color: textFieldBorderColor, width: 1)),
//                   child: rememberMe
//                       ? Icon(Icons.check, color: whiteColor, size: 14)
//                       : const SizedBox(),
//                 ).onTap(() {
//                   rememberMe = !rememberMe;
//                   setStatee(() {});
//                 }),
//                 hGap(6.0),
//                 InkWell(
//                   borderRadius: BorderRadius.circular(10.0),
//                   onTap: () {
//                     rememberMe = !rememberMe;
//                     setStatee(() {});
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 10, vertical: 2.0),
//                     child: TextView(
//                       StringHelper.rememberMe,
//                       style: black17_400().copyWith(color: greyColor),
//                     ),
//                   ),
//                 ),
//                 const Spacer(),
//                 InkWell(
//                   borderRadius: BorderRadius.circular(10.0),
//                   onTap: () {
//                     Navigator.pushNamed(context, RouteName.forgotPassword);
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 10, vertical: 2.0),
//                     child: TextView(
//                       StringHelper.forgotPassword,
//                       style: primaryColor17_600(),
//                     ),
//                   ),
//                 )
//               ],
//             );
//           }),
//           vGap(60),
//
//           _signInButton (),
//         ],
//       ),
//     ).marginSymmetric(
//         horizontal: isWebView ? 0 : SITE_PADDING_HORIZONRAL_MOBILE);
//   }
//
//
//   Widget _signInButton () {
//     return BlocProvider(
//       create: (BuildContext context) => SignInCubit(),
//       child: BlocConsumer<SignInCubit, SignInState>(
//         listener: (context, state){
//           if(state is SignInLoaded){
//             if(state.signInModel.status == true){
//               Navigator.pushNamedAndRemoveUntil(context, RouteName().initialRoute(), (route) => false);
//             }else{
//             }
//           }
//         },
//           builder: (context, state) {
//           return CommonButton(
//             onPress: (){
//               if(state is SignInLoading){
//
//               }else{
//                 if(_formKey.currentState!.validate()){
//                   context.read<SignInCubit>().signIn(
//                       emailController.text.toString(),
//                       passwordController.text.toString(),
//                       rememberMe
//                   );
//                 }
//               }
//
//             },
//             child: state is SignInLoading? loadingButton(): Text('Sign in', style: buttonStyle),
//           );
//         }
//       ),
//     );
//   }
//
//   _socialLogins() {
//     return Column(
//       children: [
//         TextView(
//           StringHelper.orConnectWithSocial,
//           style: white16_400().copyWith(color: hintTextColor.withOpacity(0.70)),
//         ),
//         vGap(margin_15),
//         const GoogleLogInButton(),
//         vGap(25),
//       ],
//     ).marginSymmetric(horizontal: 20.0);
//   }
//
//   Widget signupLink() {
//     return RichText(
//         text: TextSpan(
//             text: StringHelper.dontHaveAccount,
//
//
//             style: hint20_400().copyWith(color: hintTextColor.withOpacity(0.7)),
//             children: [
//           TextSpan(
//             text: StringHelper.signup,
//             style: whiteColor20_700().copyWith(color: primaryColor),
//             recognizer: TapGestureRecognizer()
//               ..onTap = () {
//                 Navigator.pushNamed(context, RouteName.signup);
//               },
//           ),
//         ]));
//   }
//
//   Widget socialLoading() {
//     return SizedBox(
//         height: 20.0,
//         width: 20.0,
//         child: CircularProgressIndicator(
//           color: blackSimilar,
//           strokeWidth: 4.0,
//         ));
//   }
// }

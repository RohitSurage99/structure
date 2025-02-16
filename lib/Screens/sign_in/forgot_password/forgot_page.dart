// import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gib_leads_web/helpers/dimens_helper.dart';
// import 'package:gib_leads_web/screens/sign_in/forgot_password/verify_otp.dart';
// import '../../../components/app_button.dart';
// import '../../../components/back_button_widget.dart';
// import '../../../components/common_widgets.dart';
// import '../../../components/loading_indicator.dart';
// import '../../../components/responsive_widget.dart';
// import '../../../components/text_fiels.dart';
// import '../../../cubits/forgot_password/forgot_password_cubit.dart';
// import '../../../export.dart';
// import '../../../utils/toast_message.dart';
// import '../../common_widgets/footer.dart';
// import '../../common_widgets/header.dart';
// import '../../common_widgets/header_banner_widget.dart';
// import '../../common_widgets/header_without_tabs.dart';
//
// class ForgotPasswordScreen extends StatefulWidget {
//   const ForgotPasswordScreen({super.key});
//
//   @override
//   State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
// }
//
// class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
//   bool isWebView = false;
//   final _formKey = GlobalKey<FormState>();
//   late TextEditingController emailController;
//   late FocusNode emailFocusNode;
//
//   //
//   @override
//   void initState() {
//     emailController = TextEditingController();
//     emailFocusNode = FocusNode();
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       body: Column(
//         children: [
//           const SiteHeaderWithTabs(page: Pages.faqs,),
//
//           Expanded(
//             child: ListView(
//               children: [
//                 HeaderBannerWidget(pageName: StringHelper.forgotPassword,isWebView: isWebView),
//               //  const SiteHeader(page: Pages.signIn),
//               //  const SiteHeaderWithTabs(page: Pages.signIn),
//                // backButtonWidget(context),
//               //  HeaderBannerWidget(pageName: StringHelper.forgotPassword,isWebView: isWebView),
//                 Form(
//                   key: _formKey,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: DimensHelper.dimens_20),
//                     child: Column(
//                       children: [
//
//                         vGap(30),
//                         Text(StringHelper.forgotPassword, style: primary35_700(),textAlign: TextAlign.center,),
//                         vGap(26),
//
//                         ResponsiveWidget(largeScreen: Row(
//                           children: [
//                             const Spacer(),
//                             Expanded(flex: 2,
//                                 child: _form()),
//                             const Spacer(),
//                           ],
//                         ),
//                             mediumScreen:  Row(
//                               children: [
//                                 const Spacer(),
//                                 Expanded(
//                                     flex: 2,
//                                     child: _form()),
//                                 const Spacer(),
//                               ],
//                             ),
//                             smallScreen: _form()),
//                         // SizedBox(
//                         //   width: isWebView ? minimumScreenWidth - 700 : null,
//                         //   child: _form(),
//                         // ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SiteFooter(),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//
//   _form(){
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         TextView(StringHelper.dontWorry,style: hint20_400(),maxLine: 2,textAlign: TextAlign.center),
//         vGap(50),
//         TextView(
//           StringHelper.email,
//           style: hintTextColor18_600().copyWith(color: blackSimilar),
//         ),
//         vGap(8),
//
//         EmailTextField(
//             controller: emailController),
//
//         vGap(50),
//         _forgotPasswordButton (),
//
//         vGap(80),
//       ],
//     );
//   }
//
//   Widget _forgotPasswordButton () {
//     return BlocProvider(
//       create: (BuildContext context) => ForgotPasswordCubit(),
//       child: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
//           listener: (context, state){
//             if(state is ForgotPasswordLoaded){
//               if(state.forgotPasswordModel.status == true){
//                 verifyForgotPasswordOTP( email: emailController.text.toString(), context: context);
//               }else{
//                 toastMessage(StringHelper.enterValidEmail);
//                // (StringHelper.enterValidEmail).showSuccessAlert();
//               }
//             }
//           },
//           builder: (context, state) {
//             return CommonButton(
//               onPress: (){
//
//                 if(_formKey.currentState!.validate()){
//                   context.read<ForgotPasswordCubit>().forgotPassword(email: emailController.text.toString());
//                 }
//               },
//               child: state is ForgotPasswordLoading? loadingButton(): Text(StringHelper.submit, style: buttonStyle),
//             );
//           }
//       ),
//     );
//   }
// }
//
//

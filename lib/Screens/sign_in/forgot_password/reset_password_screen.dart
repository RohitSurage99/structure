// import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../components/app_button.dart';
// import '../../../components/common_widgets.dart';
// import '../../../components/loading_indicator.dart';
// import '../../../components/text_fiels.dart';
// import '../../../cubits/reset_password/reset_password_cubit.dart';
// import '../../../export.dart';
// import '../../../helpers/dimens_helper.dart';
// import '../../../routes/routes_name.dart';
// import '../../../utils/toast_message.dart';
// import '../../common_widgets/footer.dart';
// import '../../common_widgets/header.dart';
// import '../../common_widgets/header_banner_widget.dart';
// import '../../common_widgets/header_without_tabs.dart';
//
//
// class ResetPasswordScreen extends StatefulWidget {
//   final Map args;
//   const ResetPasswordScreen({super.key, required this.args});
//   @override
//   State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
// }
//
// class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
//   bool isWebView = false;
//    final TextEditingController passwordController =  TextEditingController();
//   final  TextEditingController confirmPasswordController = TextEditingController();
//   final FocusNode passwordFocusNode = FocusNode();
//    final FocusNode confirmPasswordFocusNode = FocusNode();
//
//   final _formKey = GlobalKey<FormState>();
//   String email = '';
//
//   @override
//   void initState() {
//     debugPrint('Args: ${widget.args.toString()}');
//     if(widget.args.containsKey('email')){
//       email = widget.args['email'];
//     }
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
//     print('forgot ${arguments['data']}');
//
//     isWebView = MediaQuery.of(context).size.width > minimumScreenWidth;
//     return Scaffold(
//       body: Column(
//         children: [
//           const SiteHeaderWithTabs(page: Pages.resetpassword,),
//
//           Expanded(
//             child: ListView(
//               children: [
//                 HeaderBannerWidget(pageName: StringHelper.resetPassword,isWebView: isWebView),
//                // const SiteHeader(page: Pages.signIn),
//               //  const SiteHeaderWithTabs(page: Pages.resetpassword),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: DimensHelper.dimens_20),
//                   child: Form(
//                     key: _formKey,
//                     child: Column(
//                       children: [
//                         HeaderBannerWidget(pageName: StringHelper.resetPassword, isWebView: isWebView),
//                         vGap(30),
//                         Text(
//                           StringHelper.resetPassword,
//                           style: primary35_700(),
//                           textAlign: TextAlign.center,
//                         ),
//                         vGap(26),
//                         SizedBox(
//                           width: isWebView ? minimumScreenWidth - 700 : null,
//                           child: _form(),
//                         ),
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
//   _form() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         TextView(
//           StringHelper.enterPassword,
//           style: hintTextColor18_600().copyWith(color: blackSimilar),
//         ),
//         vGap(8),
//         PasswordTextField(
//           controller: passwordController,
//           currentFocus: passwordFocusNode,
//         hintText: StringHelper.enterPassword,
//         nextFocus: confirmPasswordFocusNode),
//
//         vGap(24),
//         TextView(
//           StringHelper.confirmPassword,
//           style: hintTextColor18_600().copyWith(color: blackSimilar),
//         ),
//
//         vGap(8),
//         PasswordTextField(
//             controller: confirmPasswordController,
//             currentFocus: confirmPasswordFocusNode,
//             hintText: StringHelper.confirmPassword,),
//
//         vGap(60),
//         _submitButton(),
//         vGap(24),
//       ],
//     );
//   }
//
//   Widget _submitButton () {
//     return BlocProvider(
//       create: (BuildContext context) => ResetPasswordCubit(),
//       child: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
//           listener: (context, state){
//             if(state is ResetPasswordLoaded){
//               if(state.resetPasswordModel.status == true){
//                 toastMessage(state.resetPasswordModel.message??"");
//                 //(state.resetPasswordModel.message??"").showSuccessAlert();
//                 Navigator.pushNamedAndRemoveUntil(context, RouteName.signup, (route) => false);
//               }else{
//                 toastMessage(state.resetPasswordModel.message??"");
//                 //(StringHelper.somethingWentWrong).showSuccessAlert();
//               }
//             }
//           },
//           builder: (context, state) {
//             return CommonButton(
//               onPress: (){
//                 if(state is ResetPasswordLoading){
//
//                 }else{
//                   if(_formKey.currentState!.validate()){
//
//                     if(passwordController.text.toString() != confirmPasswordController.text.toString()){
//                    //   (StringHelper.passwordsMismatch).showSuccessAlert();
//                       toastMessage(StringHelper.passwordsMismatch);
//                     }else{
//                       context.read<ResetPasswordCubit>().resetPassword(email: email, password: passwordController.text.toString());
//                     }
//                   }
//                 }
//
//               },
//               child: state is ResetPasswordLoading? loadingButton(): Text(StringHelper.submit, style: buttonStyle),
//             );
//           }
//       ),
//     );
//   }
//
// }

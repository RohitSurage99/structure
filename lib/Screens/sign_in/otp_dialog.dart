// import 'dart:async';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:pinput/pinput.dart';
// import '../../components/app_button.dart';
// import '../../components/common_widgets.dart';
// import '../../components/loading_indicator.dart';
// import '../../cubits/resend_signup_otp/resend_signup_otp_cubit.dart';
// import '../../cubits/signup_verify_otp/signup_verify_otp_cubit.dart';
// import '../../export.dart';
// import '../../helpers/color_helper.dart';
// import '../../helpers/font_helper.dart';
// import '../../main.dart';
// import '../../models/otp_not_varified_model.dart';
// import '../../utils/toast_message.dart';
//
//
// checkOTPStatus (Map<String, dynamic> response){
//
//   try{
//     OTPNotVarifiedModel otpNotVarifiedModel = OTPNotVarifiedModel.fromJson(response);
//     otpVerifyOTPIfNoteVerified(context: navigatorKey.currentContext!,
//         name: otpNotVarifiedModel.data?.user?.name??"",
//         email: otpNotVarifiedModel.data?.user?.email??"",
//         password: otpNotVarifiedModel.data?.user?.password??"",);
//   }catch (e){
//     debugPrint('Error==> ${e.toString()}');
//   }
// }
//
// otpVerifyOTPIfNoteVerified(
//     {required BuildContext context,required String name,
//     required String email, required String password,}) {
//   showGeneralDialog(
//     context: context,
//     barrierColor: Colors.black12.withOpacity(0.6), // Background color
//     barrierDismissible: false,
//     barrierLabel: 'Dialog',
//     transitionDuration: const Duration(milliseconds: 400),
//     pageBuilder: (context, __, ___) {
//       return AlertDialog(
//         backgroundColor: ColorHelper.whiteColor,
//         shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.all(Radius.circular(10.0))),
//         content: BlocProvider(
//             create: (BuildContext context) => ResendSignupOtpCubit(),
//             child: OtpVerifiedView(email: email,)),
//       );
//     },
//   );
// }
//
// class OtpVerifiedView extends StatefulWidget {
//   final String email;
//   const OtpVerifiedView({super.key, required this.email,});
//
//   @override
//   State<OtpVerifiedView> createState() => _OtpVerifiedViewState();
// }
//
// class _OtpVerifiedViewState extends State<OtpVerifiedView> {
//   final formGlobalKey = GlobalKey<FormState>();
//   TextEditingController otpController = TextEditingController();
//
//
//
//   final StreamController<int> _controller = StreamController<int>();
//   Timer? _timer;
//   int _secondsLeft = 60;
//
//   Map userSignupData = {};
//
//   @override
//   void initState() {
//     startTimer ();
//     context.read<ResendSignupOtpCubit>().resendSignUpOtp(widget.email);
//     super.initState();
//   }
//
//
//   @override
//   void dispose() {
//     _timer?.cancel();
//     _controller.close();
//     super.dispose();
//   }
//
//
//   startTimer () {
//     _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer){
//       if (_secondsLeft > 0) {
//         setState(() {
//           _secondsLeft--;
//         });
//         _controller.add(_secondsLeft);
//       } else {
//         _timer?.cancel();
//       }
//     });
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return _mainBuild();
//   }
//
//   _mainBuild() {
//     return SizedBox(
//       width: fullWidthScreen(context: context)/2,
//       // height: fullHeightScreen(context: context)/2,
//       child: Material(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const SizedBox(),
//                   TextView("Enter OTP", style: blackColor25_700()),
//                   InkWell(
//                       onTap: () {
//                        Navigator.pop(context);
//                       },
//                       child: Icon(
//                         Icons.close,
//                         color: appColor,
//                       ))
//                 ],
//               ),
//               vGap(4),
//               RichText(
//                 textAlign: TextAlign.center,
//                 text: TextSpan(
//                     text: "An 4 digit code has been sent to ",
//                     style: const TextStyle(color: ColorHelper.blackColor, fontWeight: FontHelper.medium, fontSize: FontHelper.size_20),
//                     children: [
//                       TextSpan(
//                         text: widget.email,
//                         style: const TextStyle(color: ColorHelper.blackColor, fontWeight: FontHelper.bold, fontSize: FontHelper.size_20),
//                       )
//                     ]),
//               ),
//               vGap(44),
//               Form(
//                 key: formGlobalKey,
//                 child: SizedBox(
//                   // width: fullWidthScreen(context: context)/2,
//                   child: Pinput(
//                     errorPinTheme: PinTheme(
//                         width: 62.0,
//                         height: 62.0,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(radius_10),
//                           border:
//                               Border.all(width: 0.6, color: Colors.deepOrange),
//                         )),
//                     defaultPinTheme: PinTheme(
//                         width: 62.0,
//                         height: 62.0,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(radius_10),
//                           border:
//                               Border.all(width: 0.6, color: textFieldBorderColor),
//                         )),
//                     controller: otpController,
//                     validator: (value) {
//                       return value?.validateOtp();
//                     },
//                     pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   ),
//                 ),
//               ),
//               vGap(56),
//
//               BlocProvider(
//                 create: (BuildContext context) => SignupVerifyOtpCubit(),
//                 child: BlocConsumer<SignupVerifyOtpCubit, SignupVerifyOtpState>(
//                     listener: (context, state){
//                       if(state is SignupVerifyOtpLoaded){
//                         if(state.signUpVerifyOTPModel.status == true){
//                           toastMessage(state.signUpVerifyOTPModel.message??"");
//                          // (state.signUpVerifyOTPModel.message??"").showSuccessAlert();
//                           Navigator.pop(context);
//                         }else{
//                         // (StringHelper.invalidOTP).showSuccessAlert();
//                         }
//                       }
//                     },
//                     builder: (context, state) {
//                     return CommonButton(
//                         onPress: (){
//                           if(state is SignupVerifyOtpLoading){
//
//                           }else{
//                             if(formGlobalKey.currentState!.validate()){
//                               context.read<SignupVerifyOtpCubit>().verifySignupOTP(
//                                   email: widget.email,
//                                   otp: otpController.text.toString());
//                             }
//                           }
//                         },
//                       child: state is SignupVerifyOtpLoading? loadingButton(): Text(StringHelper.verify, style: buttonStyle,),
//                     );
//                   }
//                 ),
//               ),
//
//               vGap(30),
//               BlocProvider(
//                 create: (_) => ResendSignupOtpCubit(),
//                 child: BlocConsumer<ResendSignupOtpCubit, ResendSignupOtpState>(
//                   listener: (context, state){
//                     if(state is ResendSignupOtpLoaded){
//                       toastMessage(state.resendSignUpOTPModel.message??"");
//                      // (state.resendSignUpOTPModel.message??"").showSuccessAlert();
//                     }
//                   },
//                     builder: (context, state) {
//                     return StreamBuilder<int>(
//                         stream: _controller.stream,
//                         builder: (context, snapshot) {
//                           if(_secondsLeft != 0){
//                             return Text('${_secondsLeft}s', style: const TextStyle(color: ColorHelper.greyColor, fontSize: FontHelper.size_18, fontWeight: FontHelper.regular),);
//                           }else{
//                             return Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 const Text(StringHelper.didNotReceiveOTP, style: TextStyle(color: ColorHelper.black, fontWeight: FontHelper.medium, fontSize: FontHelper.size_16),),
//                                 GestureDetector(
//                                     onTap: (){
//                                       _secondsLeft = 60; startTimer();
//                                       if(state is ResendSignupOtpLoading){
//
//                                       }else{
//                                         context.read<ResendSignupOtpCubit>().resendSignUpOtp(widget.email);
//                                       }
//
//                                     },
//                                     child: const Text(StringHelper.resendCode, style: TextStyle(color: ColorHelper.primaryColor, fontWeight: FontHelper.bold, fontSize: FontHelper.size_16,decoration: TextDecoration.underline,decorationColor: ColorHelper.primaryColor),))
//                               ],
//                             );
//                           }
//
//                         }
//                     );
//                   }
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

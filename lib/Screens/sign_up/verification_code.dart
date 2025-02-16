//
//
// class VerificationCode extends StatefulWidget {
//   final Map args;
//   const VerificationCode({super.key, required this.args});
//
//   @override
//   State<VerificationCode> createState() => _VerificationCodeState();
// }
//
// class _VerificationCodeState extends State<VerificationCode> {
//
//   final TextEditingController verificationCodeController = TextEditingController();
//
//   final StreamController<int> _controller = StreamController<int>.broadcast();
//   Timer? _timer;
//   int _secondsLeft = 60;
//
//   Map userSignupData = {};
//
//   @override
//   void initState() {
//     printValue(widget.args);
//     if(widget.args.containsKey('userSignupData')){
//       userSignupData = widget.args['userSignupData'];
//     }
//     startTimer ();
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
//   @override
//   Widget build(BuildContext context) {
//     final stringHelper = StringHelper.of(context)!;
//     return Scaffold(
//       appBar: AppBar(
//           leading: const BackButtonWidget()
//       ),
//       body: ListView(
//         padding: const EdgeInsets.symmetric(horizontal: DimensHelper.dimens_20),
//         children: [
//           Text(stringHelper.verificationCode, style: const TextStyle(color: ColorHelper.primaryColor, fontSize: FontHelper.size_22, fontWeight: FontHelper.bold),),
//
//           const SizedBox(height: DimensHelper.dimens_10,),
//           Text(stringHelper.enterTheVerificationCodeSentTo, style: const TextStyle(color: ColorHelper.greyColor, fontSize: FontHelper.size_16, fontWeight: FontHelper.regular),),
//
//           const SizedBox(height: DimensHelper.dimens_10,),
//
//           Text(userSignupData['email']??"", style: const TextStyle(color: ColorHelper.black, fontSize: FontHelper.size_16, fontWeight: FontHelper.extraBold),),
//
//           const SizedBox(height: DimensHelper.dimens_20,),
//
//           PinCodeTextField(
//             appContext: context,
//             length: 4,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             separatorBuilder: (context, i)=> SizedBox(width: 5.w,),
//             // obscureText: false,
//             // obscuringCharacter: '*',
//             pinTheme: PinTheme(
//               shape: PinCodeFieldShape.box,
//               borderRadius: BorderRadius.circular(12),
//               fieldHeight: DimensHelper.dimens_70,
//               fieldWidth: DimensHelper.dimens_60,
//               inactiveFillColor: ColorHelper.whiteColor,
//               inactiveColor: ColorHelper.grey300,
//               selectedColor: ColorHelper.primaryColor,
//               activeFillColor: ColorHelper.whiteColor,
//               activeColor: ColorHelper.grey300,
//               selectedFillColor: ColorHelper.whiteColor,
//             ),
//             animationType: AnimationType.fade,
//             cursorColor: ColorHelper.primaryColor,
//             textStyle: const TextStyle(fontSize: FontHelper.size_22, color: ColorHelper.black, fontWeight: FontHelper.medium),
//             enableActiveFill: true,
//             controller: verificationCodeController,
//             keyboardType: TextInputType.number,
//             onCompleted: (String v){
//               // context.read<VerifyOtpCubit>().otpVarification(routeName,mobileNumber, v, deviceToken);
//             },
//             onChanged: (value) {
//               if(value.length == 4){
//               //  context.read<VerifyOtpCubit>().otpVarification(routeName,mobileNumber, value, deviceToken);
//               }
//             },
//           ),
//
//
//
//           const SizedBox(height: DimensHelper.dimens_30,),
//
//
//           verifyButton(),
//
//           const SizedBox(height: DimensHelper.dimens_30,),
//
//           BlocProvider(
//             create: (_) => ResendOtpCubit(),
//             child: BlocBuilder<ResendOtpCubit, ResendOtpState>(
//                 builder: (context, state) {
//                  return Align(
//                     alignment: Alignment.center,
//                     child: StreamBuilder<int>(
//                         stream: _controller.stream,
//                         builder: (context, snapshot) {
//                           if(_secondsLeft != 0){
//                             return Text('${_secondsLeft}s', style: const TextStyle(color: ColorHelper.greyColor, fontSize: FontHelper.size_18, fontWeight: FontHelper.regular),);
//                           }else{
//                             return Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                  Text(stringHelper.didNotReceiveOTP, style: const TextStyle(color: ColorHelper.black, fontWeight: FontHelper.medium, fontSize: FontHelper.size_16),),
//                                 GestureDetector(
//                                     onTap: (){
//                                       _secondsLeft = 60; startTimer();
//                                       if(state is ResendOtpLoading){
//
//                                       }else{
//                                         context.read<ResendOtpCubit>().resendOtp(userSignupData['email']??"", context);
//                                       }
//
//                                     },
//                                     child: Text(stringHelper.resendCode, style: const TextStyle(color: ColorHelper.primaryColor, fontWeight: FontHelper.bold, fontSize: FontHelper.size_16,decoration: TextDecoration.underline,decorationColor: ColorHelper.primaryColor),))
//                               ],
//                             );
//                           }
//
//                       }
//                     ));
//                }
//              ),
//            ),
//
//
//            const SizedBox(height: DimensHelper.dimens_20),
//           //
//           // Row(
//           //   children: [
//           //     const Text(StringHelper.didNotReceiveOTP, style: TextStyle(color: ColorHelper.black, fontWeight: FontHelper.medium, fontSize: FontHelper.size_16),),
//           //     GestureDetector(
//           //         onTap: (){},
//           //         child: const Text(StringHelper.resendCode, style: TextStyle(color: ColorHelper.primaryColor, fontWeight: FontHelper.bold, fontSize: FontHelper.size_16,decoration: TextDecoration.underline,decorationColor: ColorHelper.primaryColor),)),
//           //   ],
//           // ),
//         ],
//       ),
//     );
//   }
//
//
//   Widget verifyButton () {
//     final stringHelper = StringHelper.of(context)!;
//     return BlocProvider(
//       create: (_) => VerifyOtpCubit(),
//       child: BlocBuilder<VerifyOtpCubit, VerifyOtpState>(
//           builder: (context, state) {
//           return CommonButton(
//             onPress: (){
//               if(verificationCodeController.text.length != 4){
//                 toastMessage(stringHelper.enter4DigitOtp);
//               }else {
//                 if(state is VerifyOtpLoading){
//
//                 }else{
//
//                   context.read<VerifyOtpCubit>().verifyOtp(context,userSignupData, int.parse(verificationCodeController.text.toString()));
//                 }
//               }
//               },
//             child: state is VerifyOtpLoading? loadingButton(): Text(stringHelper.verify, style: const TextStyle(color: ColorHelper.whiteColor, fontSize: FontHelper.size_18, fontWeight: FontHelper.bold),),);
//         }
//       ),
//     );
//   }
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
// }

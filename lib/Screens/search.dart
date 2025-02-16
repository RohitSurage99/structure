// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gib_leads_web/cubits/business_associated/business_associated_cubit.dart';
// import 'package:gib_leads_web/export.dart';
// import 'package:gib_leads_web/models/business_associated.dart';
// import 'package:gib_leads_web/screens/search/content_widget.dart';
// import 'package:gib_leads_web/screens/search/search_by_address_widget.dart';
// import '../../components/api_error.dart';
// import '../../components/app_button.dart';
// import '../../components/common_widgets.dart';
// import '../../components/loading_indicator.dart';
// import '../../helpers/color_helper.dart';
// import '../../helpers/dimens_helper.dart';
// import '../../helpers/font_helper.dart';
// import '../common_widgets/header.dart';
// import '../home/business_details_popup.dart';
// import 'details_card.dart';
//
// enum ScreenMode { hybridMode, listMode, mapMode }
//
// class SearchScreen extends StatefulWidget {
//   const SearchScreen({super.key});
//
//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }
//
// class _SearchScreenState extends State<SearchScreen> {
//   bool isWebView = false;
//   ScreenMode screenMode = ScreenMode.hybridMode;
//
//   final TextEditingController searchController = TextEditingController();
//   final TextEditingController distanceController = TextEditingController();
//
//   List<ClientsList> initialClientList = [];
//   List<ClientsList> updateClientList = [];
//
//   final Set<Marker> markers = {};
//
//
//   searchFilter() async {
//     if (searchController.text.trimLeft().isEmpty) {
//       updateClientList = initialClientList;
//       setState(() {});
//     } else {
//       markers.clear();
//       updateClientList = initialClientList
//           .where((element) => (element.name!.toLowerCase().contains(searchController.text.toLowerCase()) ||
//               element.buisnessProfile!.address!.toLowerCase().contains(searchController.text.toLowerCase()) ||
//               element.buisnessProfile!.state!.toLowerCase().contains(searchController.text.toLowerCase()) ||
//               element.buisnessProfile!.user!.toLowerCase().contains(searchController.text.toLowerCase()) ||
//               element.buisnessProfile!.description!.toLowerCase().contains(searchController.text.toLowerCase()) ||
//               element.buisnessProfile!.phone!.toLowerCase().contains(searchController.text.toLowerCase()) ||
//               element.buisnessProfile!.category!.toLowerCase().contains(searchController.text.toLowerCase()) ||
//               element.buisnessProfile!.name!.toLowerCase().contains(searchController.text.toLowerCase())))
//           .toList();
//       setState(() {});
//     }
//
//     for (ClientsList users in updateClientList) {
//       markers.add(Marker(
//           markerId: MarkerId(users.buisnessProfile?.sId ?? ''),
//           position: LatLng(users.buisnessProfile?.lat ?? 0.0, users.buisnessProfile?.long ?? 0.0),
//           icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
//           onTap: () {
//             businessDetailsPopUp( context, users);
//             // detailCard(context, users);
//           }));
//
//       setState(() {});
//       debugPrint('marker added on this points: => lat: ${users.buisnessProfile?.lat ?? 0.0}  ||  lng:  ${users.buisnessProfile?.long ?? 0.0}');
//     }
//   }
//
//   @override
//   void initState() {
//
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       context.read<BusinessAssociatedCubit>().businessAssociated(context, distance: "16");
//     });
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     isWebView = MediaQuery.of(context).size.width > minimumScreenWidth;
//
//     return Scaffold(
//       body: Stack(
//         children: [
//           Padding(
//             padding: EdgeInsets.only(top: isWebView ? 150 : 220),
//             child: BlocConsumer<BusinessAssociatedCubit, BusinessAssociatedState>(listener: (context, state) {
//               if (state is BusinessAssociatedLoaded) {
//                 initialClientList = state.businessAssociatedModel.data!.clients!;
//                 searchFilter();
//               }
//             }, builder: (context, state) {
//               if (state is BusinessAssociatedLoading) {
//                 return SizedBox(
//                   height: 500,
//                   width: double.infinity,
//                   child: Center(
//                     child: loadingIndicator(),
//                   ),
//                 );
//               } else if (state is BusinessAssociatedError) {
//                 return apiError();
//               } else if (state is BusinessAssociatedLoaded) {
//
//                 return ContentWidget(searchController: searchController, screenMode: screenMode, clientList: updateClientList, markers: markers);
//               }
//               return const SizedBox();
//             }),
//           ),
//           Column(
//             children: [
//               const SiteHeaderWithTabs(page: Pages.search),
//               isWebView ? _searchBarWeb() : _searchBarMobile(),
//               // isWebView ? _distanceTextField() : _searchBarMobile(),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   _searchBarWeb() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Visibility(
//           //visible: screenMode == ScreenMode.mapMode? false:true,
//           child: SizedBox(
//             width: fullWidthScreen(context: context) / 3,
//             child: SearchByAddressWidget(
//               pageName: StringHelper.search,
//               isWebView: isWebView,
//               distance: distanceController.text,
//             ),
//             // child: TextFormField(
//             //   controller: searchController,
//             //   cursorColor: ColorHelper.primaryColor,
//             //   keyboardType: TextInputType.text,
//             //   onChanged: (String val){
//             //     searchFilter();
//             //     if(val.isEmpty){
//             //       updateClientList = initialClientList;
//             //
//             //       setState(() {});
//             //     }
//             //   },
//             //   style: const TextStyle(color: ColorHelper.black, fontWeight: FontHelper.medium, fontSize: FontHelper.size_20),
//             //   decoration: InputDecoration(
//             //     hintText: StringHelper.searchReferrer,
//             //     counter: const Offstage(),
//             //     suffixIcon: imageAsset(searchIcon, height: 22, width: 22).marginOnly(right: 30.0),
//             //     contentPadding: const EdgeInsets.symmetric(horizontal: DimensHelper.dimens_30),
//             //     hintStyle: const TextStyle(color: ColorHelper.greyColor, fontWeight: FontHelper.medium, fontSize: FontHelper.size_18),
//             //     enabledBorder: OutlineInputBorder(
//             //       borderRadius: BorderRadius.circular(DimensHelper.dimens_50),
//             //       borderSide: const BorderSide(color: ColorHelper.grey300),
//             //     ),
//             //     disabledBorder: OutlineInputBorder(
//             //       borderRadius: BorderRadius.circular(DimensHelper.dimens_50),
//             //       borderSide: const BorderSide(color: ColorHelper.grey300),
//             //     ),
//             //     border: OutlineInputBorder(
//             //       borderRadius: BorderRadius.circular(DimensHelper.dimens_50),
//             //       borderSide: const BorderSide(color: ColorHelper.grey300),
//             //     ),
//             //     focusedBorder: OutlineInputBorder(
//             //       borderRadius: BorderRadius.circular(DimensHelper.dimens_50),
//             //       borderSide: const BorderSide(color: ColorHelper.primaryColor),
//             //     ),
//             //     errorBorder: OutlineInputBorder(
//             //       borderRadius: BorderRadius.circular(DimensHelper.dimens_50),
//             //       borderSide: const BorderSide(color: ColorHelper.redColor),
//             //     ),
//             //   ),
//             // ),
//           ),
//         ),
//         // hGap(45.0),
//         Visibility(
//           //visible: screenMode == ScreenMode.mapMode? false:true,
//           child: SizedBox(
//             width: fullWidthScreen(context: context) / 3,
//             child: _distanceTextField()
//           ),
//         ),
//         hGap(45.0),
//         Expanded(
//           child: CommonButton2(
//             onPress: () {
//               setState(() {
//                 screenMode = ScreenMode.hybridMode;
//               });
//             },
//             isSelected: screenMode == ScreenMode.hybridMode,
//             bgColor: screenMode == ScreenMode.hybridMode
//                 ? ColorHelper.primaryColor
//                 : ColorHelper.whiteColor,
//             buttonText: StringHelper.hybridMode,
//           ),
//         ),
//         // Expanded(
//         //   child: CommonButton(
//         //     onPress: () {
//         //       screenMode = ScreenMode.hybridMode;
//         //       setState(() {});
//         //     },
//         //     bgColor: screenMode == ScreenMode.hybridMode ? ColorHelper.primaryColor : ColorHelper.whiteColor,
//         //     child: Padding(
//         //       padding: const EdgeInsets.all(8.0),
//         //       child: AutoSizeText(
//         //         StringHelper.hybridMode,
//         //         style: buttonStyle.copyWith(color: screenMode == ScreenMode.hybridMode ? ColorHelper.whiteColor : ColorHelper.primaryColor),
//         //       ),
//         //     ),
//         //   ),
//         // ),
//         hGap(45.0),
//         Expanded(
//           child: CommonButton2(
//             onPress: () {
//               setState(() {
//                 screenMode = ScreenMode.listMode;
//               });
//             },
//             isSelected: screenMode == ScreenMode.listMode,
//             bgColor: screenMode == ScreenMode.listMode
//                 ? ColorHelper.primaryColor
//                 : ColorHelper.whiteColor,
//             buttonText: StringHelper.listMode,
//           ),
//         ),
//         // Expanded(
//         //   child: CommonButton(
//         //     onPress: () {
//         //       screenMode = ScreenMode.listMode;
//         //       setState(() {});
//         //     },
//         //     bgColor: screenMode == ScreenMode.listMode ? ColorHelper.primaryColor : ColorHelper.whiteColor,
//         //     child: Padding(
//         //       padding: const EdgeInsets.all(8.0),
//         //       child: AutoSizeText(
//         //         StringHelper.listMode,
//         //         style: buttonStyle.copyWith(color: screenMode == ScreenMode.listMode ? ColorHelper.whiteColor : ColorHelper.primaryColor),
//         //       ),
//         //     ),
//         //   ),
//         // ),
//         hGap(45.0),
//         Expanded(
//           child: CommonButton2(
//             onPress: () {
//               setState(() {
//                 screenMode = ScreenMode.mapMode;
//               });
//             },
//             isSelected: screenMode == ScreenMode.mapMode,
//             bgColor: screenMode == ScreenMode.mapMode
//                 ? ColorHelper.primaryColor
//                 : ColorHelper.whiteColor,
//             buttonText: StringHelper.mapMode,
//           ),
//         ),
//         // Expanded(
//         //   child: CommonButton(
//         //     onPress: () {
//         //       screenMode = ScreenMode.mapMode;
//         //       setState(() {});
//         //     },
//         //     bgColor: screenMode == ScreenMode.mapMode ? ColorHelper.primaryColor : ColorHelper.whiteColor,
//         //     child: Padding(
//         //       padding: const EdgeInsets.all(8.0),
//         //       child: AutoSizeText(
//         //         StringHelper.mapMode,
//         //         style: buttonStyle.copyWith(color: screenMode == ScreenMode.mapMode ? ColorHelper.whiteColor : ColorHelper.primaryColor),
//         //       ),
//         //     ),
//         //   ),
//         // ),
//       ],
//     ).paddingOnly(left: SITE_PADDING_HORIZONRAL,right: SITE_PADDING_HORIZONRAL);
//   }
//
//   _searchBarMobile() {
//     return SizedBox(
//       height: MediaQuery.of(context).size.height/3.0,
//       // height: 400,
//       child: Stack(
//         // mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Expanded(
//                 child: CommonButton2(
//                   onPress: () {
//                     setState(() {
//                       screenMode = ScreenMode.hybridMode;
//                     });
//                   },
//                   isSelected: screenMode == ScreenMode.hybridMode,
//                   bgColor: screenMode == ScreenMode.hybridMode
//                       ? ColorHelper.primaryColor
//                       : ColorHelper.whiteColor,
//                   buttonText: StringHelper.hybridMode,
//                 ),
//               ),
//               // Expanded(
//               //   child: CommonButton(
//               //     onPress: () {
//               //       screenMode = ScreenMode.hybridMode;
//               //       setState(() {});
//               //     },
//               //     bgColor: screenMode == ScreenMode.hybridMode ? ColorHelper.primaryColor : ColorHelper.whiteColor,
//               //     child: Padding(
//               //       padding: const EdgeInsets.all(8.0),
//               //       child: AutoSizeText(
//               //         StringHelper.hybridMode,
//               //         style: buttonStyle.copyWith(color: screenMode == ScreenMode.hybridMode ? ColorHelper.whiteColor : ColorHelper.primaryColor),
//               //       ),
//               //     ),
//               //   ),
//               // ),
//               hGap(20.0),
//               Expanded(
//                 child: CommonButton2(
//                   onPress: () {
//                     setState(() {
//                       screenMode = ScreenMode.listMode;
//                     });
//                   },
//                   isSelected: screenMode == ScreenMode.listMode,
//                   bgColor: screenMode == ScreenMode.listMode
//                       ? ColorHelper.primaryColor
//                       : ColorHelper.whiteColor,
//                   buttonText: StringHelper.listMode,
//                 ),
//               ),
//               // Expanded(
//               //   child: CommonButton(
//               //     onPress: () {
//               //       screenMode = ScreenMode.listMode;
//               //       setState(() {});
//               //     },
//               //     bgColor: screenMode == ScreenMode.listMode ? ColorHelper.primaryColor : ColorHelper.whiteColor,
//               //     buttonText: StringHelper.listMode,
//               //     // child: Padding(
//               //     //   padding: const EdgeInsets.all(8.0),
//               //     //   child: AutoSizeText(
//               //     //     StringHelper.listMode,
//               //     //     style: buttonStyle.copyWith(color: screenMode == ScreenMode.listMode ? ColorHelper.whiteColor : ColorHelper.primaryColor),
//               //     //   ),
//               //     // ),
//               //   ),
//               // ),
//               hGap(20.0),
//               Expanded(
//                 child: CommonButton2(
//                   onPress: () {
//                     setState(() {
//                       screenMode = ScreenMode.mapMode;  // Update your screen mode.
//                     });
//                   },
//                   isSelected: screenMode == ScreenMode.mapMode,  // Pass selection state.
//                   bgColor: screenMode == ScreenMode.mapMode
//                       ? ColorHelper.primaryColor
//                       : ColorHelper.whiteColor,
//                   buttonText: StringHelper.mapMode,
//                 ),
//               ),
//
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 70),
//             child: Visibility(
//               // visible: screenMode == ScreenMode.mapMode? false:true,
//               child: Container(
//                 width: double.maxFinite,
//                 color: ColorHelper.whiteColor,
//                 child: Column(
//                   children: [
//                     SearchByAddressWidget(
//                       pageName: StringHelper.search,
//                       isWebView: isWebView,
//                       distance: distanceController.text,
//                     ),
//                     const SizedBox(height: 10.0),
//                     _distanceTextField(),
//                     // SearchByAddressWidget(
//                     //   pageName: StringHelper.search,
//                     //   isWebView: isWebView,
//                     //   distance: distanceController.text,
//                     // ),
//                   ],
//                 ),
//               ),
//               /*child: TextFormField(
//                 controller: searchController,
//                 cursorColor: ColorHelper.primaryColor,
//                 keyboardType: TextInputType.text,
//                 onChanged: (String val){
//                   searchFilter();
//                   if(val.isEmpty){
//                     updateClientList = initialClientList;
//                     setState(() {});
//                   }
//                 },
//                 style: const TextStyle(color: ColorHelper.black, fontWeight: FontHelper.medium, fontSize: FontHelper.size_20),
//                 decoration: InputDecoration(
//                   hintText: StringHelper.searchReferrer,
//                   counter: const Offstage(),
//                   suffixIcon: imageAsset(searchIcon, height: 22, width: 22).marginOnly(right: 30.0),
//                   contentPadding: const EdgeInsets.symmetric(horizontal: DimensHelper.dimens_30),
//                   hintStyle: const TextStyle(color: ColorHelper.greyColor, fontWeight: FontHelper.medium, fontSize: FontHelper.size_18),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(DimensHelper.dimens_50),
//                     borderSide: const BorderSide(color: ColorHelper.grey300),
//                   ),
//                   disabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(DimensHelper.dimens_50),
//                     borderSide: const BorderSide(color: ColorHelper.grey300),
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(DimensHelper.dimens_50),
//                     borderSide: const BorderSide(color: ColorHelper.grey300),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(DimensHelper.dimens_50),
//                     borderSide: const BorderSide(color: ColorHelper.primaryColor),
//                   ),
//                   errorBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(DimensHelper.dimens_50),
//                     borderSide: const BorderSide(color: ColorHelper.redColor),
//                   ),
//                 ),
//               ),*/
//             ),
//           ),
//           // Padding(
//           //   padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/5.5),
//           //   child: Visibility(
//           //     //visible: screenMode == ScreenMode.mapMode? false:true,
//           //     child: _distanceTextField(),
//           //   ),
//           // ),
//         ],
//       ).paddingSymmetric(vertical: 20.0,horizontal: SITE_PADDING_HORIZONRAL_MOBILE),
//     );
//   }
//
//   _distanceTextField() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Flexible(
//           child: SizedBox(
//             width: isWebView ?  fullWidthScreen(context: context) : MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height * 0.07,
//             child: TextFormField(
//               controller: searchController,
//               cursorColor: ColorHelper.primaryColor,
//               keyboardType: TextInputType.text,
//               style: const TextStyle(
//                   color: ColorHelper.black,
//                   fontWeight: FontHelper.medium,
//                   fontSize: FontHelper.size_20
//               ),
//               decoration: InputDecoration(
//                 hintText: StringHelper.searchStore,
//                 counter: const Offstage(),
//                 suffixIcon: CommonButton(
//                   width: 100,
//                   height: 35.0,
//                   onPress: () {
//                     searchFilter();
//                     // context.read<BusinessAssociatedCubit>().businessAssociated(
//                     //     context,
//                     //     distance: distanceController.text.toString()
//                     // );
//                   },
//                   buttonText: 'Search',
//                 ).paddingAll(8.0),
//                 contentPadding: const EdgeInsets.symmetric(horizontal: DimensHelper.dimens_30), // Adjust padding
//                 hintStyle: const TextStyle(
//                     color: ColorHelper.greyColor,
//                     fontWeight: FontHelper.medium,
//                     fontSize: FontHelper.size_18
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(DimensHelper.dimens_50),
//                   borderSide: const BorderSide(color: ColorHelper.grey300),
//                 ),
//                 disabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(DimensHelper.dimens_50),
//                   borderSide: const BorderSide(color: ColorHelper.grey300),
//                 ),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(DimensHelper.dimens_50),
//                   borderSide: const BorderSide(color: ColorHelper.grey300),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(DimensHelper.dimens_50),
//                   borderSide: const BorderSide(color: ColorHelper.primaryColor),
//                 ),
//                 errorBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(DimensHelper.dimens_50),
//                   borderSide: const BorderSide(color: ColorHelper.redColor),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(width: DimensHelper.dimens_12),
//         Visibility(
//           // visible: distanceController.text.isNotEmpty,
//           visible: searchController.text.isNotEmpty,
//           child: CommonButton(
//             width: 100,
//             height: 40,
//             onPress: () {
//               searchController.clear();
//               searchFilter();
//               // distanceController.clear();
//               // context.read<BusinessAssociatedCubit>().businessAssociated(context, distance: distanceController.text.toString()??'');
//             },
//             buttonText: 'Restart',
//           ).paddingAll(8.0),
//         ),
//       ],
//     ).paddingOnly(left:isWebView ? 0.0: MediaQuery.of(context).size.width / SITE_PADDING_HORIZONRAL);
//   }
//
//
//
//
//
//
//
// }

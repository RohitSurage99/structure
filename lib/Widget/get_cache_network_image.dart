// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import '../helpers/color_helper.dart';
// import '../helpers/dimens_helper.dart';
// import '../network_manager/api_helper.dart';
//
// Widget networkImage(
//     {required String url, BoxFit? boxFit}) {
//
//   String imageUrl = url;
//   if(imageUrl.contains('https')){
//
//   }else{
//     imageUrl = "${ApiHelper.baseUrl}/$imageUrl";
//   }
//
//   return CachedNetworkImage(
//     width: double.infinity,
//     height: double.infinity,
//     imageUrl: imageUrl,
//     matchTextDirection: true,
//     fit:boxFit,
//     placeholder: (context, String val) {
//       return Container(
//         height: double.infinity,
//         width: double.infinity,
//         decoration: const BoxDecoration(shape: BoxShape.circle),
//         child: const Center(
//           child: CupertinoActivityIndicator(color: ColorHelper.greyColor,),
//         ),
//       );
//     },
//     errorWidget: (BuildContext context, String message, dynamic obj) {
//       return const Center(
//           child: Icon(
//               Icons.image,
//               color: ColorHelper.grey300,
//               size: DimensHelper.dimens_50
//           ));
//     },
//   );
// }
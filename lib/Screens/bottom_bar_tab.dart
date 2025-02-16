// import 'package:dummy/main.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../Helper/color_helper.dart';
// import '../Helper/storage_helper.dart';
// import '../Utils/Cubits/get_user_details/get_user_details_cubit.dart';
//
// class BottomBarTabs extends StatefulWidget {
//   const BottomBarTabs({super.key});
//
//   @override
//   State<BottomBarTabs> createState() => _BottomBarTabsState();
// }
//
// class _BottomBarTabsState extends State<BottomBarTabs> {
//
//   int _selectedIndex = 0;
//   static final List<Widget> _widgetOptions = [
//      MyHomePage(),
//     // const MyOrderScreen(),
//     // const SettingsScreen(),
//   ];
//   void _onItemTapped(int index){
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   void initState() {
//     // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//     //   context.read<GetUserDetailsCubit>().getUserDetails(context);
//     //   if(StorageHelper().getTutorialCoachMark()){
//     //     createTutorial();
//     //   }
//     // });
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<GetUserDetailsCubit, GetUserDetailsState>(
//         listener: (context, state){
//           if(state is GetUserDetailsLoaded){
//             // if(StorageHelper().getTutorialCoachMark()){
//             //   Future.delayed(Duration.zero, showTutorial);
//             // }
//           }
//         },
//         builder: (context, state) {
//           if(state is GetUserDetailsNetworkError){
//             return Text("please check your internet.");
//           }else if(state is GetUserDetailsLoading) {
//             return userDataLoading ();
//           }else if (state is GetUserDetailsLoaded){
//             return userDataLoaded ();
//           }else if (state is GetUserDetailsError){
//             return userDataError ();
//           }
//           return const SizedBox();
//         }
//     );
//   }
//
//   Widget userDataLoaded () {
//     final stringHelper = StringHelper.of(context)!;
//
//     return DoublePressToExit(
//       child: Scaffold(
//         body: IndexedStack(
//           index: _selectedIndex,
//           children: _widgetOptions,
//           // child: Center(child: _widgetOptions[_selectedIndex])),
//         ),
//         // body: _widgetOptions[_selectedIndex],
//         bottomNavigationBar: BottomNavigationBar(
//           backgroundColor: ColorHelper.primaryColor,
//           currentIndex: _selectedIndex,
//           onTap: _onItemTapped,
//           elevation: 10,
//           selectedItemColor: ColorHelper.whiteColor,
//           unselectedItemColor: ColorHelper.whiteColor,
//           type: BottomNavigationBarType.fixed,
//           items:  <BottomNavigationBarItem> [
//             BottomNavigationBarItem(
//                 key: homeKey,
//                 icon: const Icon(Icons.home_outlined),
//                 activeIcon: const Icon(Icons.home_filled),label: stringHelper.home),
//             BottomNavigationBarItem(
//                 key: myOrderKey,
//                 icon: const Icon(Icons.shopping_cart_outlined),
//                 activeIcon: const Icon(Icons.shopping_cart_sharp),label: stringHelper.seeAll),
//             BottomNavigationBarItem(
//                 key: settingsKey,
//                 icon: const Icon(Icons.settings_outlined),
//                 activeIcon: const Icon(Icons.settings),label: stringHelper.settings),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget userDataLoading () {
//     return Scaffold(
//       backgroundColor: ColorHelper.whiteColor,
//       body: Center(
//         child: CircularProgressIndicator(),
//       ),
//     );
//   }
//
//   Widget userDataError () {
//     return  Scaffold(
//       backgroundColor: ColorHelper.whiteColor,
//       body: Center(
//         child: Text(stringHelper.somethingWentWrong,
//           style: const TextStyle(fontWeight: FontHelper.medium, color: ColorHelper.blackColor, fontSize: FontHelper.size_18),),
//       ),
//     );
//   }
//
//
//
//
//
//
// }

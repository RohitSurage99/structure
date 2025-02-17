// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// // Cubit for handling the data
// class DataCubit extends Cubit<List<Map<String, String>>> {
//   final List<Map<String, String>> data;

//   DataCubit(this.data) : super(data);

//   void searchData(String query) {
//     final filteredData = data.where((row) {
//       return row["name"]!.toLowerCase().contains(query.toLowerCase()) ||
//           row["live"]!.toLowerCase().contains(query.toLowerCase()) ||
//           row["clg status"]!.toLowerCase().contains(query.toLowerCase()) ||
//           row["job status"]!.toLowerCase().contains(query.toLowerCase());
//     }).toList();

//     emit(filteredData); // Emit the filtered data
//   }
// }

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Data Table with Cubit',
//       theme: ThemeData(
//         primarySwatch: Colors.teal,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: BlocProvider(
//         create: (_) => DataCubit([
//           {"name": "Sharma Ji", "live": "Indore", "clg status": "College pass", "job status": "Yes"},
//           // Add more data here
//         ]),
//         child: DataTablePage(),
//       ),
//     );
//   }
// }

// class DataTablePage extends StatefulWidget {
//   @override
//   _DataTablePageState createState() => _DataTablePageState();
// }

// class _DataTablePageState extends State<DataTablePage> {
//   TextEditingController searchController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     searchController.addListener(() {
//       // Trigger search on text change
//       BlocProvider.of<DataCubit>(context).searchData(searchController.text);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Stylish Data Table with Cubit'),
//         centerTitle: true,
//         backgroundColor: Colors.teal,
//         elevation: 10,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Stylish Search Bar
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(50),
//                 color: Colors.teal.withOpacity(0.1),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.teal.withOpacity(0.3),
//                     blurRadius: 10,
//                     offset: Offset(0, 4),
//                   )
//                 ],
//               ),
//               child: TextField(
//                 controller: searchController,
//                 decoration: InputDecoration(
//                   hintText: 'Search...',
//                   hintStyle: TextStyle(color: Colors.teal[700]),
//                   prefixIcon: Icon(Icons.search, color: Colors.teal),
//                   border: InputBorder.none,
//                   contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             // Bloc Consumer to Listen to State Changes
//             Expanded(
//               child: BlocBuilder<DataCubit, List<Map<String, String>>>(
//                 builder: (context, filteredData) {
//                   return SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Card(
//                       elevation: 8,
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//                       child: DataTable(
//                         headingRowColor: MaterialStateProperty.all(Colors.teal[200]),
//                         columnSpacing: 20,
//                         columns: [
//                           DataColumn(
//                             label: Text(
//                               'Name',
//                               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.teal[800]),
//                             ),
//                           ),
//                           DataColumn(
//                             label: Text(
//                               'Live',
//                               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.teal[800]),
//                             ),
//                           ),
//                           DataColumn(
//                             label: Text(
//                               'College Status',
//                               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.teal[800]),
//                             ),
//                           ),
//                           DataColumn(
//                             label: Text(
//                               'Job Status',
//                               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.teal[800]),
//                             ),
//                           ),
//                         ],
//                         rows: filteredData.map((row) {
//                           return DataRow(
//                             color: MaterialStateProperty.resolveWith((states) {
//                               if (states.contains(MaterialState.selected)) {
//                                 return Colors.teal.withOpacity(0.3);
//                               }
//                               return null;
//                             }),
//                             cells: [
//                               DataCell(Text(row['name']!, style: TextStyle(fontSize: 16))),
//                               DataCell(Text(row['live']!, style: TextStyle(fontSize: 16))),
//                               DataCell(Text(row['clg status']!, style: TextStyle(fontSize: 16))),
//                               DataCell(Text(row['job status']!, style: TextStyle(fontSize: 16))),
//                             ],
//                           );
//                         }).toList(),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// enum Environment {dev, prod}
//
// abstract class AppEnvironment {
//
//   static late String baseUrl;
//   static late Environment _environment;
//   static Environment get environment => _environment;
//
//   static setUpEnv(Environment env){
//     _environment = env;
//
//     switch (env){
//       case Environment.prod:
//          baseUrl = '';
//         break;
//
//       case Environment.dev:
//         baseUrl = '';
//         break;
//
//       default:
//         baseUrl = "";
//         break;
//     }
//   }
// }